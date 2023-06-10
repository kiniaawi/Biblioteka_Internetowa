<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("loggenIn", "false");
    response.sendRedirect("index.jsp");
%>