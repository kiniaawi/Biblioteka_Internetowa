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
    <head>
        <title>Biblioteka Kinga</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
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
            
            h1 {
                text-align: center;
                background-color: linen;
                padding: 5px;
            }
            
             h3 {
                text-align: center;
            }
            
            .warningLog {
                text-align: center;
                background-color: linen;
                padding: 5px;
                border: 2px solid red;
                width: 60%;
                position: absolute;
                left: 20%;
            }
            
            .bookPosition {
                width: 60%;
                position: absolute;
                left: 20%;
            }

        </style>

    </head>
    <body>
        
        <div class="containerWithBars"> 
        <h1>Internetowa Biblioteka Kinga</h1>
        <br>
            
        <div class="warningLog">
            <form action="BackLogServlet" method="post">
                <p>Aby wypożyczyć książkę należy się zalogować!</p>
                <input type="submit" value="Logowanie">  
            </form> 
        </div>
        
        <br><br><br><br><br>
        
            <form action="guest.jsp" method="get">
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
        out.println("<div class='from-center'>"+"<h3>Znalezione wyniki</h3>"+"<br>");
            while(rs.next()) {
                int id = rs.getInt(1);
                String tytu = rs.getString(2);
                String autor = rs.getString(3);
                String rok = rs.getString(4);
                String opis = rs.getString(5);
                int szt = rs.getInt(6);
                String obraz = rs.getString(7);

            out.println(
            "<br>"+"<div style = 'width:400px; height:400px; border:1px solid plum; margin: 10px; text-align:center'> <img src = '" + obraz +  "' style='width:150px; height:150px; margin:10px;  border-radius: 25px;'>" +  "<br> " + 
             tytu + "<br>" + "autor: " + autor + "<br>" + "rok wydania: " + rok + "<br>" + "opis: " + opis + "<br>" + "szt: " + szt  + "</div><br><br><br>");
            }
            out.println("</div>");
            
        } else {
        out.println("<div class='from-center'>"+"<h3>Popularne książki</h3>"+"<br/>");
             while(rs2.next()) {
                int id2 = rs2.getInt(1);
                String tytu2 = rs2.getString(2);
                String autor2 = rs2.getString(3);
                String rok2 = rs2.getString(4);
                String opis2 = rs2.getString(5);
                int szt2 = rs2.getInt(6);
                String obraz2 = rs2.getString(7);

            out.println(
            "<br>"+"<div style = 'width:400px; height:650px; border:1px solid black; margin: 10px; text-align:center'> <img src = '" + obraz2 +  "' style='width:150px; height:150px; margin:10px;  border-radius: 25px;'>" +  "<br> " + 
             tytu2 + "<br>" + "autor: " + autor2 + "<br>" + "rok wydania: " + rok2 + "<br>" + "opis: " + opis2 + "<br>" + "szt: " + szt2  + "</div><br><br><br> ");
            }
            out.println("</div>");
        }

    %>
    
    </div>  
        
        
    </body>
</html>
