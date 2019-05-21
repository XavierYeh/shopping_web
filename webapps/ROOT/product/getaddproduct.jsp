
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.DataSource" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<html>
  <head>   
    <title>新增商品資料</title>
	<style>
	  th {
		  font-size:20px;
	  }
	</style>
	<!--<meta http-equiv="refresh" content="2; url=addproduct.jsp; charset=UTF-8"> 
	<font size="6"><b>新增商品資料完成  2秒後跳轉至新增商品頁面</b></font><p>-->
  </head>
  <body>    
   
    <%
	  application.setAttribute("perror","");
	  application.setAttribute("pok","");
	  request.setCharacterEncoding("utf-8");
	  
	  String name = request.getParameter("name");
	  Integer number =Integer.parseInt(request.getParameter("number"));
	  Integer price = Integer.parseInt(request.getParameter("price"));
	  String T_NO = request.getParameter("T_NO");
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
	   
	  
      stmt = dbCon.prepareStatement("Insert INTO product (P_NO,P_NAME,P_NUMBER,P_PRICE,T_NO,P_FEATURES,P_PICTURE) values(NULL,?,?,?,?,?,?)");
	  
      stmt.setString(1,name);
      stmt.setInt(2,number);    
      stmt.setInt(3,price);    
   	  stmt.setString(4,T_NO); 
	  stmt.setString(5,imformation);
	  stmt.setString(6,"G:/image/"+picture+".jpg");
      int st = stmt.executeUpdate();	 
	if(st==0){
		application.setAttribute("perror","無法新增此商品資料!!"); 
	    response.sendRedirect("addproduct.jsp");  
	  }	  
	  else {
		application.setAttribute("pok","新增商品完成!!"); 
	    response.sendRedirect("addproduct.jsp"); 
	  }	  
      stmt.close();
      dbCon.close();
    %>
  </body>
</html>