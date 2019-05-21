<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.lang.*"%> 
<%@ page import="java.sql.*"%> 
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
	
  </head> 
  <body > 
    <%	request.setCharacterEncoding("utf-8");
    
   String pmser=(String)request.getParameter("se");
   session.setAttribute("ser", pmser); 
response.sendRedirect("http://localhost:8080/homepage1220.jsp");
%>	
     

  </body>
</html>