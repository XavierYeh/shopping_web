
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<html>
  <head>   
    <title>刪除</title>
	<style>
	  th {
		  font-size:20px;
	  }
	</style>
  </head>
  <body>    
    <font size="6"><b>刪除</b></font><p>
    <%
	  request.setCharacterEncoding("utf-8");
	  String nn = request.getParameter("nn");
	  String nn1 = request.getParameter("nn1");
	  String nn2 = request.getParameter("nn2");
	  String ss = request.getParameter("ss");
	  String yy = request.getParameter("yy");
	  String mm = request.getParameter("mm");
	  String dd = request.getParameter("dd");
	  String addr = request.getParameter("addr");
	  String addr1 = request.getParameter("addr1");
	  
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
	  String sql="delete from member where name=";
      stmt = dbCon.prepareStatement(sql+"'"+nn+"'");
	  
      rs=stmt.executeQuery();    
	 
      stmt.close();
      dbCon.close();
	  %>
  </body>
</html>
		  