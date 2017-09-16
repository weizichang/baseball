package fsit03_HitoBaseBall;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/forgetting")
public class forgetting extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		//1.Get param from JSP
		String forgetAcc = request.getParameter("forgetAcc");
		String forgetPass1 = request.getParameter("forgetPass1");
		
		//2.Update into DB
		try {
			Member member = new Member();
			member.setForgetAcc(forgetAcc);
			member.setForgetPass(forgetPass1);
			
			int n = member.ForgetPass();
			 if(n > 0) {
				 HttpSession session = request.getSession();
				 session.setAttribute("member", member);
				 response.sendRedirect("MyTeam");
			 }else {
				 out.println("<script>");
				 out.println("alert('重設密碼失敗，請重新設定！');");
				 out.println("location='index.jsp';");
				 out.println("</script>");
			 }
			
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
