package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ApplicationException;
import com.LoginDAO;
import com.RequestValidator;

/**
 * Servlet implementation class ResetPasswordServlet
 */
@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(! RequestValidator.validate(request)){
			request.getSession().setAttribute("errorMessage", "Please log in.");
			response.sendRedirect("../index.jsp");
			return;
		}
		String userName = (String)request.getAttribute("uname");
		String password = (String)request.getAttribute("pwd");
		
		try {
			boolean success = LoginDAO.resetPasseord(userName,password);
			if(!success){
				throw new ApplicationException("Unable to reset password");
			}
			else{
				request.getSession().setAttribute("successMessage", "Password reset.");
				response.sendRedirect("estate/userManagement.jsp");
			}
		} catch (ApplicationException e) {
			request.getSession().setAttribute("errorMessage", e.getMessage());
			response.sendRedirect("estate/userManagement.jsp");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
