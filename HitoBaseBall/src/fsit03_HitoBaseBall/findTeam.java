package fsit03_HitoBaseBall;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/findTeam")
public class findTeam extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Content-type","application/xhtml+xml");//convert to XML output
		
		////////////////////findTeamSQL////////////////////
		try {
			
			//1.Driver Import
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver OK!!!");		
			
			//2.Build Connection
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			
			Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/hitobaseball", prop);
			System.out.println("Connection OK!");

			//3.SQL Statement
			PreparedStatement ps = conn.prepareStatement("select * from teams");			
			System.out.println("Statement OK!");
			
			//4.Query + XML
			StringBuffer sb = new StringBuffer();
			sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			sb.append("<findTeam>");
			
			ResultSet rs = ps.executeQuery();
			System.out.println("Query OK!");
			while(rs.next()) {
				sb.append("<team>");

				sb.append("<teamID>");
				sb.append(rs.getString("teamID"));
				sb.append("</teamID>");				
				
				sb.append("<name>");
				sb.append(rs.getString("name"));
				sb.append("</name>");
				
				sb.append("<contact>");
				sb.append(rs.getString("contact"));
				sb.append("</contact>");
				
				sb.append("<tel>");
				sb.append(rs.getString("tel"));
				sb.append("</tel>");
				
				sb.append("<fb>");
				sb.append(rs.getString("fb"));
				sb.append("</fb>");
				
				sb.append("</team>");
			}
			
			sb.append("</findTeam>");
			System.out.println("XML OK!");
			
			out.print(sb.toString());
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		////////////////////findTeamSQL////////////////////
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
