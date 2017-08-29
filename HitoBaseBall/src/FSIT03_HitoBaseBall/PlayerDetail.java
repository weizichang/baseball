package FSIT03_HitoBaseBall;

import java.io.IOException;
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
import javax.servlet.http.HttpSession;

@WebServlet("/PlayerDetail")
public class PlayerDetail extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String playerID = request.getParameter("playerID");
		Player player = new Player();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			
			Connection conn = DriverManager.getConnection(
				"jdbc:mysql://127.0.0.1/cpbl", prop);
			
			Statement stmt = conn.createStatement();
			String sql ="SELECT *, t.name as teamname " + 
					"	FROM players as p, teams as t " + 
					"    WHERE t.teamID = p.teamID AND p.playerID="+playerID+" ";
			ResultSet rs =  stmt.executeQuery(sql);
			if(rs.next()) {
				player.setPlayerId(playerID);
				player.setName(rs.getString("name"));
				player.setPos(rs.getString("pos"));
				player.setNumber(rs.getString("number"));
				player.setBt(rs.getString("BT"));
				player.setHeight(rs.getString("height"));
				player.setWeight(rs.getString("weight"));
				player.setDob(rs.getString("DOB"));
				player.setTeamId(rs.getString("teamID"));
				player.setTeamName(rs.getString("teamname"));
			}
			request.setAttribute("player", player);
		}catch (Exception e) {System.out.println(e.toString());}
		request.getRequestDispatcher("PlayerDetail.jsp").forward(request, response);
	}
}
