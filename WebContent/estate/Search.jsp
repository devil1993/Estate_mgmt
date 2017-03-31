<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
</head>
<body>
<div id="wrapper" align="center">
<form action="../SearchServlet" method="get">
Enter start date: <input name="sdate" type="text" />
<br/>	
Enter end date: <input name="edate" type="text" />
<br/>
Purchase:<input type="radio" name="what" value="purchase" checked />
Delivery:<input type="radio" name="what" value="delivery"/>
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
<input type="submit" value="Get" />
</form>
<a href="../LogOutServlet">Log Out</a>
<a href="dashboard.jsp">Back to dashboard</a>
</div>
</body>
</html>