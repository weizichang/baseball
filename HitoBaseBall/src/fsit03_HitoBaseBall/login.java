package fsit03_HitoBaseBall;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		//1.Get param from JSP
		String loginAcc = request.getParameter("loginAcc");
		String loginPass = request.getParameter("loginPass");
		
		//2.Check with DB
		try {
			Member member = new Member();
			member.setLoginAcc(loginAcc);
			member.setLoginPass(loginPass);
			
			boolean ck = member.Login();			
			if(ck) {
				HttpSession session = request.getSession();
				session.setAttribute("member", member);
				response.sendRedirect("MyTeam");
			}else {
				out.println("<script>");
				out.println("alert('帳號密碼有誤，請重新登入！');");
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
