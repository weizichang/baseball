package FSIT03_HitoBaseBall;

import java.io.IOException;
import java.io.PrintWriter;
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
  
@WebServlet("/Players")
public class Players extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String teamID = (String)session.getAttribute("teamID");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			
			Connection conn = DriverManager.getConnection(
				"jdbc:mysql://127.0.0.1/cpbl", prop);
			
			Statement stmt = conn.createStatement();
			//投手
			String sql ="SELECT * FROM players as p WHERE p.teamID="+teamID+" and p.pos='投手'  "
					+ "ORDER BY number ASC";
			ResultSet rs =  stmt.executeQuery(sql);
			ArrayList<Player> pitchers = new ArrayList<>();
			while(rs.next()) {
				Player player = new Player();
				player.setPlayerId(rs.getString("playerID"));
				player.setNumber(rs.getString("number"));
				player.setName(rs.getString("name"));
				player.setPos(rs.getString("pos"));
				player.setBt(rs.getString("BT"));
				player.setHeight(rs.getString("height"));
				player.setWeight(rs.getString("weight"));
				player.setDob(rs.getString("DOB"));
				player.setTeamId(rs.getString("teamID"));
				pitchers.add(player);
			} 
			
			//補手
			sql ="SELECT * FROM players as p WHERE p.teamID="+teamID+" and p.pos='捕手'  "
					+ "ORDER BY number ASC";
			rs =  stmt.executeQuery(sql);
			ArrayList<Player> catchers = new ArrayList<>();
			while(rs.next()) {
				Player player = new Player();
				player.setPlayerId(rs.getString("playerID"));
				player.setNumber(rs.getString("number"));
				player.setName(rs.getString("name"));
				player.setPos(rs.getString("pos"));
				player.setBt(rs.getString("BT"));
				player.setHeight(rs.getString("height"));
				player.setWeight(rs.getString("weight"));
				player.setDob(rs.getString("DOB"));
				player.setTeamId(rs.getString("teamID"));
				catchers.add(player);
			} 
			
			//內野手
			sql ="SELECT * FROM players as p " + 
					"	WHERE p.pos in ('一壘手','二壘手','三壘手','游擊手') AND p.teamID="+teamID+" " + 
					"    ORDER BY number ASC";
			rs =  stmt.executeQuery(sql);
			ArrayList<Player> infielders = new ArrayList<>();
			while(rs.next()) {
				Player player = new Player();
				player.setPlayerId(rs.getString("playerID"));
				player.setNumber(rs.getString("number"));
				player.setName(rs.getString("name"));
				player.setPos(rs.getString("pos"));
				player.setBt(rs.getString("BT"));
				player.setHeight(rs.getString("height"));
				player.setWeight(rs.getString("weight"));
				player.setDob(rs.getString("DOB"));
				player.setTeamId(rs.getString("teamID"));
				infielders.add(player);
			} 
			
			//外野手
			sql ="SELECT * FROM players as p" + 
					"	WHERE pos in ('左外野手','中外野手','右外野手') AND p.teamID="+teamID+"" + 
					"    ORDER BY number ASC";
			rs =  stmt.executeQuery(sql);
			ArrayList<Player> outfielders = new ArrayList<>();
			while(rs.next()) {
				Player player = new Player();
				player.setPlayerId(rs.getString("playerID"));
				player.setNumber(rs.getString("number"));
				player.setName(rs.getString("name"));
				player.setPos(rs.getString("pos"));
				player.setBt(rs.getString("BT"));
				player.setHeight(rs.getString("height"));
				player.setWeight(rs.getString("weight"));
				player.setDob(rs.getString("DOB"));
				player.setTeamId(rs.getString("teamID"));
				outfielders.add(player);
			} 
			
			request.setAttribute("pitchers", pitchers);
			request.setAttribute("catchers", catchers);
			request.setAttribute("infielders", infielders);
			request.setAttribute("outfielders", outfielders);
			System.out.println(pitchers.size());
			conn.close();
		}catch(Exception e) {System.out.println(e.toString());}
		//---------------------------------------
		request.getRequestDispatcher("Players.jsp").forward(request, response);
	}
}
