package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "WypServlet", urlPatterns = {"/WypServlet"})
public class WypServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        String idK = request.getParameter("idK");
        //String idU = request.getSession()session.getAttribute("idU");
        
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
                
            String url = "jdbc:mysql://localhost:3306/jdbc_sample";
            String user = "root";
            String passwo = "";
                
            Connection db = DriverManager.getConnection(url, user, passwo);
            db.setAutoCommit(true);
                
            //Statement st = db.createStatement();
            if(request.getParameter("wypozycz")!=null) {
            PreparedStatement ps = db.prepareStatement("INSERT INTO wypozyczone (idU, idK) VALUES ('" + request.getSession().getAttribute("idU") + "', '" + idK + "');");
            PreparedStatement ps2 = db.prepareStatement("UPDATE dane_ksiazki SET sztuki = sztuki - 1 WHERE id = '" + idK + "';");
            
            ps.executeUpdate();
            ps2.executeUpdate();
            
            response.sendRedirect("borrowedBooks.jsp");

            }
          
            
        } catch(ClassNotFoundException | SQLException wyjatek) {
            System.out.println("SQLException: " + wyjatek.getMessage());
        }
                  
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(WypServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(WypServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
