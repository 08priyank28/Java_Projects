import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExpenseDao {
    private Connection connection;

    public ExpenseDao() {
        connection = DatabaseConnection.getConnection();
    }

    public void addExpense(Expanse expense) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("insert into expense(date, description, category, amount) values (?, ?, ?, ?)");
        preparedStatement.setDate(1, new java.sql.Date(expense.getDate().getTime()));
        preparedStatement.setString(2, expense.getDescription());
        preparedStatement.setString(3, expense.getCategory());
        preparedStatement.setDouble(4, expense.getAmount());
        preparedStatement.executeUpdate();
    }

    public void deleteExpense(int id) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("delete from expense where id=?");
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
    }

    public List<Expanse> getAllExpenses() throws SQLException {
        List<Expanse> expenses = new ArrayList<Expanse>();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from expense");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            
            Expanse expense = new Expanse();
            expense.setId(resultSet.getInt("id"));
            expense.setDate(resultSet.getDate("date"));
            expense.setDescription(resultSet.getString("description"));
            expense.setCategory(resultSet.getString("category"));
            expense.setAmount(resultSet.getDouble("amount"));
            expenses.add(expense);
        }
        return expenses;
    }
}
