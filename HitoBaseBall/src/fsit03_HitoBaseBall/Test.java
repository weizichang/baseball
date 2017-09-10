package fsit03_HitoBaseBall;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet("/Test")
public class Test extends HttpServlet {
	private HttpServletRequest request;
	private List<FileItem> items;
	private List players;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		request = req;
		players = doDo();
		 for(int j = 0; j < players.size(); j ++) {
			 ArrayList<String> player = (ArrayList<String>)players.get(j);
		    	for(int i = 0; i < player.size(); i++) {
		    		
		    		System.out.println(player.get(i) + ":" + j);
		    	}
		 }
	}
	
	private ArrayList doDo() {
		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Configure a repository (to ensure a secure temp location is used)
		ServletContext servletContext = this.getServletConfig().getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// Parse the request
		try {
			items = upload.parseRequest(request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// Process the uploaded items
		Iterator<FileItem> iter = items.iterator();
		int n = 0;
		ArrayList<ArrayList<String>> players = new ArrayList<>();
		ArrayList<String> tmp = new ArrayList<>();
		int fileCount = 1;
		while (iter.hasNext()) {
		    FileItem item = iter.next();
		    //item.
		    String name = item.getName();
		    String str =item.getString();
		    String fieldName = item.getFieldName();
		    tmp.add(str);
		    if (str.equals("d")) {
		    	ArrayList<String> player = new ArrayList<>();
		    	for(int i = 0; i < tmp.size(); i++) {
		    		player.add(tmp.get(i));
		    		System.out.println("hi");
		    	}
		    	tmp = new ArrayList<>();
		    	players.add(player);
		    	fileCount++;
		    }
		    
		}
		return players;
	}

}
