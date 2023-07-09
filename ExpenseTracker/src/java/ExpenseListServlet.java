
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@WebServlet(urlPatterns = {"/ExpenseListServlet"})
public class ExpenseListServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ExpenseDao expenseDao = new ExpenseDao();
        List<Expanse> expenses = null;
        try {
            expenses = expenseDao.getAllExpenses();
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        log(expenses.toString());
        request.setAttribute("expenses", expenses);
        request.getRequestDispatcher("Expenses.jsp").forward(request, response);
    }
}
