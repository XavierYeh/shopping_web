<%@ page contentType="text/html;charset=utf-8"%>

<%@ page import="java.sql.*"%> 
<html lang=en>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
   <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
     <title>HomePage</title>
	 <style>
	 body{
	 background-image: url("images/5-141012093457.jpg");
	 }
    div{
    	width: 1350px;		
    	padding: px auto;
    	margin: px auto;
    }
    h2{
    	color: white;	
    	padding: px auto;
    	margin: 0px auto;
    	position: relative;
    	top: px;
    	left: px;
    }
    </style>    	 
</head>

 
<body bgcolor=blanchedalmond  link=white>
</body>


<center>
<div>
  <table bgcolor=#FF8800 style= "float= left;">
    <tr>
	<ul>
        <th a href=index.html STYLE="text-decoration:none"> <img src="images/Sale1.jpg" style="float: left-side;" align="left" hspace="4px" vspace="10px" height="30" width="100"></a></th>
		<th width="auto;" align="left"><h2>貨出去錢進來大家發大財</h2></th>
		<th width="760"></th>
<%request.setCharacterEncoding("utf-8");
String ano=(String)application.getAttribute("no");
String admin="";
if(ano!=null){admin=ano;}
else{admin="遊客";}
%>
        <th width="" style="float: right-side;"> <a href=http://localhost:8080/cartcart.jsp STYLE="text-decoration:none"><b>購物車</b></a></th>
        <th width="" style="float: right-side;"> <a href="#account" STYLE="text-decoration:none"><b><%out.print(admin);%>會員中心</b></a></th>
		<th width="" style="float: right-side;"> <a href="#about" STYLE="text-decoration:none"><b>聯絡我們</b></a></th>
    </ul>
   </tr>
  </table>
  </div>
</center>

<body>
<center>
  <form method="post" action="hserch.jsp">
    <h1>商品搜尋</h1>
    <input type = "text" name = "se" id="se" size = "30">&nbsp;
    <input type="submit" value="傳送">
  </form>
  </center>
</body> 

<left>
<br>
<br>
<br>
<hr color=black>
<body bgcolor=blanchedalmond link=burlywood>


<caption>商品詳細資料</caption>
<% 
request.setCharacterEncoding("utf-8");
String pmser= (String)session.getAttribute("ser");
String pser="";
if(pmser!=null)
pser="WHERE P_NAME LIKE '%"+pmser+"%'";
session.removeAttribute("ser");
try
{
//讀取mysqlDriver驅動程式
Class.forName("com.mysql.jdbc.Driver").newInstance();


try
{
//連接mysql資料庫

// 資料庫名稱"zend_test",帳號"root",密碼"123456",
// 使用Unicode編碼"true",字元集"UTF-8"
String sDriver = "com.mysql.jdbc.Driver";
      String user     = "root";
      String password = "123456";
      String url      = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";//&amp;useUnicode=true&characterEncoding=utf8
Connection conn= DriverManager.getConnection(url,user,password);

try
{
//建立statement
Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
try
{
//建立SQL查詢
String sql="select * from product "+pser+";"; 
ResultSet rs = stmt.executeQuery(sql);

%>
<center>
<table width="1000" height="450" rules="all" style="border:3px #FFD382 dashed;" cellpadding="10" border='1'>


<%
//顯示資料

while(rs.next())
{
%>	
<table width="1200" rules="all" style="border:3px #FFD382 dashed;" cellpadding="10" border='1'>
  
    <tr>
      <th>
	    <a href="http://localhost:8080/db_test1.jsp?keyword=<%=rs.getString("P_NO")%>" title="商品詳細資料">
		<img src="<%=rs.getString("P_PICTURE")%>" style="float: left;" align="left" hspace="8px" vspace="5px" height="300" width="400">
		</a>
	  </th>
	  <th><%=rs.getString("P_NAME")%></th>
	  <th><%=rs.getString("P_PRICE")%></th>
    </tr>
</table>	
	
	
	
<% 
}
%>
</table>
</center>
<%

// 關閉連線
rs.close();
rs = null;
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

%>
<br>
<br>

<center>

<br>
<br>
<br>
<br>

</center>

</body>

</html>