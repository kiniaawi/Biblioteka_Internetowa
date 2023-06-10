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
                right: 150px;;
                
            }
            
            .from-center {
                background-color: lavenderblush;
                display: flex;
                justify-content: center;
                border: 5px solid plum;
                padding: 3%;
                width: 300px;
                position: absolute;
                left: 35%;
                
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


        </style>

    </head>
    <body>
        <div class="containerWithBars"> 
        <h1>Witaj w Internetowej Bibliotece Kinga!</h1>
        <br><br>
        
        
        <div class ="from-center">  
            <form action="LogServlet" method="post">
                <h3>Logowanie</h3> <br/>
                Login: <br />
                <input type="text" name="name" /><br /> 
                Hasło: <br />
                <input type="password" name="password" /><br /> 
                <br />
                <input type="submit" align="center" value="Zaloguj">
            </form> 
        </div>  
  
        </div>
    </body>
</html>
