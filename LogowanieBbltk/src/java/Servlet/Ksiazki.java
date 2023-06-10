package Servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "Ksiazki", urlPatterns = {"/Ksiazki"})
public class Ksiazki extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String tyt=request.getParameter("tytul");
            String aut=request.getParameter("autor");
            
            Cookie tytulC = new Cookie("tytul", request.getParameter("tytul"));
            Cookie autorC = new Cookie("autor", request.getParameter("autor"));
            
            tytulC.setMaxAge(60*60*24);
            autorC.setMaxAge(60*60*24);
            
            response.addCookie(tytulC);
            response.addCookie(autorC);
            
            //User u=new User();
            //u.setName(login);
            //u.setPassword(passwd);
            
            HttpSession session2=request.getSession();
                
                session2.setAttribute("tytul",tyt);
                session2.setAttribute("autor",aut);
            
                
                //session.setAttribute("user", u);
                
                response.sendRedirect("ksiazki.jsp");
            
    }

    

}

