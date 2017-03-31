<%@page import="com.RequestValidator"%>
<%@page import="com.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper" align="center">
<div align="right"><a href="../LogOutServlet">Log Out</a></div>
<h3>
<%
	if(! RequestValidator.validate(request)){
		request.getSession().setAttribute("errorMessage", "Please log in.");
		response.sendRedirect("../index.jsp");
		return;
	}
%>
 Welcome <%=
 ((User)request.getSession().getAttribute("user")).getFullName() 
 %>
</h3>
</div>
<br>
<h4>Available tasks:</h4>
<br>
<ul>
<li><a href="addAsset.jsp">Add an Asset</a></li>
<li><a href="addDeliveryLocation.jsp">Add a Delivery Location</a></li>
<li><a href="addPurchase.jsp">Add a Purchase</a></li>
<li><a href="addDelivery.jsp">Add a Delivery detail</a></li>
<li><a href="Search.jsp">Perform an Search</a></li>
<li><a href="userManagement.jsp">User Management</a></li>

</ul>
</body>
</html>