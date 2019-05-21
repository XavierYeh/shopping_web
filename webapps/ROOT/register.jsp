<!-- ************* show_DataBaseAll2.jsp ************* -->
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.DataSource" %>
<html>
  <head>   
    <title>database_Read</title>
	<style>
	  th {
		  font-size:20px;
	  }
	</style>
  </head>
  <body>    
    <font size="6"><b>新增會員資料</b></font><p>
<%
	try{ 
	  
      Context initContext = new InitialContext();
      Context context = (Context) initContext.lookup("java:comp/env");
      DataSource ds = (DataSource) context.lookup("jdbc/my");
      // 取得資料庫連結和Statement物件
      Connection dbCon = ds.getConnection();
	  request.setCharacterEncoding("utf-8"); 
	  PreparedStatement psmt = null; 
	  PreparedStatement ppsmt = null;
	  String number = request.getParameter("M_a_number");
	  String ppassword = request.getParameter("M_password");
	  String name = request.getParameter("M_name");
	  String tel = request.getParameter("M_tel");
	  String address = request.getParameter("M_address");
      // 建立SQL指令
      ppsmt = dbCon.prepareStatement ("Select M_a_number from member where M_a_number = '"+number+"'");
	  
      boolean pp=ppsmt.execute();
	  if (pp){
	  psmt = dbCon.prepareStatement("INSERT INTO member (M_a_number,M_password,M_name,M_tel,M_address) VALUES (?,?,?,?,?)");
	  psmt.setString(1,number); 
      psmt.setString(2,ppassword);
	  psmt.setString(3,name);
	  psmt.setString(4,tel); 
      psmt.setString(5,address);
	  int ps=psmt.executeUpdate();      
        if(ps==0){
		application.setAttribute("perror","無法新增此筆會員資料!!"); 
	    response.sendRedirect("registerInfo.jsp");  
		}
	    else{
        application.setAttribute("pok","新增會員成功!!"); 
	    response.sendRedirect("registerInfo.jsp");  
		}
	  }
	 else {
	    application.setAttribute("perror","此帳號已重複!!"); 
	    response.sendRedirect("registerInfo.jsp");
	 }
        psmt.close();// 關閉PreparedStatement物件
        dbCon.close();     // 關閉連結
      }
    catch(Exception e) {
      out.print(e);   
    }                      
    %>
  </body>
</html>