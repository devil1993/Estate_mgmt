package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Purchase;
import com.SearchDAO;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String what = request.getParameter("what");
		System.out.println(sdate+" "+edate+" "+what);
		System.out.println();
		try { 
			Date startDate = new Date(sdate);
			Date endDate = new Date(edate);
			System.out.println(startDate.toString()+" "+endDate.toString());
			ArrayList<Purchase> p = SearchDAO.getPurchase(startDate, endDate);
			System.out.println(p.size());
			request.setAttribute("listPurchase", p);
			RequestDispatcher rd = request.getRequestDispatcher("estate/displayPurchase.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			response.getWriter().append(e.getMessage()+"\n");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
