package FSIT03_HitoBaseBall;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PlayByPlay")
public class PlayByPlay extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int iid = 1;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			prop.setProperty("useSSL", "false");
			
			Connection conn = DriverManager.getConnection(
				"jdbc:mysql://127.0.0.1/cpbl", prop);
			
			Statement stmt = conn.createStatement();
			String sql ="select * from game_detail where iid=" + iid;
			ResultSet rs =  stmt.executeQuery(sql);
			while(rs.next()) {
				out.print(rs.getString("playerID")+":");
				/*
				 * AwayTeam
				 * SELECT name, sum(ab), sum(h) ,sum(1b) ,sum(2b) ,sum(3b) ,sum(hr) ,sum(bb) ,sum(so)    
					FROM players as p, game_detail as g
    				WHERE p.playerID = g.playerID AND p.teamID = 1
    				GROUP BY name
    				
    				HomeTeam
				 * SELECT name, sum(ab), sum(h) ,sum(1b) ,sum(2b) ,sum(3b) ,sum(hr) ,sum(bb) ,sum(so)    
					FROM players as p, game_detail as g
    				WHERE p.playerID = g.playerID AND p.teamID = 2
    				GROUP BY name
				 */
				
			}
		}catch(Exception e) {System.out.println(e.toString());}
	}
}
