<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.lang.*"%> 
<%@ page import="java.sql.*"%> 
<%@ page import="java.io.*"%> 
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
	
  </head> 
  <body > 
<%	
request.setCharacterEncoding("utf-8");
String ano=(String)application.getAttribute("no");
String admin="";
if(ano!=null){admin=ano;}
else{admin="遊客";}
String num1="";
num1=(String)request.getParameter("num1");
int num2=Integer.parseInt(num1);
%>	
    

<% String sql1="";
String pno;
String qty;
	for(int i=1;i<=num2;i++){
        pno=(String)request.getParameter("pno"+i);
        qty=(String)request.getParameter("qty"+i);		
		if(sql1!="")
         sql1 = sql1+",("+pno+",000000015,"+qty+")";
	    else
		sql1="("+pno+",0000000015,"+qty+")";
	}
try
{
//讀取mysqlDriver驅動程式
Class.forName("com.mysql.jdbc.Driver").newInstance();


try
{
      String sDriver = "com.mysql.jdbc.Driver";
      String user     = "root";
      String password = "123456";
      String url      = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";//&amp;useUnicode=true&characterEncoding=utf8
Connection conn= DriverManager.getConnection(url,user,password);

try
{
//建立statement
Statement stmt = conn.createStatement();
try
{

//建立SQL查詢
String sql="INSERT INTO odi (P_NO,M_no,qty) VALUES "+sql1; 
stmt.executeUpdate(sql);




// 關閉連線

stmt.close();
stmt = null;
conn.close();


}
catch (Exception ex)
{
out.println("can't read data");
out.println(ex.toString());
}
}
catch (Exception e)
{
out.println("can't create statement");
out.println(e.toString());
}
}
catch(Exception e)
{
out.println("can't content mysql database");
out.println(e.toString());
}

}
catch(Exception e)
{
out.println("can't load mysql driver");
out.println(e.toString());
}
response.sendRedirect("http://localhost:8080/cartcart.jsp");
%>	

  </body>
</html>
