package guestController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/guest/main")
public class GuestMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("guest_id")!=null) {
			RequestDispatcher rd = request.getRequestDispatcher("guestMain.jsp");
			rd.forward(request, response);
//			response.sendRedirect("guestMain.jsp");
			return;
		}
		
//		response.sendRedirect("guestMainLogin.jsp");
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("guestMainLogin.jsp");
		rd.forward(request, response);
		return;
	}

}
