<%@page import="com.RequestValidator"%>
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
<%
	if(! RequestValidator.validate(request)){
		request.getSession().setAttribute("errorMessage", "Please log in.");
		response.sendRedirect("../index.jsp");
		return;
	}
%>
<h3>Create new user</h3>
<form action="../CreateUserServlet" method="post">
Full Name: <input type="text" name="fname" required="required" />
User Name: <input type="text" name="uname" required="required" />
Password: <input type="password" name="pwd" required="required" />
<input type="submit" value="Add User" /> 
</form>

<h3>Reset Password</h3>
<form action="../ResetPasswordServlet" method="post">
User Name: <input type="text" name="uname" required="required" />
Password: <input type="password" name="pwd" required="required" />
<input type="submit" value="Reset" /> 
</form>
<%
		String errmsg = (String)request.getSession().getAttribute("errorMessage");
		request.getSession().removeAttribute("errorMessage");
		String successMsg = (String)request.getSession().getAttribute("successMessage");
		request.getSession().removeAttribute("successMessage");
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

<a href="../LogOutServlet">Log Out</a>
<a href="dashboard.jsp">Back to dashboard</a>
</div>
</body>
</html>