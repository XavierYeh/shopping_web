
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<html>
  <head>   
    <title>搜尋</title>
	<style>
	  th {
		  font-size:20px;
	  }
	</style>
  </head>
  <body>    
    <font size="6"><b>搜尋</b></font><p>
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
     Statement stmt = null;
      ResultSet rs = null;
	  //ResultSetMetaData md = null;
      //驅動程式參數
	   
      String sDriver = "org.mariadb.jdbc.Driver";
      String user     = "root";
      String password = "123456";
      String url      = "jdbc:mariadb://localhost:3307/labdb";
      Class.forName(sDriver);
      dbCon = DriverManager.getConnection(url,user,password);
      stmt = dbCon.createStatement();
	   String sql="select * from member where name=";
      StringBuilder sb = new StringBuilder();
      rs=stmt.executeQuery(sql+"'"+nn+"'");    
	  sb.append("<TABLE border='2' width='600'><TR>");		
      sb.append("<TH>id_no</TH>");
      sb.append("<TH>name</TH>");
	  sb.append("<TH>sex</TH>");
      sb.append("<TH>birth</TH>");
	  sb.append("<TH>address</TH>");
      while(rs.next()){
				
		sb.append("<TR>");                   
        sb.append("<TD>");
        sb.append(rs.getString("id_no"));
		sb.append("</TD>");
        sb.append("<TD>");
        sb.append(rs.getString("name"));
	    sb.append("</TD>");
        sb.append("<TD>");
        sb.append(rs.getString("sex"));
	    sb.append("</TD>");
        sb.append("<TD>");
        sb.append(rs.getDate("birth"));
	    sb.append("</TD>");
        sb.append("<TD>");
        sb.append(rs.getString("address"));
	    sb.append("</TD>");
		sb.append("</TR>");
      }
      sb.append("</TABLE>");

      String result= sb.toString();
      out.print(result);
      stmt.close();
      dbCon.close();
	  %>
  </body>
</html>
		  