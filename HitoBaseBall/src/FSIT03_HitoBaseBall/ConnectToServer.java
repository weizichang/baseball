package FSIT03_HitoBaseBall;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


@WebServlet("/ConnectToServer")
public class ConnectToServer extends HttpServlet {
	private String home, opp;
	private Gson gson;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		//PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		String option = request.getParameter("option");
		home = request.getParameter("home");
		opp = request.getParameter("opp");
		if(option != null) {
			System.out.println(option + ":"+home+":"+opp);
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
		StringBuilder sb = new StringBuilder();
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
					ArrayList<String> teams = new ArrayList<>();
					while(rs.next()) {
						//sb.append(rs.getString("name")+" ");
						teams.add(rs.getString("name"));
					}
					obj = gson.toJson(teams);
					System.out.println(obj);
					//sb.append(", ");
					break;
					
				case "1"://players
					// home team JSONObject
					sql ="SELECT p.name " + 
							"	FROM players as p , teams as t" + 
							"    WHERE p.teamID = t.teamID AND t.name = '"+home+"'";
					rs =  stmt.executeQuery(sql);
					ArrayList<String> players = new ArrayList<>();
					while(rs.next()) {
//						String[] tmp = rs.getString("name").split(" ");
//						for(int i = 0; i < tmp.length; i ++) {
//							sb.append(tmp[i]);
//						}sb.append(", ");
//						sb.append(" ");
						players.add(rs.getString("name"));
					}
					obj = gson.toJson(players);
					
					// away team JSONObject
					sql ="SELECT p.name " + 
							"	FROM players as p , teams as t" + 
							"    WHERE p.teamID = t.teamID AND t.name = '"+opp+"'";
					rs =  stmt.executeQuery(sql);
					sb.append("{\"home\":");
					while(rs.next()) {
						String[] tmp = rs.getString("name").split(" ");
						for(int i = 0; i < tmp.length; i ++) {
							sb.append(tmp[i]);
						}
						sb = (rs.next())?sb.append(", "):sb.append(" ");
					}
					System.out.println(sb);
					break;
			}
			conn.close();
		}catch (Exception e) {System.out.println(e.toString());}
		return obj;
	}
}
