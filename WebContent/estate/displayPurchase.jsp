<%@page import="com.Purchase"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Purchases</title>
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

<body >
<table style="border: 1px; border-color:black;border-top-style: solid;">
<thead style="border: 1px; border-color:black;border-top-style: solid;">
<th>ID</th>
<th>Date of Entry</th>
<th>Approval Date</th>
<th>Approved Quantity</th>
<th>Purchase Quantity</th>
<th>Unit Cost</th>
<th>Specification</th>
<th>Supplier Details</th>
<th>Bill No</th>
<th>Bill Date</th>
<th>CSR No</th>
<th>Asset Type</th>
<th>Remarks</th>
</thead>
<%
ArrayList<Purchase> p = (ArrayList<Purchase>)request.getAttribute("listPurchase");
for(Purchase pu : p){
	%>
	<tr>
	<td><%=pu.getId() %></td>
	<td><%=pu.getEntryDate() %></td>
	<td><%=pu.getApprovalDate() %></td>
	<td><%=pu.getApprovedQuantity() %></td>
	<td><%=pu.getPurchaseQuantity() %></td>
	<td><%=pu.getUnitCost() %></td>
	<td><%=pu.getSpecification() %></td>
	<td><%=pu.getSupplierDetails() %></td>
	<td><%=pu.getBillNo() %></td>
	<td><%=pu.getBillDate() %></td>
	<td><%=pu.getCSRNo() %></td>
	<td></td>
	<td><%=pu.getRemarks() %></td>
	</tr>
	<%
}
%>
</table>

</body>
</html>