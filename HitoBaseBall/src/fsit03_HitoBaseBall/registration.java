package fsit03_HitoBaseBall;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/registration")
public class registration extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		//1.Get param from JSP
		String regisAcc = request.getParameter("regisAcc");
		String regisPass1 = request.getParameter("regisPass1");
		String memberName = request.getParameter("memberName");
		
		//2.Write into DB
		try {
			if(memberName == null || memberName.equals("")) {
				memberName="先生/小姐";
			}
			
			Member member = new Member();
			member.setAccount(regisAcc);
			member.setPassword(regisPass1);
			member.setName(memberName);
			
			int n = member.newRegistration();
			 if(n > 0) {
				 HttpSession session = request.getSession();
				 session.setAttribute("member", member);
				 response.sendRedirect("backend.jsp");
			 }else {
				 out.println("<script>");
				 out.println("alert('註冊失敗，請重新註冊！');");
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
