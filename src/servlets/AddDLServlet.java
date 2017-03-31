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
import com.InsertDao;
import com.RequestValidator;
import com.User;

/**
 * Servlet implementation class AddDLServlet
 */
@WebServlet("/AddDLServlet")
public class AddDLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDLServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(! RequestValidator.validate(request)){
			request.getSession().setAttribute("errorMessage", "Please log in.");
			response.sendRedirect("index.jsp");
			return;
		}
		String dlName = request.getParameter("dlName");
		User loggedInUser = (User)request.getSession().getAttribute("user");
		try{
			//int id = InsertDao.addAsset(assetName,(String)request.getSession().getAttribute("userId"));
			
			// For testing using this line for now, 
			// till we get the authentication module ready
			int id = InsertDao.addDeliveryLocation(dlName,loggedInUser.getId());
			request.getSession().setAttribute("successMessage", "Delivery Location added successfully.");
			response.sendRedirect("estate/addDeliveryLocation.jsp");
		}
		catch(ApplicationException e){
			request.getSession().setAttribute("errorMessage", e.getMessage());
			response.sendRedirect("estate/addDeliveryLocation.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
