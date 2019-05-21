
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.*" %>
<html>
  <head>   
    <title>刪除</title>
	<style>
	  th {
		  font-size:20px;
	  }
	  
	</style>
	<!--<meta http-equiv="refresh" content="2; url=deleteproduct.html; charset=UTF-8">
	<font size="6"><b>刪除完成  2秒後跳轉至刪除商品頁面</b></font><p>-->
  </head>
  <body>    
    
     <%
	 application.setAttribute("pok","");
	 application.setAttribute("perror","");
	  request.setCharacterEncoding("utf-8");
	  String id = request.getParameter("id");
	  String name = request.getParameter("name");
	 Context initContext = new InitialContext();
      Context context = (Context) initContext.lookup("java:comp/env");
      DataSource ds = (DataSource) context.lookup("jdbc/my");	  
      Connection dbCon = ds.getConnection();
   
      PreparedStatement stmt = null;
      ResultSet rs = null;
	  //ResultSetMetaData md = null;
      //驅動程式參數
	   
        
	  String sql="delete from product where P_NO=";
	  String ssql=" or P_NAME=";
      stmt = dbCon.prepareStatement(sql+"'"+id+"'"+ssql+"'"+name+"'");
	 
      int st=stmt.executeUpdate();	
      if(st==0){
		application.setAttribute("perror","無法刪除此筆資料!!"); 
	    response.sendRedirect("deleteproduct.jsp");  
	  }	  
	  else {
		application.setAttribute("pok","刪除資料完成!!"); 
	    response.sendRedirect("deleteproduct.jsp"); 
	  }
      stmt.close();
      dbCon.close();
    %>
	
  </body>
</html>
		  