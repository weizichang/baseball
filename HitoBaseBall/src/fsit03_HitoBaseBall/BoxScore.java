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

@WebServlet("/BoxScore")
public class BoxScore extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		String teamID = (String)session.getAttribute("teamID");
		if(teamID == null) {
			teamID = "1";
		}
		System.out.println("ok");
		String iid = request.getParameter("iid");
		out.print(iid);
		BoxModel box = setBox(iid, teamID);
		request.setAttribute("box", box);
		request.getRequestDispatcher("BoxScore.jsp").forward(request, response);
		
	}
	
	private BoxModel setBox(String iid, String teamID) {
		BoxModel box = new BoxModel();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			prop.setProperty("useSSL", "false");
			//prop.setProperty("autoReconnect", "true");
			
			Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/cpbl", prop);
			Statement stmt = conn.createStatement();
		
			String sql ="SELECT date," + 
					"(SELECT name FROM teams, game_info WHERE teams.teamID = game_info.home_teamID GROUP BY name) as home_team," + 
					"(SELECT name FROM teams, game_info WHERE teams.teamID = game_info.away_teamID GROUP BY name) as away_team" + 
					"	FROM game_info as g" + 
					"	where home_teamID="+teamID+" or away_teamID="+teamID+" AND iid="+iid+"";
			ResultSet rs =  stmt.executeQuery(sql);
			ScoreBoardModel board = new ScoreBoardModel();
			if(rs.next()) {				
				board.setHomeTeam(rs.getString("home_team"));
				//System.out.println(rs.getString("home_team"));
				board.setAwayTeam(rs.getString("away_team"));
				//System.out.println(rs.getString("away_team"));
				board.setDate(rs.getString("date"));
				//System.out.println(rs.getString("date"));
			}
			
			// score board
			sql = "SELECT sum(score) as score FROM game_detail as g WHERE g.iid="+iid+" GROUP BY inning";
			rs = stmt.executeQuery(sql);
			ArrayList<String> tmpAwayScore = new ArrayList<>();
			ArrayList<String> tmpHomeScore = new ArrayList<>();
			int n = 0;
			while(rs.next()) {
				n++;
				int score = Integer.parseInt(rs.getString("score"));
				if(n % 2 != 0) {
					tmpAwayScore.add(""+score);
				}else {
					tmpHomeScore.add(""+score);
				}
			}
			board.setAwayInningScore(tmpAwayScore);
			board.setHomeInningScore(tmpHomeScore);
	
			// R H E
			sql = "SELECT sum(score) as R ,sum(h) as H, sum(error) as E" + 
					"	FROM players as p, game_detail as g " + 
					"	WHERE p.playerID = g.playerID AND iid="+iid+"" + 
					"	GROUP BY teamID";
			rs = stmt.executeQuery(sql);
			ArrayList<String[]> tmp = new ArrayList<>();
			while(rs.next()) {
				String[] row = new String[3];
				row[0] = rs.getString("R");
				row[1] = rs.getString("H");
				row[2] = rs.getString("E");
				tmp.add(row);
			}
			board.setAwayRHE(tmp.get(0));
			board.setHomeRHE(tmp.get(1));
			box.setBoard(board);
			
			//away team batter
			sql = "SELECT name, " + 
					"sum(ab) as AB, " + 
					"sum(h) as H, " + 
					"sum(rbi) as RBI, " + 
					"sum(bb) as BB, " + 
					"sum(so) as SO, " + 
					"sum(sb) as SB, " + 
					"format((sum(h) / sum(ab)),2) as AVG " + 
					"FROM game_detail as g, players as p " + 
					"WHERE g.playerID=p.playerID AND iid=1 AND (inning%2!=0) " + 
					"GROUP BY g.playerID";
			rs = stmt.executeQuery(sql);
			ArrayList<HashMap<String, String>> awayBatter = new ArrayList<>();
			while(rs.next()) {
				HashMap<String, String> row = new HashMap<>();
				row.put("name", rs.getString("name"));
				row.put("AB", rs.getString("AB"));
				row.put("H", rs.getString("H"));
				row.put("RBI", rs.getString("RBI"));
				row.put("BB", rs.getString("BB"));
				row.put("SO", rs.getString("SO"));
				row.put("SB", rs.getString("SB"));
				row.put("AVG", rs.getString("AVG"));
				awayBatter.add(row);
			}
			box.setAwayBatter(awayBatter);
			
			//home team batter
			sql = "SELECT name, " + 
					"sum(ab) as AB, " + 
					"sum(h) as H, " + 
					"sum(rbi) as RBI, " + 
					"sum(bb) as BB, " + 
					"sum(so) as SO, " + 
					"sum(sb) as SB, " + 
					"format((sum(h) / sum(ab)),2) as AVG " + 
					"FROM game_detail as g, players as p " + 
					"WHERE g.playerID=p.playerID AND iid=1 AND (inning%2=0) " + 
					"GROUP BY g.playerID";
			rs = stmt.executeQuery(sql);
			ArrayList<HashMap<String, String>> homeBatter = new ArrayList<>();
			while(rs.next()) {
				HashMap<String, String> row = new HashMap<>();
				row.put("name", rs.getString("name"));
				row.put("AB", rs.getString("AB"));
				row.put("H", rs.getString("H"));
				row.put("RBI", rs.getString("RBI"));
				row.put("BB", rs.getString("BB"));
				row.put("SO", rs.getString("SO"));
				row.put("SB", rs.getString("SB"));
				row.put("AVG", rs.getString("AVG"));
				homeBatter.add(row);
			}
			box.setHomeBatter(homeBatter);
			
			// away pitcher
			sql = "SELECT name, " + 
					"format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1) as IP,\n" + 
					"sum(h) as H," + 
					"sum(score) as R," + 
					"sum(bb) as BB," + 
					"sum(so) as SO," + 
					"sum(hr) as HR," + 
					"format(sum(score)*9/format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1),2) as ERA," + 
					"format((sum(h)+sum(bb))/format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1),2) as WHIP " + 
					"FROM game_detail as g, players as p " + 
					"WHERE g.pitcherID=p.playerID AND iid<=1 AND (inning%2=0) " + 
					"GROUP BY g.pitcherID, name";
			rs = stmt.executeQuery(sql);
			ArrayList<HashMap<String, String>> awayPitcher = new ArrayList<>();
			while(rs.next()) {
				HashMap<String, String> row = new HashMap<>();
				row.put("name", rs.getString("name"));
				row.put("IP", rs.getString("IP"));
				row.put("H", rs.getString("H"));
				row.put("R", rs.getString("R"));
				row.put("BB", rs.getString("BB"));
				row.put("SO", rs.getString("SO"));
				row.put("HR", rs.getString("HR"));
				row.put("ERA", rs.getString("ERA"));
				row.put("WHIP", rs.getString("WHIP"));
				awayPitcher.add(row);
			}
			box.setAwayPitcher(awayPitcher);
			
			// away pitcher
			sql = "SELECT name, " + 
					"format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1) as IP," + 
					"sum(h) as H," + 
					"sum(score) as R," + 
					"sum(bb) as BB," + 
					"sum(so) as SO," + 
					"sum(hr) as HR," + 
					"format(sum(score)*9/format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1),2) as ERA, " + 
					"format((sum(h)+sum(bb))/format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1),2) as WHIP " + 
					"FROM game_detail as g, players as p " + 
					"WHERE g.pitcherID=p.playerID AND iid<=1 AND (inning%2!=0) " + 
					"GROUP BY g.pitcherID, name";
			rs = stmt.executeQuery(sql);
			ArrayList<HashMap<String, String>> homePitcher = new ArrayList<>();
			while(rs.next()) {
				HashMap<String, String> row = new HashMap<>();
				row.put("name", rs.getString("name"));
				row.put("IP", rs.getString("IP"));
				row.put("H", rs.getString("H"));
				row.put("R", rs.getString("R"));
				row.put("BB", rs.getString("BB"));
				row.put("SO", rs.getString("SO"));
				row.put("HR", rs.getString("HR"));
				row.put("ERA", rs.getString("ERA"));
				row.put("WHIP", rs.getString("WHIP"));
				homePitcher.add(row);
			}
			box.setHomePitcher(homePitcher);
			
		}catch(Exception e) {System.out.println(e.toString());}
		/*
		away team batter:
		SELECT name,
				sum(ab) as AB,
				sum(h) as H,
			    sum(rbi) as RBI,
			    sum(bb) as BB,
			    sum(so) as SO,
			    sum(sb) as sb,
			    format((sum(h) / sum(ab)),2) as AVG
					FROM game_detail as g, players as p
					WHERE g.playerID=p.playerID AND iid=1 AND (inning%2!=0)
			        GROUP BY g.playerID
		    
		   away pitcher:
		   SELECT name, 
				format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1) as IP,
				sum(h) as H,
			    sum(score) as R,
			    sum(bb) as BB,
			    sum(so) as SO,
			    sum(hr) as HR,
			    format(sum(score)*9/format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1),2) as ERA,
			    format((sum(h)+sum(bb))/format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1),2) as WHIP
			    FROM game_detail as g, players as p
				WHERE g.pitcherID=p.playerID AND iid<=1 AND (inning%2=0)   
			    GROUP BY g.pitcherID, name
		    
		    home team batter:
		    SELECT name,
				sum(ab) as AB,
				sum(h) as H,
			    sum(rbi) as RBI,
			    sum(bb) as BB,
			    sum(so) as SO,
			    sum(sb) as sb,
			    format((sum(h) / sum(ab)),2) as AVG
					FROM game_detail as g, players as p
					WHERE g.playerID=p.playerID AND iid=1 AND (inning%2=0)
			        GROUP BY g.playerID
		        
		     home pitcher:
			 SELECT name, 
				format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1) as IP,
				sum(h) as H,
			    sum(score) as R,
			    sum(bb) as BB,
			    sum(so) as SO,
			    sum(hr) as HR,
			    format(sum(score)*9/format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1),2) as ERA,
			    format((sum(h)+sum(bb))/format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1),2) as WHIP
			    FROM game_detail as g, players as p
				WHERE g.pitcherID=p.playerID AND iid<=1 AND (inning%2!=0)   
			    GROUP BY g.pitcherID, name
		*/
		return box;
	}
}
