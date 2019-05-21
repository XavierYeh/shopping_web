<%@ page contentType="text/html;charset=utf-8"%>

<%@ page import="java.sql.*"%> 
<html lang=en>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
     <title>商品網頁</title>
	 <style>
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
<%request.setCharacterEncoding("utf-8");
String ano=(String)application.getAttribute("no");
String admin="";
if(ano!=null){admin=ano;}
else{admin="遊客";}
%>

<center>
<div>
  <table bgcolor=#FF8800>
    <tr>
	<ul>
        <th a href=index.html STYLE="text-decoration:none"> <img src="images/Sale1.jpg" style="float: left-side;" align="left" hspace="4px" vspace="10px" height="30" width="100"></a></th>
        <th width="1300" align="left"><h2>貨出去錢進來大家發大財</h2></th>
        <th width="" style="float: right-side;"> <a href=http://localhost:8080/cartcart.jsp STYLE="text-decoration:none"><b>購物車</b></a></th>
        <th width="" style="float: right-side;"> <a href="#account" STYLE="text-decoration:none"><b><%out.print(admin);%>會員中心</b></a></th>
		<th width="" style="float: right-side;"> <a href="#about" STYLE="text-decoration:none"><b>聯絡我們</b></a></th>
    </ul>
   </tr>
  </table>
  </div>
</center>


<left>
<br>
<br>
<br>
<hr color=black>
<body bgcolor=blanchedalmond link=burlywood>

 <%
    request.setCharacterEncoding("utf-8");
    String val = (String)request.getParameter("data");
    

    Object info= request.getParameter("keyword");
    String infoStr= (String)info;
  %>



<caption>商品詳細資料</caption>
<% 
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
Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
try
{
//建立SQL查詢
String sql="select P_NO,p.P_NAME,P_NUMBER,P_PRICE,T_NAME,P_PICTURE,P_FEATURES from product p,type t where P_NO in("+infoStr+") and (p.T_NO=t.T_NO)"; 
ResultSet rs = stmt.executeQuery(sql);

%>
<center>



<%
//顯示資料List<Book> list=new ArrayList<Book>();  
 String pno;
while(rs.next())
{   pno=rs.getString("P_NO");
application.setAttribute("P_NO", pno);
%>	<table width="1000" height="450" rules="all" style="border:3px #FFD382 dashed;" cellpadding="10" border='1'>
        <tr>
　      <td rowspan="6"><img src="<%=rs.getString("P_PICTURE")%>" style="float: left;" align="left" hspace="8px" vspace="5px" height="400" width="500">        
        </td>
		<td width="50">名稱</td>
　      <td><%=rs.getString("P_NAME")%></td>
　      </tr>
　      <tr>
		<td>單價</td>
　      <td><%=rs.getString("P_PRICE")%></td>
　      </tr>
　      <tr>
		<td>現有數量</td>
　      <td><%=rs.getString("P_NUMBER")%></td>
　      </tr>
　      <tr>
		<td>種類</td>
　      <td><%=rs.getString("T_NAME")%></td>
　      </tr>
　      <tr>
		<td rowspan="2">說明</td>
　      <td rowspan="2"><%=rs.getString("P_FEATURES")%></td>
　      </tr>
		</table>
		  
		 

<% 
}        
%>
</center>
<br>  <%String db=(String)request.getParameter("keyword");%>
<center>
   <form name="db1" id="db1" method="post" action="cartcart.jsp">
   <input type="text" name="button1" id="button1" value="<%=db%>" style="display:none;">
<p><input type="submit" src="images/加入購物車.png"  height="" width="200" value="加入購物車">
   <input type="image" src="images/直接購買.png" width="200"></p>
    </form> 
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

<center>
<br>
<br>

<a href=http://localhost:8080/homepage1220.jsp ><b>⊙返回首頁⊙</b></a>
</center>

</body>

</html>