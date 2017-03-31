package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ApplicationException;
import com.LoginDAO;
import com.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("usrname");
		String password = request.getParameter("pwd");
		
		try {
			User user =  LoginDAO.authenticate(username,password);
			if(user != null){
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("authenticatedSessionId", request.getSession().getId());
				request.getSession().setMaxInactiveInterval(300000);
			}
			//System.out.println("Going good");	
			response.sendRedirect("estate/dashboard.jsp");
			//RequestDispatcher rd = request.getRequestDispatcher("estate/dashboard.jsp");
			//rd.forward(request, response);
		} catch (ApplicationException e) {
			// TODO Auto-generated catch block
			request.getSession().setAttribute("errorMessage", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}

}
