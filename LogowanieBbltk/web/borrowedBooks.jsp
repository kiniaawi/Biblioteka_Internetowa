<%
if (session.getAttribute("loggedIn")=="false") 
{
 response.sendRedirect("index.jsp");  
}
%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="jakarta.servlet.annotation.WebServlet" %>
<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Internetowa Biblioteka Kinga</title>
        
        <style> 
            body { 
                background-color: cornsilk; 
                display: flex;
                flex: 1;
                overflow: auto;
            }
            
            .containerWithBars {
                background-color: pink;
                position: fixed;
                border: 5px solid plum;
                width: 80%;
                height: 100%;
                left: 150px;
                right: 150px; 
                overflow: auto;
                
            }
            
            .from-center {
                background-color: lavenderblush;
                position: absolute;
                width: 90%;
                height: 100%;
                display: flex;
                justify-content: center;
                border: 2px solid plum;
                padding: 1%;
                left: 4%;  
                flex: 1;
                overflow-x: auto;
            }
            
            .centerText {
                position: absolute;
                height: 20px;
                padding: 1%;
                text-align: left;
            }
            
            .bold {
                font-weight: bold;
                text-align: center;
                padding: 2%;
            }
            
            h1 {
                text-align: center;
                background-color: linen;
                padding: 5px;
            }
            
            h2 {
                text-align: center;
                background-color: linen;
                padding: 5px;
            }
            
             h3 {
                text-align: left;
            }
        </style>
    </head>
    <body>

        <div class="containerWithBars"> 
            <header>
                <h1>Internetowa Biblioteka Kinga</h1> </header>
            <h2>Zalogowany użytkownik: <%=request.getSession().getAttribute("name") %></h2> <br>
         
         <div class="centerText">
            <form action="login.jsp" method="post">
                <input type="submit" align="center" value="Wypozyczalnia">
            </form>
        </div>
            
            <br><br><br>   
        <div class="centerText">
            <form action="logOut.jsp" method="post">
                <input type="submit" align="center" value="Wyloguj">
            </form>
        </div>
            
            <br><br><br>
        
   
      
    <%
        Class.forName("com.mysql.jdbc.Driver");
                
            String url = "jdbc:mysql://localhost:3306/jdbc_sample";
            String user = "root";
            String passwo = "";
                
            Connection db = DriverManager.getConnection(url, user, passwo);
            db.setAutoCommit(true);
            
            String tyt = request.getParameter("tytul");
                
            Statement st = db.createStatement();
            
            PreparedStatement ps = db.prepareStatement("SELECT d.id, d.tytul, d.autor, d.rok_wydania, d.opis, d.sztuki, d.image_src FROM dane_ksiazki d, wypozyczone k WHERE k.idK = d.id AND k.idU = '" + request.getSession().getAttribute("idU") +"';");
            ResultSet rs = ps.executeQuery();
         
        out.println("<div class='from-center'>"+"<div class='centerText'>"+"<h3>Moje wypożyczone książki</h3>"+"<br><br><br>"+"</div>");
            while(rs.next()) {
                int id = rs.getInt(1);
                String tytu = rs.getString(2);
                String autor = rs.getString(3);
                String rok = rs.getString(4);
                String opis = rs.getString(5);
                int szt = rs.getInt(6);
                String obraz = rs.getString(7);

            out.println(
            "<br>"+"<div style = 'width:400px; height:650px; float: left; border:1px solid plum; margin: 10px; text-align:center'> <img src = '" + obraz +  "' style='width:150px; height:150px; margin:10px;  border-radius: 25px;'>" +  "<br> " + 
             tytu + "<br>" + "autor: " + autor + "<br>" + "rok wydania: " + rok + "<br>" + "opis: " + opis + "<br>" + "szt: 1"+ "<br/>"+"<form action='DelBookServlet' method='post'><input type='hidden' name='idK' value='" + id + "'><br><input type='submit' value='Oddaj' name='oddaj'></form>" + "</div>");
            }
            out.println("</div>");
            
  
    %>
    
    </div>  
        
        
              
    </body>
</html>
