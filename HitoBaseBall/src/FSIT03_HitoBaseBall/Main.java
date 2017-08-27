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

@WebServlet("/Main")
public class Main extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		int teamID = 1;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			
			Connection conn = DriverManager.getConnection(
				"jdbc:mysql://127.0.0.1:8889/cpbl", prop);
			
			Statement stmt = conn.createStatement();
			String sql ="select * from teams where teamID=" + teamID;
			ResultSet rs =  stmt.executeQuery(sql);
			if(rs.next()) {
				String teamName = rs.getString("name");
				System.out.println(teamName);
			}
			
		} catch (Exception e) {System.out.println(e);}
		request.getRequestDispatcher("Main.html").forward(request, response);
	}
}
