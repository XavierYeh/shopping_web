
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.*" %>
<html>
  <head>   
    <title>更改資料</title>
	<style>
	  th {
		  font-size:20px;
	  }
	</style>
	<!--<meta http-equiv="refresh" content="2; url=changeproduct.jsp; charset=UTF-8">-
	<font size="6"><b>更改完成  2秒後跳轉至更改商品頁面</b></font><p>-->
  </head>
  <body>    
    
    <%
	  application.setAttribute("pok","");
	  application.setAttribute("perror","");
	  request.setCharacterEncoding("utf-8");
	  String id = request.getParameter("id");
	  String name = request.getParameter("name");
	  Integer number =Integer.parseInt(request.getParameter("number"));
	  Integer price = Integer.parseInt(request.getParameter("price"));
	  String T = request.getParameter("T_NO");
	  String imformation = request.getParameter("imformation");
	  String picture = request.getParameter("picture");
       Context initContext = new InitialContext();
      Context context = (Context) initContext.lookup("java:comp/env");
      DataSource ds = (DataSource) context.lookup("jdbc/my");	  
      Connection dbCon = ds.getConnection();
      PreparedStatement stmt = null;
      ResultSet rs = null;
	  //ResultSetMetaData md = null;
      //驅動程式參數
	   
       //"+","+"P_PRICE=?"+","+"T_NO=?"+","+"P_FEATURES=?"+","+"P_PICTURE=?"
 
	  String sql="Update product set P_NUMBER=? , P_PRICE=? , T_NO='?' , P_FEATURES='?' , P_PICTURE='?'  where P_NO=";
	  
	  
      stmt = dbCon.prepareStatement("Update product set P_NAME=?, P_NUMBER=? , P_PRICE=? , T_NO="+"?"+" , P_FEATURES="+"?"+" , P_PICTURE="+"?"+"  where P_NO="+"'"+id+"'");
	
	  stmt.setString(1,name); 
      stmt.setInt(2,number);    
      stmt.setInt(3,price);    
   	  stmt.setString(4,T); 
	  stmt.setString(5,imformation);
	  stmt.setString(6,"G"+":/"+"image"+"/"+picture+".jpg");
      int st=stmt.executeUpdate();	
     if(st==0){
		application.setAttribute("perror","無法修改此商品資料!!"); 
	    response.sendRedirect("deleteproduct.jsp");  
	  }	  
	  else {
		application.setAttribute("pok","修改商品完成!!"); 
	    response.sendRedirect("deleteproduct.jsp"); 
	  }
      stmt.close();
      dbCon.close();
    %>
  </body>
</html>
		  