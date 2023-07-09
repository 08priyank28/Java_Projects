import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


@WebServlet(urlPatterns = {"/AddExpenseServlet"})
public class AddExpenseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get the form data
        String dateString = request.getParameter("date");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        double amount = Double.parseDouble(request.getParameter("amount"));

        // convert the date string to a Date object
        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // create a new Expense object
        Expanse expense = new Expanse(date, description, category, amount);

        // insert the new expense into the database
        ExpenseDao expenseDao = new ExpenseDao();
        try {
            expenseDao.addExpense(expense);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // redirect to the Expenses page
        response.sendRedirect("ExpenseListServlet");
    }
}
