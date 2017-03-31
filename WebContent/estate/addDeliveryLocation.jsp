<%@page import="org.omg.CORBA.DomainManagerOperations"%>
<%@page import="org.omg.CORBA.DomainManager"%>
<%@page import="com.RequestValidator"%>
<%@page import="com.SearchDAO"%>
<%@page import="com.DeliveryLocation"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add a delivery location</title>
<style type="text/css">
th{
	font-style: oblique;
	border-style: solid;
	border-color: blue;
	background-color: gray;
	border: 1px
}
table {
	text-align: center;
}
td {
	border:1px;
	border-color: navy;
	border-style: double;
}

</style>
</head>
<body>
<div id="wrapper" align="center">
<form action="../AddDLServlet" method="post">
Enter Delivery Location Name:
<input type="text" name="dlName" required="required"/>
<input type="submit" value="Add" />
<% 
		if(! RequestValidator.validate(request)){
			request.getSession().setAttribute("errorMessage", "Please log in.");
			response.sendRedirect("../index.jsp");
			return;
		}
		String errmsg = (String)request.getSession().getAttribute("errorMessage");
		request.getSession().removeAttribute("errorMessage");
		String successMsg = (String)request.getSession().getAttribute("successMessage");
		request.getSession().removeAttribute("successMessage");
		ArrayList<DeliveryLocation> available = SearchDAO.getAllDeliveryLocations();
		if(errmsg != null)
		{
	%>
		<div style="color: red"><%=errmsg %></div>		
	<%
		}
		if(successMsg != null)
		{
	%>
		<div style="color: green"><%=successMsg %></div>		
	<%
		}
	%>
</form>
<br/>
<h3>Available Delivery Locations</h3>
<table>
<thead>
<th>ID</th>
<th>Name</th>
<th>Created On</th>
</thead>
<% for(DeliveryLocation a : available){
%>
<tr>
<td><%=a.getDlId() %></td>
<td><%=a.getDlName() %></td>
<td><%=a.getCreatedOn() %></td>
</tr>
<%} %>

</table>

<div align="center"><a href="../LogOutServlet">Log Out</a>
<a href="dashboard.jsp">Back to dashboard</a></div>
</div>
</body>
</html>