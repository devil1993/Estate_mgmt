<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in to Estate Management System</title>
</head>
<body>
<div id="wrapper" align="center">
<h1>Welcome to Estate Management System</h1>
<h4>Please log in to continue</h4>
<form action="LoginServlet" method="post">
	Username: 
	<input id="usrname" name="usrname" type="text" required="required"/>
	<br/>
	Password: 
	<input id="pwd" name="pwd" type="password" required="required"/>
	<br>
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
	
	<input type="submit" value="Log In" />
	<input type="reset" value="Clear" />
</form>
</div>
</body>
</html>