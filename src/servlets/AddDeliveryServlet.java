package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.AddDeliveryDAO;
import com.ApplicationException;
import com.Asset;
import com.Delivery;
import com.DeliveryLocation;
import com.RequestValidator;
import com.User;

/**
 * Servlet implementation class AddDeliveryServlet
 */
@WebServlet("/AddDeliveryServlet")
public class AddDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddDeliveryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
    	if(! RequestValidator.validate(request)){
			request.getSession().setAttribute("errorMessage", "Please log in.");
			response.sendRedirect("index.jsp");
			return;
		}
		HttpSession session = request.getSession(true);
		System.out.println("in Add Delivery Servlet");
		Delivery delivery = new Delivery();
		
		int loggedInUser = ((User) session.getAttribute("user")).getId();
		
		
		int assetId = (Integer.parseInt(request.getParameter("asset")));
		Asset a = new Asset();
		a.setId(assetId);
		delivery.setAsset(a);
		System.out.println( "Asset  " + assetId);
		
		int locationId = (Integer.parseInt(request.getParameter("location")));
		DeliveryLocation dl = new DeliveryLocation();
		dl.setDlId(locationId);
		delivery.setDl(dl);
		System.out.println( "Location  " + locationId);
		
		String issue_date = request.getParameter("issue_date") + " 00:00:00";
		try {
			Date issueDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(issue_date);
			delivery.setIssueDate(issueDate);
			System.out.println("Asset Approval Date  " + issueDate);
		} 
		catch (java.text.ParseException e) {
			request.getSession().setAttribute("errorMessage","Date not in correct format.");
			response.sendRedirect("estate/addDelivery.jsp");
		}
		
		delivery.setIssueQuantity(Integer.parseInt(request.getParameter("issue_quantity")));
		delivery.setRequisitionNumber(request.getParameter("requisition_no"));
		delivery.setRemarks(request.getParameter("remarks"));
		delivery.setCSRNumer(request.getParameter("csr_no"));
		try {
			AddDeliveryDAO.insertDeliveredAsset(loggedInUser, delivery);
			request.getSession().setAttribute("successMessage", "Delivery recorded successfully.");
			response.sendRedirect("estate/addDelivery.jsp");
		}catch (ApplicationException e) {
			request.getSession().setAttribute("errorMessage", e.getMessage());
			response.sendRedirect("estate/addDelivery.jsp");	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//response.sendRedirect("estate/selectAction.jsp");
	}


}
