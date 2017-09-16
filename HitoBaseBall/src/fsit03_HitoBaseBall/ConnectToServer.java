package fsit03_HitoBaseBall;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.sun.org.apache.bcel.internal.generic.ALOAD;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;


@WebServlet("/ConnectToServer")
public class ConnectToServer extends HttpServlet {
	private String home, opp, date;
	private Gson gson;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		//PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		String option = request.getParameter("option");
		home = request.getParameter("home");
		opp = request.getParameter("opp");
		date = request.getParameter("date");
		
		if(option.equals("0") || option.equals("1")) {
			//OutputStreamWriter writer = new OutputStreamWriter(response.getOutputStream());
			System.out.println(option + ":"+home+":"+opp);
			ObjectOutputStream writer = new ObjectOutputStream(response.getOutputStream());
			gson = new Gson();
			//String json = gson.toJson(getData(option));
            //writer.write(json);
			writer.writeObject(getData(option, request));
            writer.flush();
            writer.close();	
		}else if(option.equals("2")){
			String iid = initGame(home, opp, date);
			ObjectOutputStream writer = new ObjectOutputStream(response.getOutputStream());
			writer.writeObject(iid);
            writer.flush();
            writer.close();	
			//System.out.println(option + ":"+home+":"+opp+":"+date);
		}else if(option.equals("3")) {
			String mesg = request.getParameter("mesg");
			String iid = request.getParameter("iid");
			System.out.println("iid = " + iid +" : mesg = " + mesg);
			writeData(iid, mesg);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		resp.setContentType("text/html; charset=UTF-8");
		//PrintWriter out = resp.getWriter();
		req.setCharacterEncoding("UTF-8");
		try {
			ServletInputStream oin = req.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(oin, "UTF-8"));
			StringBuilder json = new StringBuilder();
			String tmp = null;
			while((tmp = br.readLine()) != null) {
				json.append(tmp);
				System.out.println(tmp);
			}
			String iid = json.substring(json.indexOf("\"")+1, json.indexOf("|"));
			String mesg = json.substring(json.indexOf("|")+1, json.length() - 1);
			System.out.println(iid + ":" + mesg);
			writeData(iid, mesg);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	private String initGame(String homeTeam, String awayTeam, String date) {
		String iid = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			prop.setProperty("useSSL", "false");
			//prop.setProperty("autoReconnect", "true");
			Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/hitobaseball", prop);
			
			// init new game
			String sql = "insert into game_info (date, homeID, awayID) value "
					+ "(?, ?, ?)" ;
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, homeTeam);
			pstmt.setString(3, awayTeam);
			pstmt.execute();
			
			// get iid
			sql = "select iid from game_info where date='" + date
					+"' And homeID="+homeTeam+" And awayID="+ awayTeam;
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				iid = ""+rs.getInt(1);
				System.out.println(rs.getInt(1));
			}
			 
			
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return iid;
	}
	
	private void writeData(String iid, String mesg) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			prop.setProperty("useSSL", "false");
			//prop.setProperty("autoReconnect", "true");
			
			Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/hitobaseball", prop);
			
			String sql = "insert into broadcast (iid, text) value (?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, iid);
			pstmt.setString(2, mesg);
			pstmt.execute();
		}catch(Exception e) {
			System.out.println(e.toString());
		}

	}
	
	private Object getData(String option, HttpServletRequest request){
		ResultSet rs;
		Object obj = new Object();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			prop.setProperty("useSSL", "false");
			//prop.setProperty("autoReconnect", "true");
			
			Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/cpbl", prop);
			Statement stmt = conn.createStatement();
			String sql = "";
			
			switch(option) {
				case "0"://teams
					sql ="select * from teams";
					rs =  stmt.executeQuery(sql);
					ArrayList<HashMap<String, Serializable>> teams = new ArrayList<>();
					while(rs.next()) {
						HashMap<String, Serializable> team = new HashMap<>();
						team.put("name", rs.getString("name"));
						team.put("id", rs.getString("teamID"));
						teams.add(team);
					}
					
					//players
					for(int i = 0 ; i < teams.size(); i++) {
						HashMap<String, Serializable> tmpTeam = teams.get(i);
						String teamID = (String)tmpTeam.get("id");
						//System.out.println(teamID);
						sql = "SELECT p.name, p.playerID FROM players as p , teams as t  "
								+ "WHERE p.teamID = t.teamID AND t.teamID=" + teamID;
						rs = stmt.executeQuery(sql);
						
						ArrayList<HashMap<String, String>> players = new ArrayList<>();
						while(rs.next()) {
							HashMap<String, String> player = new HashMap<>();
							StringBuilder sb = new StringBuilder();
							String[] tmp = rs.getString("name").trim().split(" ");
							for(String str : tmp) {
								sb.append(str);
							}
							player.put("name", sb.toString());
							System.out.println();
							player.put("id",rs.getString("playerID"));
							players.add(player);
						}
						tmpTeam.put("players", players);
					}
					
					obj = gson.toJson(teams);
					//System.out.println(obj);
					break;
					
				case "1":
					//players
					// home team JSONObject
					HashMap<String, ArrayList<String>> tmpTeams = new HashMap<>();
					ArrayList<String> homeTeam = new ArrayList<>();
					ArrayList<String> oppTeam = new ArrayList<>();
					//setup game info
					sql ="SELECT p.name, p.playerID " + 
							"	FROM players as p , teams as t" + 
							"    WHERE p.teamID = t.teamID AND t.teamID = '"+home+"'";
					rs =  stmt.executeQuery(sql);
					while(rs.next()) {				
						homeTeam.add(rs.getString("name"));
					}
					tmpTeams.put("home", homeTeam);
					
					// away team JSONObject
					sql ="SELECT p.name " + 
							"	FROM players as p , teams as t" + 
							"    WHERE p.teamID = t.teamID AND t.teamID = '"+opp+"'";
					rs =  stmt.executeQuery(sql);
					while(rs.next()) {
						oppTeam.add(rs.getString("name"));
					}
					tmpTeams.put("opp", oppTeam);
					obj = gson.toJson(tmpTeams);
					break;
				
				case"2":
					//System.out.println("got it !");
					break;
			}
			conn.close();
		}catch (Exception e) {System.out.println(e.toString());}
		return obj;
	}
}
