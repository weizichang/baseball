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

import com.sun.net.ssl.HttpsURLConnection;


@WebServlet("/Logging")
public class Logging extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		String mail = request.getParameter("mail");
		String pw = request.getParameter("password");
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
			String sql = "select count(*) from member"
					+ " where password='"+pw+"' and mail='"+ mail+"'";
			System.out.println(sql);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int check = rs.getInt(1);
				if(check == 1) {
					request.getRequestDispatcher("backend.jsp").forward(request, response);
				}else {
					response.sendRedirect("index.jsp");
				}
			}
			
			
		}catch(Exception e) {
			System.out.println(e.toString());
		}

	}
}
