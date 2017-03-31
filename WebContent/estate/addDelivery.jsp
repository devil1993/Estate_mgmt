<%@page import="com.RequestValidator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DeliveryLocation"%>
<%@page import="com.SearchDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.lang.*" import="com.Asset"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script   src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
<title>Add Delivery</title>
</head>
<body>
<%
	if(! RequestValidator.validate(request)){
		request.getSession().setAttribute("errorMessage", "Please log in.");
		response.sendRedirect("../index.jsp");
		return;
	}
	ArrayList<Asset> assetList = SearchDAO.getAllAssests();
	ArrayList<DeliveryLocation> locationList = SearchDAO.getAllDeliveryLocations();
	String errmsg = (String)request.getSession().getAttribute("errorMessage");
	request.getSession().removeAttribute("errorMessage");
	String successMsg = (String)request.getSession().getAttribute("successMessage");
	request.getSession().removeAttribute("successMessage");
%>
	<form id="AddDelivery" name="AddDelivery" method="POST" action="../AddDeliveryServlet">
	Select Asset to deliver:
	<select name="asset" id="asset">
			<option value="" selected="selected">Select Asset</option>
			<%
				for(Asset a : assetList){
			%>
		 			<option value="<%=a.getId()%>" ><%=a.getAssetName()%></option>
			<%			
				}
			%>
			
		</select>
		<%
				//List<Asset> assetList1 = (List<Asset>)session.getAttribute("assetList");
				for(Asset a : assetList){
			%>
		 			<input type="hidden" value="<%=a.getAvailableCount() %>" id ="<%=a.getId()%>" />
			<%			
				}
			%>
		<div style="color: blue" id='quantity'></div>
		
		Select Delivery location:
					  
		<select name="location" id="location">
			<option value="" selected="selected">Select Location</option>
			<%
				for(DeliveryLocation d : locationList){
			%>
					<option value="<%=d.getDlId()%>" ><%=d.getDlName()%></option>
			<%	
				}
			%>
		</select>
		<br>
		Issue Date:<input type="date" name="issue_date" id="issue_date" required/> 
		<br>
		Issue Quantity: <input type="number" required="required" step="1" min="0" name="issue_quantity" id="issue_quantity" />
		<br>
		Requisition No.: <input type="text" name="requisition_no" id="requisition_no" required />
		<br>
		Remarks: <textarea name="remarks" id="remarks" rows="4" cols="50"> </textarea>
		<br>
		CSR No.: <input type="text" name="csr_no" id="csr_no" required />
		<br>
		<%
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
		<INPUT TYPE="submit" VALUE="Submit New Delivery" NAME="submitDelivery" style="cursor: pointer;" class="action_btn"/>
	</form>
	<div align="center"><a href="../LogOutServlet">Log Out</a>
	<a href="dashboard.jsp">Back to dashboard</a></div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#asset").change(function(){
				var assetid = $("#asset").val();				
				var count = $("#"+assetid).val();
				$("#quantity").html("Available quantity:"+count);
			});
		});
	</script>
</body>
</html>