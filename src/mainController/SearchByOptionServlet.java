package mainController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import model.StudioResDAO;
import model.StudioVO;

/**
 * Servlet implementation class SearchAll
 */
@WebServlet("/main/searchByOption")
public class SearchByOptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String loc = request.getParameter("loc");
		String subway = request.getParameter("subway");
		String[] arr = request.getParameterValues("chkArr[]");
		//String[] arr = {};
		//arr[0] ="4";
		/*
		 * for(int i=0; i<arr.length; i++) { System.out.println(arr[i]);
		 * 
		 * }
		 */
	

		
		StudioResDAO dao = new StudioResDAO();
		
		
		
		List<StudioVO> studio = dao.selectStudioByOption(subway, loc, arr);
		
		
		request.setAttribute("studioOption", studio); 

		RequestDispatcher rd = request.getRequestDispatcher("mainOptionList.jsp");
		rd.forward(request, response);
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

