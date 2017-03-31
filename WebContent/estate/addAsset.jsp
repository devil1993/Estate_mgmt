<%@page import="com.RequestValidator"%>
<%@page import="com.SearchDAO"%>
<%@page import="com.Asset"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Asset</title>
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
<form action="../AddAssetServlet" method="post">
Enter asset name:
<input type="text" name="assetName" required="required"/>
<input type="submit" value="Create" />
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
		ArrayList<Asset> available = SearchDAO.getAllAssests();
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
<h3>Available Assets</h3>
<table>
<thead>
<th>ID</th>
<th>Name</th>
<th>Created On</th>
<th>Available Count</th>
</thead>
<% for(Asset a : available){
%>
<tr>
<td><%=a.getId() %></td>
<td><%=a.getAssetName() %></td>
<td><%=a.getCreatedOn() %></td>
<td><%=a.getAvailableCount() %></td>
</tr>
<%} %>

</table>
<div align="center"><a href="../LogOutServlet">Log Out</a>
<a href="dashboard.jsp">Back to dashboard</a></div>
</div>
</body>
</html>