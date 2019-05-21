
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<html>
  <head>   
    <title>更改資料</title>
	<style>
	  th {
		  font-size:20px;
	  }
	</style>
  </head>
  <body>    
    <font size="6"><b>更改</b></font><p>
    <%
	  request.setCharacterEncoding("utf-8");
	  String nn = request.getParameter("nn");
	
	  String ss = request.getParameter("ss");
	  String yy = request.getParameter("yy");
	  String mm = request.getParameter("mm");
	  String dd = request.getParameter("dd");
	  String addr = request.getParameter("addr");
	  
	  String id = request.getParameter("id");
	  out.print(addr);
      Connection dbCon = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
	  //ResultSetMetaData md = null;
      //驅動程式參數
	   
      String sDriver = "org.mariadb.jdbc.Driver";
      String user     = "root";
      String password = "123456";
      String url      = "jdbc:mariadb://localhost:3307/labdb";
      Class.forName(sDriver);
      dbCon = DriverManager.getConnection(url,user,password);
	  String sql ="Update member set address=? where name=? ";
	  
      stmt = dbCon.prepareStatement(sql);
	  stmt.setString(2,nn);
      stmt.setString(1,addr);
	  
	  
	  stmt.executeUpdate();	  
      stmt.close();
      dbCon.close();
	  %>
  </body>
</html>
		  