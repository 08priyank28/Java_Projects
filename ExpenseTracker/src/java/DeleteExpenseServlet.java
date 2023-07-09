
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/DeleteExpenseServlet"})
public class DeleteExpenseServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ExpenseDao expenseDao = new ExpenseDao();
        try {
            expenseDao.deleteExpense(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("ExpenseListServlet");
    }
}
