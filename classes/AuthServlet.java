import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class AuthServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		//Make sure it goes through database later
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		String password = "";
		
		 Connection con = null;
	     PreparedStatement p = null;
	     ResultSet rs = null;
	     
	     try {
	            Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/credentialsdb",
	                "root", "rootuser");
	        }
	        catch (SQLException | ClassNotFoundException e) {System.out.println(e);}
	 
	        // Try block to catch exception/s
	      try {
	    	  
	    	  //pass.equals (select login_password from usercredentials where login_username="user") 
	 
	            // SQL command data stored in String datatype
	            String sql = "select login_password from usercredentials where login_username=\""+ user +"\"";
	            p = con.prepareStatement(sql);
	            rs = p.executeQuery();
	 
	            // Printing ID, name, email of customers
	            // of the SQL command above
	            System.out.println("login_password");
	 
	            // Condition check
	            while (rs.next()) {
	                password = rs.getString("login_password");
	            }
	        }
	 
	        // Catch block to handle exception
	        catch (SQLException e) {
	 
	            // Print exception pop-up on screen
	            System.out.println(e);
	        }
		
		
		if(pass.equals(password)){
			if(user.equals("root")) {
				response.sendRedirect("rootHome.jsp");
				return;
			}
			else if(user.equals("client")) {
				response.sendRedirect("clientHome.jsp");
				return;
			}
			else if(user.equals("theaccountant")) {
				response.sendRedirect("accountantHome.jsp");
				return;
			}
		}
		else {
			response.sendRedirect("ErrorPage.html");
			return;
		}

	}
}

