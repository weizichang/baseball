package fsit03_HitoBaseBall;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sun.org.apache.bcel.internal.generic.ALOAD;


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
		if(option != null) {
			System.out.println(option + ":"+home+":"+opp+":"+date);
			//OutputStreamWriter writer = new OutputStreamWriter(response.getOutputStream());
			ObjectOutputStream writer = new ObjectOutputStream(response.getOutputStream());
			gson = new Gson();
			//String json = gson.toJson(getData(option));
            //writer.write(json);
			writer.writeObject(getData(option));
            writer.flush();
            writer.close();
			
		}else {
			System.out.println("xx");
		}
	}
	
	private Object getData(String option){
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
							player.put("name",rs.getString("name"));
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
			}
			conn.close();
		}catch (Exception e) {System.out.println(e.toString());}
		return obj;
	}
}
