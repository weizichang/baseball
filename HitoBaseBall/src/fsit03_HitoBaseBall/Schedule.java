package fsit03_HitoBaseBall;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Schedule")
public class Schedule extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String teamID = (String)session.getAttribute("teamID");
		if(teamID == null) {
			teamID = "1";
		}
		ArrayList<ScoreBoardModel> boards = setBoard(teamID);
		request.setAttribute("boards", boards);
		session.setAttribute("boards", boards);
		request.getRequestDispatcher("Schedule.jsp").forward(request, response);
	}
	private ArrayList setBoard(String teamID) {
		ArrayList<ScoreBoardModel> boards = new ArrayList<>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			prop.setProperty("useSSL", "false");
			//prop.setProperty("autoReconnect", "true");
			
			Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/cpbl", prop);
			Statement stmt = conn.createStatement();
			// home & away team
			String sql ="SELECT i.iid " + 
					"	FROM game_detail as g, game_info as i " + 
					"    WHERE i.home_teamID="+teamID+" or i.away_teamID="+teamID+"" + 
					"    GROUP BY i.iid";
			ResultSet rs =  stmt.executeQuery(sql);
			ArrayList<String> iid = new ArrayList<>();
			//取得iid
			while(rs.next()) {
				iid.add(rs.getString("iid"));
			}
			rs.beforeFirst();
			//根據 iid loop
			for(int i = 0; i < iid.size(); i ++) {
				ScoreBoardModel board = new ScoreBoardModel();
				// iid
				board.setIid(iid.get(i));
				
				sql ="SELECT date," + 
						"(SELECT name FROM teams, game_info WHERE teams.teamID = game_info.home_teamID GROUP BY name) as home_team," + 
						"(SELECT name FROM teams, game_info WHERE teams.teamID = game_info.away_teamID GROUP BY name) as away_team" + 
						"	FROM game_info as g" + 
						"	where home_teamID="+teamID+" or away_teamID="+teamID+" AND iid="+iid.get(i)+"";
				rs =  stmt.executeQuery(sql);
				if(rs.next()) {				
					board.setHomeTeam(rs.getString("home_team"));
					//System.out.println(rs.getString("home_team"));
					board.setAwayTeam(rs.getString("away_team"));
					//System.out.println(rs.getString("away_team"));
					board.setDate(rs.getString("date"));
					//System.out.println(rs.getString("date"));
				}
				
				// score board
				sql = "SELECT sum(score) as score FROM game_detail as g WHERE g.iid="+iid.get(i)+" GROUP BY inning";
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
						"	WHERE p.playerID = g.playerID AND iid="+iid.get(i)+"" + 
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
				boards.add(board);
			}
			//box.set
			/*
			 team name & date:
			 SELECT * FROM game_info where iid = 1
			 
			  inning
			  SELECT inning ,sum(score)
				FROM game_detail as g
	    		GROUP BY inning
	    	  
	    	  R H E
	    	  SELECT sum(score) as R ,sum(h) as H, sum(error) as E    
			  	FROM players as p, game_detail as g
	          	WHERE p.playerID = g.playerID AND p.teamID = 1

			 */
			conn.close();
		}catch(Exception e) {System.out.println(e.toString());}
		return boards;
	}
}
