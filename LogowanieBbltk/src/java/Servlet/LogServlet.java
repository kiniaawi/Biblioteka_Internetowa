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

@WebServlet(name = "Servlet/LogServlet", urlPatterns = {"/LogServlet"})
public class LogServlet extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //B253
        
            String login=request.getParameter("name");
            String passwd=request.getParameter("password");
            int idU=0;
            
            boolean check = false;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                
                String url = "jdbc:mysql://localhost:3306/jdbc_sample";
                String user = "root";
                String passwo = "";
                
                Connection db = DriverManager.getConnection(url, user, passwo);
                db.setAutoCommit(true);
                
                Statement st = db.createStatement();
                
                ResultSet rs = st.executeQuery("select * from dane_logowania");
                //ResultSet rs2 = st.executeQuery("select id from dane_logowania where login = '" + login + "'; ");
                    
                    while (rs.next()) {                 
                        if (login.equals(rs.getString(2))&& passwd.equals(rs.getString(3)))
                        {
                            idU = rs.getInt("id");
                            check=true; 
                            break;
                        }  
                    }   
                    
                rs.close();
                //rs2.close();
                st.close();
                db.close();
                
            } catch(ClassNotFoundException | SQLException wyjatek) {
                System.out.println("SQLException: " + wyjatek.getMessage());
            }
        //Logger.getLogger(LogServlet.class.getName()).log(Level.SEVERE, null, ex);

        if(check==true) {
            
            if(login.equals("admin") && passwd.equals("admin")) {
                HttpSession session=request.getSession();
 
                session.setAttribute("loggenIn", "true");
                session.setAttribute("name",login);
                session.setAttribute("password",passwd);
                session.setAttribute("idU", idU );
                
                response.sendRedirect("admin.jsp");
                
            } else {
                HttpSession session=request.getSession();
                session.setAttribute("loggedIn", "true");
                session.setAttribute("name",login);
                session.setAttribute("password",passwd);
                session.setAttribute("idU", idU);
                
                response.sendRedirect("login.jsp"); 
            }   
        } else {
                request.setAttribute("error", true);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
        }            
    }
}
            
            
            
            
            
            
            
            
            
            //================================================
            //User u=new User();
            //u.setName(login);
            //u.setPassword(passwd);
            /*if(login.equals("Kinga")&&passwd.equals("admin")) {
                HttpSession session=request.getSession();
                
                session.setAttribute("name",login);
                session.setAttribute("password",passwd);
                
                //session.setAttribute("user", u);
                
                response.sendRedirect("login.jsp");
            }
            else {
                request.setAttribute("error", true);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
    }*/

    


