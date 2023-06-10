/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.*;
import java.lang.NumberFormatException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(name = "AdminServlet", urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        
        
            String tytul=request.getParameter("tytul");
            String autor=request.getParameter("autor");
            String rok=request.getParameter("rok");
            String opis=request.getParameter("opis");
            int szt=Integer.parseInt(request.getParameter("szt"));
            String obraz=request.getParameter("obraz");
          
            try {
                Class.forName("com.mysql.jdbc.Driver");
                
                String url = "jdbc:mysql://localhost:3306/jdbc_sample";
                String user = "root";
                String passwo = "";
                
                Connection db = DriverManager.getConnection(url, user, passwo);
                db.setAutoCommit(true);
                 
                
                if(request.getParameter("Dodaj")!=null) {
                PreparedStatement ps = db.prepareStatement("INSERT INTO dane_ksiazki (tytul, autor, rok_wydania, opis, sztuki, image_src)"
                    + "VALUES ('" + tytul +"','" + autor +"','" + rok +"','" + opis +"','" + szt +"','" + obraz +"');");
                ps.executeUpdate();
                    
                response.sendRedirect("admin.jsp"); 
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
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
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
