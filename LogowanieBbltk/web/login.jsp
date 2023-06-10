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
                display: flex;
                position: absolute;
                justify-content: center;
                text-align: center;
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
                text-align: center;
            }
        </style>
    </head>
    <body>

        <div class="containerWithBars"> 
            <header>
                <h1>Internetowa Biblioteka Kinga</h1> </header>
        <h2>Zalogowany użytkownik: <%=request.getSession().getAttribute("name") %></h2>
        <br>
        <div class="centerText">
            <form action="logOut.jsp" method="post">
                <input type="submit" align="center" value="Wyloguj">
            </form>
        </div>
        
        <br><br>
        
        <div class="centerText">
            <form action="borrowedBooks.jsp" method="post">
                <input type="submit" value="Moje wypożyczone książki">
            </form>
        </div>
        
        <br><br>
        
            <form action="login.jsp" method="get">
                <p>Wyszukaj po tytule książki</p>
                Tytuł: 
                <input type="text" name="tytul">
                <input type="submit" value="Szukaj">  
            </form>
        
        

        <br>    
      
    <%
        Class.forName("com.mysql.jdbc.Driver");
                
            String url = "jdbc:mysql://localhost:3306/jdbc_sample";
            String user = "root";
            String passwo = "";
                
            Connection db = DriverManager.getConnection(url, user, passwo);
            db.setAutoCommit(true);
            
            Connection db2 = DriverManager.getConnection(url, user, passwo);
            db2.setAutoCommit(true);
            
            String tyt = request.getParameter("tytul");
                
            Statement st = db.createStatement();
            Statement st2 = db.createStatement();
            
            PreparedStatement ps = db.prepareStatement("SELECT * FROM dane_ksiazki WHERE tytul LIKE '%" + tyt + "%'");
            ResultSet rs = ps.executeQuery(); 
            
            PreparedStatement ps2 = db2.prepareStatement("SELECT * FROM dane_ksiazki");
            ResultSet rs2 = ps2.executeQuery();
         
        
        if(tyt != null) {
        out.println("<div class='from-center'>"+"<div class='centerText'>"+"<h3>Znalezione wyniki</h3>"+"<br><br><br>"+"</div>");
            while(rs.next()) {
                int id = rs.getInt(1);
                String tytu = rs.getString(2);
                String autor = rs.getString(3);
                String rok = rs.getString(4);
                String opis = rs.getString(5);
                int szt = rs.getInt(6);
                String obraz = rs.getString(7);

            out.println(
            "<div style = 'width:400px; height:650px; float: left; border:1px solid plum; margin: 10px; text-align:center'> <img src = '" + obraz +  "' style='width:150px; height:150px; margin:10px;  border-radius: 25px;'>" +  "<br> " + 
             tytu + "<br>" + "autor: " + autor + "<br>" + "rok wydania: " + rok + "<br>" + "opis: " + opis + "<br>" + "szt: " + szt + "<br/>"+"<form action='WypServlet' method='post'><input type='hidden' name='idK' value='" + id + "'><br><input type='submit' value='Wypozycz' name='wypozycz'></form>" + "</div><br><br>");
            }
            out.println("</div>");
            
        } else {
        out.println("<div class='from-center'>"+"<p class='bold'>"+"Popularne książki"+"</p>");
            while(rs2.next()) {
                int id2 = rs2.getInt(1);
                String tytu2 = rs2.getString(2);
                String autor2 = rs2.getString(3);
                String rok2 = rs2.getString(4);
                String opis2 = rs2.getString(5);
                int szt2 = rs2.getInt(6);
                String obraz2 = rs2.getString(7);

            out.println(
            "<div style = 'width:400px; height:650px; border:1px solid plum; margin: 10px; text-align:left'> <img src = '" + obraz2 +  "' style='width:150px; height:150px; margin:10px;  border-radius: 25px;'>" +  "<br> " + "<p class='bold'>" +
             tytu2 + "</p>" + "Autor: " + autor2 + "<br>" + "Rok wydania: " + rok2 + "<br/>" + "Opis: " + opis2 + "<br/>" + "Szt: " + szt2 + "<br/>"+ "<form action='Wyp2Servlet' method='post'><input type='hidden' name='idK2' value='" + id2 + "'>"+"<br>"+"<input type='submit' value='Wypozycz' name='wypozycz2'></form>" + "</div><br><br>");
            }
            out.println("</div>");
        }

    %>
    
    </div>  
    
    <br><br> <br><br>
         <br><br>
         <br><br>
         <br><br>
         <br><br>
         <br><br>
        
        
        
              
    </body>
</html>
