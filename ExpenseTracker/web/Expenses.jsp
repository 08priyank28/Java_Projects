<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Expense List</title>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<style>
		body {
			font-family: 'Open Sans', sans-serif;
			background-color: #f9f9f9;
		}
		h1 {
			font-weight: 300;
			text-align: center;
			margin-top: 50px;
			margin-bottom: 30px;
			color: #555;
		}
		table {
			background-color: #fff;
			border-collapse: collapse;
			width: 80%;
			margin: auto;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			border-radius: 5px;
			overflow: hidden;
			position: relative;
		}
		th, td {
			padding: 10px;
			text-align: left;
		}
		th {
			background-color: #4CAF50;
			color: #fff;
		}
		tr:nth-child(even) {
			background-color: #f2f2f2;
		}
		.btn {
			display: inline-block;
			padding: 8px 12px;
			font-size: 14px;
			font-weight: 700;
			text-transform: uppercase;
			color: #fff;
			background-color: #ED2B2A;
			border-radius: 5px;
			text-decoration: none;
			margin-right: 10px;
			margin-top: 10px;
			transition: background-color 0.3s ease;
		}
		.btn:hover {
			background-color: #2E8B57;
			cursor: pointer;
		}
		.add-btn {
			background-color: #2196F3;
			margin-top: 30px;
			margin-bottom: 50px;
			margin-left: 40%;
			margin-right: 40%;
			display: block;
			text-align: center;
			padding: 15px;
			border-radius: 5px;
			text-decoration: none;
			color: #fff;
			font-weight: 700;
			text-transform: uppercase;
			transition: background-color 0.3s ease;
		}
		.add-btn:hover {
			background-color: #0D47A1;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<h1>Expense List</h1>
	<a href="AddExpanse.jsp" class="add-btn">Add Expense</a>
	<table>
		<thead>
			<tr>
				<th>Date</th>
				<th>Category</th>
				<th>Description</th>
				<th>Amount</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
                    <c:forEach var="expense" items="${expenses}">
                        <tr>
                            <td>${expense.getDate()}</td>
                            <td>${expense.getCategory()}</td>
                            <td>${expense.getDescription()}</td>
                            <td>${expense.getAmount()}</td>
                            <td>
                                    <form action="DeleteExpenseServlet">
                                        <input type="hidden" name="id" value="${expense.id}">
                                        <button type="submit" class="btn">Delete</button>
                                    </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
        </table>
</body>
</html>
