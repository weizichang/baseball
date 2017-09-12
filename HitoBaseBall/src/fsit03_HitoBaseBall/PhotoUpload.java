package fsit03_HitoBaseBall;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.HTTP;

import com.oreilly.servlet.MultipartRequest;

@WebServlet("/PhotoUpload")
public class PhotoUpload extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			  throws ServletException, IOException { 
			  response.setContentType("multipart/form-data; charset=UTF-8");
			  PrintWriter out = response.getWriter();
			  request.setCharacterEncoding("UTF-8");
			  
			  String uploadPath = 
					  getServletContext().getInitParameter("upload-path");
					  MultipartRequest req = new MultipartRequest(request,uploadPath,"UTF-8");

					  Enumeration items = req.getFileNames();
					  while (items.hasMoreElements()){
					  	
					  	//取得teamid
					  	HttpSession session = request.getSession();
					  	String id = (String)session.getAttribute("teamId");
					  	
					  	String strFile = (String)items.nextElement();
					  	File file = req.getFile(strFile);
					  	String FSName = req.getFilesystemName(strFile);
					  	String upName = req.getOriginalFileName(strFile);
					  	//out.println(upName + ":"+id+"←"+"  lenght:");
					  	
					  	
					  	//檔名變更//teamid_logo.jpg
					  	for(int i=0 ; i<4;i++){
					  		String srcFilename = uploadPath+upName;
					  		String destFilename = uploadPath+id+"_"+i+"_slides.png"; 
					  		boolean filechange = FileReName.rename(srcFilename, destFilename);
					  	}
					  	
					  	
					  	
					  	
					  }
					  //request.getRequestDispatcher("MyTeam").forward(request, response);
					  //response.sendRedirect("MyTeam");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
