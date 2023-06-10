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
        
        <script>
          function check_passwd(){
          var text1=decument.getElementById('inputPasswd').value;
          var text2=decument.getElementById('input').value;
          if(text1 !== text2){alert("Niezgodne hasła!") return false;}
          }      
        </script>

    </head>
    <body>
        <div class="containerWithBars"> 
        <h1>Witaj w Internetowej Bibliotece Kinga!</h1>
        <br><br>
        
        
        <div class ="from-center">  
            <form action="RegistrationServlet" method="post">
                <h3>Rejestracja</h3> <br/>
                Podaj login: <br />
                <input type="text" name="name" id="inputName" /><br /> 
                Podaj hasło: <br />
                <input type="password" name="password" id="inputPasswd" /><br /> 
                <br />
                Powtórz hasło: <br />
                <input type="password" name="passwordRep" id="input" /><br /> 
                <br /> 
                <button type="submit" onclick="return check_passwd()" value="Zarejestruj">Zarejestruj</button>            
            </form> 
           
        </div>  
                    
        
        
        
        
        </div>
    </body>
</html>
