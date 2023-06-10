<%
if (session.getAttribute("loggedIn")=="false") 
{
 response.sendRedirect("index.jsp");  
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Biblioteka Kinga</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <style>
            body { background-color: cornsilk; }
            
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
                display: flex;
                justify-content: center;
                border: 5px solid plum;
                padding: 3%;
                width: 600px;
                position: absolute;
                left: 20%;
                
            }
            
            .buttonCenter {
                background-color: lavenderblush;
                display: flex;
                justify-content: center;
                border: 5px solid plum;
                padding: 3%;
                width: 300px;
                position: absolute;
                left: 35%; }
            
            h1 {
                text-align: center;
                background-color: linen;
                padding: 5px;
            }
            
            h3 {
                text-align: center;
            }
            
            .bold {
                font-weight: bold;
                text-align: center;
                padding: 2%;
            }


        </style>

    </head>
    <body>
        <div class="containerWithBars"> 
        <h1>Witaj Admin</h1>
        <br><br>
        
        <div class="centerText">
            <form action="logOut.jsp" method="post">
                <input type="submit" align="center" value="Wyloguj">
            </form>
        </div>
            
            <br><br><br>
        
        <div class="from-center">      
            <form action="AdminServlet" method="post">
                <h3>Dodaj książkę</h3> <br/>
                Tytuł:
                <input type="text" name="tytul"><br>
                Autor:
                <input type="text" name="autor"><br>
                Rok wydania:
                <input type="text" name="rok"><br>
                Opis:
                <input type="text" name="opis"><br>
                Ilość sztuk:
                <input type="text" name="szt"><br>
                Obraz:
                <input type="text" name="obraz"><br>
                <input type="submit" align="center" value="Dodaj" name="Dodaj">
            </form>  
        </div>
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        
        <div class="from-center">
            <form action="DelServlet" method="post">
                <h3>Usuń książkę wyszukując nazwę</h3><br/>
                Tytuł:
                <input type="text" name="tytul2"><br>
                <input type="submit" align="center" value="Usun" name="Usun">
            </form>
        </div>
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br>
        
        <div class="from-center">
            <form action="DelUserServlet" method="post">
                <h3>Usuń użytkownika wyszukując ID</h3><br/>
                ID użytkownika:
                <input type="text" name="idUz"><br>
                <input type="submit" align="center" value="Usun" name="Usun">
            </form>
        </div>
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
    </body>
</html>
