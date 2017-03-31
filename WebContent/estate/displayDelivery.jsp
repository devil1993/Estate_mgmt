<%@page import="com.Delivery"%>
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
<th>Asset</th>
<th>Delivered To</th>
<th>Date of Entry</th>
<th>Issue Date</th>
<th>Issue Quantity</th>
<th>Requisition Number</th>
<th>CSR Number</th>
<th>Remarks</th>
</thead>
<%
ArrayList<Delivery> d = (ArrayList<Delivery>)request.getAttribute("listDelivery");
for(Delivery dl : d){
	%>
	<tr>
	<td><%=dl.getId() %></td>
	<td><%=dl.getAsset().getAssetName() %></td>
	<td><%=dl.getDl().getDlName() %></td>
	<td><%=dl.getEntryDate() %></td>
	<td><%=dl.getIssueDate() %></td>
	<td><%=dl.getIssueQuantity() %></td>
	<td><%=dl.getRequisitionNumber() %></td>
	<td><%=dl.getCSRNumer() %></td>
	<td><%=dl.getRemarks() %></td>
	</tr>
	<%
}
%>
</table>
<div align="center"><a href="../LogOutServlet">Log Out</a>
<a href="dashboard.jsp">Back to dashboard</a></div>
</body>
</html>