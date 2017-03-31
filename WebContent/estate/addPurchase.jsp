<%@page import="com.RequestValidator"%>
<%@page import="com.SearchDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List" import="java.lang.*" import="com.Asset"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script   src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
<title>Insert title here</title>

<script type="text/javascript">
function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
            return false;

        return true;
 }
</script>

</head>
<body>

	<form id="AddPurchase" name="AddPurchase" method="POST" action="../AddPurchaseServlet">
		<select name="asset" id="asset">
			<option value="" selected="selected">Select Asset</option>
			<%
				if(! RequestValidator.validate(request)){
					request.getSession().setAttribute("errorMessage", "Please log in.");
					response.sendRedirect("../index.jsp");
					return;
				}
				List<Asset> assetModel = SearchDAO.getAllAssests();
				for(Asset list : assetModel){
			%>
		 	<option value="<%=list.getId()%>" ><%=list.getAssetName()%></option>
			<%			
				}
			%>
		</select>
		<br>
		
		Approval Date:<input type="date" name="approval_date" id="approval_date" /> 
		<br>
		Approved Quantity: <input type="text" required="required" step="1" min="0" class="numbersOnly" name="approved_quantity" id="approved_quantity"/>
		<br>
		Purchased Quantity: <input type="number" required="required" step="1" min="0" name="purchased_quantity" id="purchased_quantity"/>
		<br>
		Unit Cost: <input type="number" required="required" step="1" min="0" name="unit_cost" id="unit_cost" />
		<br>
		Specifications: <textarea name="specification" id="specification" rows="4" cols="50"> </textarea>
		<br>
		Supplier Details: <textarea name="supplier_details" id="supplier_details" rows="4" cols="50"> </textarea>
		<br>
		Bill No.: <input type="text" name="bill_no" id="bill_no" />
		<br>
		Bill Date; <input type="date" name="bill_date" id="bill_date" />
		<br>
		Remarks: <textarea name="remarks" id="remarks" rows="4" cols="50"> </textarea>
		<br>
		CSR No.: <input type="text" name="csr_no" id="csr_no" />
		<br>
		<INPUT TYPE="submit" VALUE="Submit New Purchase" NAME="submitPurchase" style="cursor: pointer;" class="action_btn"/>
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
	<div align="center"><a href="../LogOutServlet">Log Out</a>
	<a href="dashboard.jsp">Back to dashboard</a></div>
	
	</form>
	<script type="text/javascript">
	$(function() {
	
	$('.numbersOnly').blur(function () { 
	    this.value = this.value.replace(/[^0-9\.]/g,'');
	    var value=this.value;
	    if(value.indexOf(".")>=0)
	    	this.value="";
		});
	});
	</script>
</body>
</html>