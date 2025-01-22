import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class rootServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Project4";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "rootuser";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String query = request.getParameter("query");

     // makes sure its not empty
        if (query == null || query.trim().isEmpty()) {
            request.setAttribute("error", "Query cannot be empty.");
            request.getRequestDispatcher("rootHome.jsp").forward(request, response);
            return;
        }
        
        // creates lists to hold column names and rows
        List<String> columnNames = new ArrayList<>();
        List<List<String>> rows = new ArrayList<>();
        
        //All the databse stuff
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
        	Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();

            // gets column names
            for (int i = 1; i <= columnCount; i++) {
                columnNames.add(metaData.getColumnName(i));
            }

            // gets row data
            while (rs.next()) {
                List<String> row = new ArrayList<>();
                for (int i = 1; i <= columnCount; i++) {
                    row.add(rs.getString(i));
                }
                rows.add(row);
            }

            request.setAttribute("columnNames", columnNames);
            request.setAttribute("rows", rows);

        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("error", "Error executing query: " + e.getMessage());
        }

        // Forwards to JSP
        request.getRequestDispatcher("rootHome.jsp").forward(request, response);
    }
}