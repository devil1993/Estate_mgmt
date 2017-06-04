package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ApplicationException;
import com.LoginDAO;
import com.RequestValidator;
import com.User;

/**
 * Servlet implementation class CreateUserServlet
 */
@WebServlet("/CreateUserServlet")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(! RequestValidator.validate(request)){
			request.getSession().setAttribute("errorMessage", "Please log in.");
			response.sendRedirect("index.jsp");
			return;
		}
		String fullName = (String)request.getParameter("fname");
		String userName = (String)request.getParameter("uname");
		String password = (String)request.getParameter("pwd");
		User me = (User)request.getSession().getAttribute("user");
		System.out.println(fullName+userName+password+me.getFullName());
		try {
			boolean success = LoginDAO.createUser(fullName,userName,password,me.getName());
			System.out.println(success);
			if(!success){
				throw new ApplicationException("Unable to add new user");
			}
			else{
				request.getSession().setAttribute("successMessage", "New user added.");
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
