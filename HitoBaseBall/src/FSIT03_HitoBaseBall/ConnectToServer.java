package FSIT03_HitoBaseBall;

import java.io.IOException;
import java.io.OutputStreamWriter;
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

import com.google.gson.Gson;


@WebServlet("/ConnectToServer")
public class ConnectToServer extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		//PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		String option = request.getParameter("option");
		
		if(option != null) {
			OutputStreamWriter writer = new OutputStreamWriter(response.getOutputStream());
			Gson gson = new Gson();
			String json = gson.toJson(getData(option));
            writer.write(json);
            writer.flush();
            writer.close();
			
		}else {
			System.out.println("xx");
		}
	}
	
	private Object getData(String option){
		StringBuilder sb = new StringBuilder();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			prop.setProperty("useSSL", "false");
			//prop.setProperty("autoReconnect", "true");
			
			Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/cpbl", prop);
			Statement stmt = conn.createStatement();
			String sql = "";
			switch(option) {
				case "0"://teams
					sql ="select * from teams";
					ResultSet rs =  stmt.executeQuery(sql);
					while(rs.next()) {
						sb.append(rs.getString("name")+" ");
					}
					break;
			}
			
			conn.close();
		}catch (Exception e) {System.out.println(e.toString());}
		return sb.toString().split(" ");
	}
}
