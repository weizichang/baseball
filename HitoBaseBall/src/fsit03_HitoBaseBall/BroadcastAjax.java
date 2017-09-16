package fsit03_HitoBaseBall;

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


@WebServlet("/BroadcastAjax")
public class BroadcastAjax extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ArrayList<String> broadcast = getBroadcast();
		int len = (int)session.getAttribute("len");
		if(broadcast.size() > len) {
			session.setAttribute("len", broadcast.size());
			out.write(broadcast.get(broadcast.size() - 1));
		}
	
//		ArrayList<String> broadcast = new ArrayList<>();
//		int iid = 13;
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			Properties prop = new Properties();
//			prop.setProperty("user", "root");
//			prop.setProperty("password", "root");
//			prop.setProperty("useSSL", "false");
//			
//			Connection conn = DriverManager.getConnection(
//				"jdbc:mysql://127.0.0.1/hitobaseball", prop);
//			
//			Statement stmt = conn.createStatement();
//			String sql ="select * from broadcast where iid=" + iid;
//			ResultSet rs =  stmt.executeQuery(sql);
//			while(rs.next()) {
//				broadcast.add(rs.getString("text"));
//			}
//			
//		}catch(Exception e) {System.out.println(e.toString());}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private ArrayList<String> getBroadcast(){
		ArrayList<String> broadcast = new ArrayList<>();
		int iid = 1;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			prop.setProperty("useSSL", "false");
			
			Connection conn = DriverManager.getConnection(
				"jdbc:mysql://127.0.0.1/hitobaseball", prop);
			
			Statement stmt = conn.createStatement();
			String sql ="select * from broadcast where iid=" + iid;
			ResultSet rs =  stmt.executeQuery(sql);
			while(rs.next()) {
				broadcast.add(rs.getString("text"));
			}
			
		}catch(Exception e) {System.out.println(e.toString());}
		return broadcast;
	}
}
