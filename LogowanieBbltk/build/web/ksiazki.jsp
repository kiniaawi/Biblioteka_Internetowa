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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wypozyczone</title>
        
        <style>body {background-color: pink; }</style>
    </head>
    <body>
        <h1>Moje wypozyczone ksiazki: </h1>
        <h2>1. <%=request.getSession().getAttribute("tytul") %></h2>
         
        <br><br>
        
        <%
            Cookie cookie = null;
            Cookie[] cookies = null;
            
            cookies = request.getCookies();
            if(cookies != null) {
            out.println("<h2>Found Cookies Name and Value</h2>");
            
            for(int i =0; i<cookies.length; i++) {
            cookie = cookies[i];
            out.println("Name : " + cookie.getParameter() + ", Value : ");
            }
            }
            
            
            %>
        
    </body>
</html>
