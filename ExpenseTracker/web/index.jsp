<!DOCTYPE html>
<html>
<head>
	<title>Expense Tracker</title>
	<style>
		body {
			background-color: #f1f1f1;
			font-family: Arial, sans-serif;
		}
		h1 {
			text-align: center;
			margin-top: 50px;
		}
		.container {
			display: flex;
			flex-direction: row;
			align-items: center;
			justify-content: center;
			margin-top: 50px;
		}
		.btn {
			background-color: #4CAF50;
			color: white;
			padding: 14px 20px;
			border: none;
			cursor: pointer;
			border-radius: 5px;
			margin: 10px;
			font-size: 20px;
		}
		.btn:hover {
			background-color: #3e8e41;
		}
	</style>
</head>
<body>
	<h1>Expense Tracker</h1>
	<div class="container">
		<a href="AddExpanse.jsp"><button class="btn">Add Expense</button></a>
		<a href="ExpenseListServlet"><button class="btn">View Expenses</button></a>
	</div>
        <%@ include file="Summery.jsp" %>
</body>
</html>
