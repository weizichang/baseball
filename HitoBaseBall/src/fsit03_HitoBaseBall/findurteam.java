package fsit03_HitoBaseBall;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/findurteam")
public class findurteam extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		//1.Get param from JSP
		String findTeamInput = request.getParameter("findTeamInput");
		
		//2.Query with DB
		try {
			//1.Driver Import
			Class.forName("com.mysql.jdbc.Driver");
			//System.out.println("Driver OK!!!");		
			
			//2.Build Connection
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			
			Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/cpbl", prop);
			//System.out.println("Connection OK!");

			//3.SQL Statement
			PreparedStatement ps = conn.prepareStatement("select * from teams where name = ?");
			ps.setString(1, findTeamInput);
			//System.out.println("Statement OK!");
			
			//4.Query
			ResultSet rs = ps.executeQuery();
			//System.out.println("Query OK!");
			if(rs.next()) {
				String teamId = rs.getString("teamID");
				System.out.println(teamId);
				HttpSession session = request.getSession();
				session.setAttribute("teamId", teamId);
				response.sendRedirect("Main");				
			}else {
				out.println("<script>");
				out.println("alert('球隊全名有誤，請重新輸入！');");
				out.println("location='index.jsp';");
				out.println("</script>");
			}

			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
