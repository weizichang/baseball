package fsit03_HitoBaseBall;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

@WebServlet("/Main")
public class Main extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String teamID = (String)request.getParameter("teamId");
		//int teamID;
		if(teamID == null) {
			teamID = (String)session.getAttribute("teamId");
			if(teamID == null) {
				teamID = "1";
			}
		}
		session.setAttribute("teamID", teamID);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			prop.setProperty("useSSL", "false");
			//prop.setProperty("autoReconnect", "true");
			
			Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/cpbl", prop);
			
			Statement stmt = conn.createStatement();
			String sql ="select * from teams where teamID=" + teamID;
			ResultSet rs =  stmt.executeQuery(sql);
			Team team = new Team();
			Top3 top3 = new Top3();
			//--------------------------------
			if(rs.next()) {
				team.setTeamId(teamID);
				team.setName(rs.getString("name"));
				team.setMail(rs.getString("mail"));
				team.setContact(rs.getString("contact"));
			
				//AVG
				sql = "SELECT p.playerID as pid, b.playerID ,name,format((b.hits/b.ab),3)as AVG "
						+ " FROM `batterstat` as b , players as p "
						+ " WHERE p.playerID = b.playerID and b.ab > 200 and teamID="+teamID+"" 
						+ " ORDER BY AVG DESC" 
						+ " LIMIT 3";
				rs =  stmt.executeQuery(sql);
				ArrayList<HashMap<String, String>> tmp = new ArrayList<>();
				while(rs.next()) {
					HashMap<String, String> row = new HashMap<>();
					row.put("name", rs.getString("name"));
					row.put("AVG", rs.getString("AVG"));
					row.put("playerID", rs.getString("pid"));
					tmp.add(row); top3.setAvg(tmp);
				}
				
				//Hits
				sql = "SELECT p.playerID as pid, b.playerID ,name,b.hits "
						+ " FROM `batterstat` as b , players as p "
						+ " WHERE p.playerID = b.playerID and b.ab > 200 and teamID="+teamID+"" 
						+ " ORDER BY b.hits DESC" 
						+ " LIMIT 3";
				rs =  stmt.executeQuery(sql);
				tmp = new ArrayList<>();
				while(rs.next()) {
					HashMap<String, String> row = new HashMap<>();
					row.put("name", rs.getString("name"));
					row.put("hits", rs.getString("hits"));
					row.put("playerID", rs.getString("pid"));
					//System.out.println(rs.getString("hits"));
					tmp.add(row); top3.setHits(tmp);
				}
				
				//RBI
				sql = "SELECT p.playerID as pid, b.playerID ,name,b.rbi "
						+ " FROM `batterstat` as b , players as p "
						+ " WHERE p.playerID = b.playerID and teamID="+teamID+"" 
						+ " ORDER BY b.rbi DESC" 
						+ " LIMIT 3";
				rs =  stmt.executeQuery(sql);
				tmp = new ArrayList<>();
				while(rs.next()) {
					HashMap<String, String> row = new HashMap<>();
					row.put("name", rs.getString("name"));
					row.put("rbi", rs.getString("rbi"));
					row.put("playerID", rs.getString("pid"));
					//System.out.println(rs.getString("rbi"));
					tmp.add(row); top3.setRbi(tmp);
				}
				
				//ERA
				sql = "SELECT name, ps.playerID, p.playerID as pid, (ps.er * 9 / ps.ip) as ERA " + 
						"	FROM pitcherstat as ps, players as p " + 
						"	WHERE ps.playerID=p.playerID and teamID="+teamID+"" + 
						"    ORDER BY ERA ASC" + 
						"    LIMIT 3";
				rs =  stmt.executeQuery(sql);
				tmp = new ArrayList<>();
				while(rs.next()) {
					HashMap<String, String> row = new HashMap<>();
					row.put("name", rs.getString("name"));
					row.put("era", rs.getString("ERA"));
					row.put("playerID", rs.getString("pid"));
					//System.out.println(rs.getString("ERA"));
					tmp.add(row); top3.setEra(tmp);
				}
				
				//SO
				sql = "SELECT name, ps.playerID, p.playerID as pid, ps.so" + 
						"	FROM pitcherstat as ps, players as p " + 
						"	WHERE ps.playerID=p.playerID and teamID="+teamID+" " + 
						"    ORDER BY ps.so DESC " + 
						"    LIMIT 3";
				rs =  stmt.executeQuery(sql);
				tmp = new ArrayList<>();
				while(rs.next()) {
					HashMap<String, String> row = new HashMap<>();
					row.put("name", rs.getString("name"));
					row.put("so", rs.getString("so"));
					row.put("playerID", rs.getString("pid"));
					//System.out.println(rs.getString("so"));
					tmp.add(row); top3.setSo(tmp);
				}
				
				//WHIP
				sql = "SELECT name, ps.playerID, p.playerID as pid, format((ps.h + ps.bb)/ps.ip,2) as whip" + 
						"	FROM pitcherstat as ps, players as p " + 
						"	WHERE ps.playerID=p.playerID and teamID="+teamID+"" + 
						"    ORDER BY whip ASC" + 
						"    LIMIT 3";
				rs =  stmt.executeQuery(sql);
				tmp = new ArrayList<>();
				while(rs.next()) {
					HashMap<String, String> row = new HashMap<>();
					row.put("name", rs.getString("name"));
					row.put("whip", rs.getString("whip"));
					row.put("playerID", rs.getString("pid"));
					//System.out.println(rs.getString("whip"));
					tmp.add(row); top3.setWhip(tmp);
				}
			}
			request.setAttribute("team", team);
			request.setAttribute("top3", top3);
			//-----------------------------------
			conn.close();
		} catch (Exception e) {System.out.println(e);}
		request.getRequestDispatcher("Main.jsp").forward(request, response);
	}
}
