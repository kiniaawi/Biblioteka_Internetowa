package Servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;

@WebServlet(name = "Servlet/RegistrationServlet", urlPatterns = {"/RegistrationServlet"})
public class RegistrationServlet extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            //https://www.geeksforgeeks.org/create-a-simple-login-web-application-with-encrypted-password-in-java/
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                
                String url = "jdbc:mysql://localhost:3306/jdbc_sample";
                String user = "root";
                String passwo = "";
                
                Connection db = DriverManager.getConnection(url, user, passwo);
                db.setAutoCommit(true);
                
                String login = request.getParameter("name");
                String password = request.getParameter("password");
                String passwordR = request.getParameter("passwordRep");
                
                if(login.length() < 4 || password.length() < 4 || passwordR.length() < 4) {
                    response.sendRedirect("regError.jsp");
                } else {
                    PreparedStatement ps = db.prepareStatement("INSERT INTO dane_logowania (login, password) VALUES ('"+login+"', '"+password+"');");
                ps.executeUpdate();
                response.sendRedirect("http://localhost:8080/LogowanieBbltk/logFromGuest.jsp");
                }
                
                
            } catch(IOException | ClassNotFoundException | SQLException e) {
                System.out.println(e); 
            }      
    }
}
            
            
            
            
            
            
            
       
    


