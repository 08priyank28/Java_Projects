<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
    .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        transition: 0.3s;
        width: 300px;
        margin: 40px;
        display: inline-block;
        vertical-align: top;
    }

    .card:hover {
        box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
    }

    .card-header {
        background-color: #f1f1f1;
        padding: 10px;
        font-weight: bold;
        text-align: center;
    }

    .card-body {
        padding: 10px;
    }
</style>

    </head>
    <body>
<%
    // establish database connection
    String dbUrl = "jdbc:mysql://localhost:3306/expenses_tracker";
    String dbUsername = "root";
    String dbPassword = "";
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
    
    // query to fetch total expenses by category
    String query = "SELECT category, SUM(amount) as total_expenses FROM expense GROUP BY category";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);

    // create card UI for each category
    while (rs.next()) {
        String category = rs.getString("category");
        double totalExpenses = rs.getDouble("total_expenses");
        %>
        <div class="card">
            <div class="card-header">
                <%= category %>
            </div>
            <div class="card-body">
                <p>Total Expenses: <%= totalExpenses %></p>
            </div>
        </div>
        <%
    }

    // close database connection
    rs.close();
    stmt.close();
    conn.close();
%>
    </body>
</html>
