<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add Expense</title>
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
		form {
			background-color: #fff;
			padding: 20px;
			border-radius: 5px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			max-width: 500px;
			margin: auto;
		}
		input[type="text"], input[type="number"], input[type="date"], select {
			display: block;
			width: 95%;
			padding: 10px;
			border-radius: 5px;
			border: none;
			margin-bottom: 20px;
			box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
		}
		input[type="submit"] {
			background-color: #4CAF50;
			color: #fff;
			border: none;
			padding: 10px;
			border-radius: 5px;
			cursor: pointer;
			transition: background-color 0.2s ease-in-out;
		}
		input[type="submit"]:hover {
			background-color: #3e8e41;
		}
	</style>
</head>
<body>
	<h1>Add Expense</h1>
	<form action="AddExpenseServlet" method="post">
                <label for="date">Date:</label>
		<input type="date" id="date" name="date" required>
            
		<label for="description">Description:</label>
		<input type="text" id="description" name="description" required>

		<label for="amount">Amount:</label>
		<input type="number" id="amount" name="amount" min="0" step="0.01" required>

		<label for="category">Category:</label>
		<select id="category" name="category">
			<option value="Food">Food</option>
			<option value="Transportation">Transportation</option>
			<option value="Entertainment">Entertainment</option>
			<option value="Shopping">Shopping</option>
			<option value="Other">Other</option>
		</select>

		<input type="submit" value="Add Expense">
	</form>
</body>
</html>
