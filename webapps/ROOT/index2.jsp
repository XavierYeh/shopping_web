<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import= "java.io.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.DataSource" %>
<%@page contentType="text/html;charset=utf-8"%>

<html>
  <head>
	<title>JSP Page</title>
  </head>
  <body> 


<%
    try{ 
	  request.setCharacterEncoding("utf-8");
      Context initContext = new InitialContext();
      Context context = (Context) initContext.lookup("java:comp/env");
      DataSource ds = (DataSource) context.lookup("jdbc/my");
      // 取得資料庫連結和Statement物件
      Connection dbCon = ds.getConnection(); 
      Statement stmt = dbCon.createStatement(); 
	  String number = request.getParameter("M_a_number");
	  String ppassword = request.getParameter("M_password");
	 // if(number.length()<=2||ppassword.length()<=2)
		//  response.sendRedirect("index.jsp");
      // 建立SQL指令
      String sSQL = "Select M_password,M_name,M_no From member Where '"+number+"'=M_a_number";
      ResultSet rs = stmt.executeQuery(sSQL);
	  if(rs.next()){
	  if(ppassword.equals(rs.getString("M_password"))){
		String no=  rs.getString("M_no");
	   response.sendRedirect("index1.jsp");
	   application.setAttribute("no",no);
	   application.setAttribute("loginerror","");
	   application.setAttribute("loginok","");
	  }
	  else{
	  response.sendRedirect("index.jsp");
	  application.setAttribute("loginerror","登入失敗!");
	  
	  }
	  }
	  
      else{
	  response.sendRedirect("index.jsp");
	  application.setAttribute("loginerror","登入失敗!");
	  
	  }
      stmt.close();   // 關閉Statement物件
      dbCon.close();  // 關閉連結
    }
    catch(Exception e) {
      out.print(e);   
    }                      
    %>

</body>
</html>
