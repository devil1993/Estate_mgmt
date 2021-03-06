package servlets;

import java.io.IOException;
import java.sql.SQLException;

import com.ApplicationException;
import com.InsertDao;
import com.RequestValidator;
import com.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddAssetServlet
 */
@WebServlet("/AddAssetServlet")
public class AddAssetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAssetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(! RequestValidator.validate(request)){
			request.getSession().setAttribute("errorMessage", "Please log in.");
			response.sendRedirect("index.jsp");
			return;
		}
		String assetName = request.getParameter("assetName");
		User loggedInUser = (User)request.getSession().getAttribute("user");
		try{
			//int id = InsertDao.addAsset(assetName,(String)request.getSession().getAttribute("userId"));
			
			// For testing using this line for now, 
			// till we get the authentication module ready
			int id = InsertDao.addAsset(assetName,loggedInUser.getId());
			request.getSession().setAttribute("successMessage", "Asset added successfully.");
			response.sendRedirect("estate/addAsset.jsp");
		}
		catch(ApplicationException e){
			request.getSession().setAttribute("errorMessage", e.getMessage());
			response.sendRedirect("estate/addAsset.jsp");			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
