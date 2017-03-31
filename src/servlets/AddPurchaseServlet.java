
package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.AddPurchaseDAO;
import com.ApplicationException;
import com.Purchase;
import com.RequestValidator;
import com.User;

@WebServlet("/AddPurchaseServlet")
public class AddPurchaseServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
		if(! RequestValidator.validate(request)){
			request.getSession().setAttribute("errorMessage", "Please log in.");
			response.sendRedirect("index.jsp");
			return;
		}
		Purchase purchase = new Purchase();
		User loggedInUser = (User)request.getSession().getAttribute("user");
		
		int assetId = (Integer.parseInt(request.getParameter("asset")));
		//System.out.println( "Asset  " + assetId);
		
		String approval_date = request.getParameter("approval_date") + " 00:00:00";
		String bill_date = request.getParameter("bill_date") + " 00:00:00";
		
			try {
				Date approvalDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(approval_date);
				purchase.setApprovalDate(approvalDate);
				//System.out.println("Asset Approval Date  " + approvalDate);
				
				Date billDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(bill_date);
				purchase.setBillDate(billDate);
			} 
			catch (ParseException e) {
				request.getSession().setAttribute("errorMessage","Date not in correct format.");
				response.sendRedirect("estate/addPurchase.jsp");	
			}
		
		purchase.setApprovedQuantity(Integer.parseInt(request.getParameter("approved_quantity")));
		
		//int purchased_quantity = Integer.parseInt(request.getParameter("purchased_quantity"));
		purchase.setPurchaseQuantity(Integer.parseInt(request.getParameter("purchased_quantity")));
		
		purchase.setUnitCost(Float.parseFloat(request.getParameter("unit_cost")));
		purchase.setSpecification(request.getParameter("specification"));
		purchase.setSupplierDetails(request.getParameter("supplier_details"));
		purchase.setBillNo(request.getParameter("bill_no"));
		
		
		purchase.setRemarks(request.getParameter("remarks"));
		purchase.setCSRNo(request.getParameter("csr_no"));
		
		try {
			AddPurchaseDAO.insertPurchasedAsset(assetId, loggedInUser.getId(), purchase);
			request.getSession().setAttribute("successMessage", "Asset added successfully.");
			response.sendRedirect("estate/addPurchase.jsp");
		}catch (ApplicationException e) {
			request.getSession().setAttribute("errorMessage", e.getMessage());
			response.sendRedirect("estate/addPurchase.jsp");	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}