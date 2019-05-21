<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%> 
<%@ page import= "java.util.*" %>
<!doctype html>
<html>
<head>

   <meta charset="utf-8">
     <title>結帳確定</title>
	 <style type="text/css">
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
	<body>
<center>
<div>
  <table bgcolor=#FF8800>
    <tr>
	<ul>
        <th a href=index.html STYLE="text-decoration:none"> <img src="images/Sale1.jpg" style="float: left-side;" align="left" hspace="4px" vspace="10px" height="30" width="100"></a></th>
        <th width="1300" align="left"><h2>貨出去錢進來大家發大財</h2></th>
        <th width="" style="float: right-side;"> <a href=http://localhost:8080/cartcart.jsp STYLE="text-decoration:none"><b>購物車</b></a></th>
        <th width="" style="float: right-side;"> <a href="#account" STYLE="text-decoration:none"><b>會員中心</b></a></th>
		<th width="" style="float: right-side;"> <a href="#about" STYLE="text-decoration:none"><b>聯絡我們</b></a></th>
    </ul>
   </tr>
  </table>
  </div>
</center>


<br>
<br>
<br>
<hr color=black>
<body bgcolor=blanchedalmond link=burlywood>
<%int num1=0;  
String address="";
request.setCharacterEncoding("utf-8");
    String infoStr=(String)session.getAttribute("pno1");
	 	 		
		
	
	String code="";
    if(code!="")
    code = code+","+infoStr;
	else
		code=infoStr;
	String ano=(String)application.getAttribute("no");
String admin="";
if(ano!=null){admin=ano;}
else{admin="遊客";}


String num3[];
num3=new String[100];
String pricedb[];
pricedb=new String[100];
int priceyes;
int i;
String pno[];
pno=new String[100];     
	
  %>
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
Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
try
{
//建立SQL查詢
String sql="select P_NAME,P_PRICE,P_PICTURE,p_NO from product where P_NO in("+code+");"; 
ResultSet rs = stmt.executeQuery(sql);
int num=2;
%>
<center>
<table width="1000" rules="all" style="border:3px #FFD382 dashed;" cellpadding="10" border='1'>
        <tr>
		<th>圖片</th>
		<th>名稱</th>
		<th>單價</th>
		<th>數量</th>
		<th>總價</th>
		</tr>
<%
//顯示資料 

while(rs.next())
{  num1++;
   pno[num1]=rs.getString("P_NO");
   priceyes=Integer.parseInt(rs.getString("P_PRICE"));
   num3[num1]=(String)request.getParameter("money"+num1);
   i = Integer.parseInt(num3[num1]);
        out.print("<tr>");
		out.print("<th><img src='"+rs.getString("P_PICTURE")+"' style='float: left;' align='left' hspace='8px' vspace='5px' height='40' width='50'></th>");
		out.print("<th>"+rs.getString("P_NAME")+"</th>");
		out.print("<th><span class='price'>"+rs.getString("P_PRICE")+"</span></th>");		    
        out.print("<th>"+num3[num1]+"</th>");  	
	    out.print("<th>"+(i*priceyes)+"</th>");		
		out.print("</tr>");	

}

out.print("</table>");

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
Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
try
{
//建立SQL查詢
String sql="select * from member where M_no in('0000000011');"; 
ResultSet rs = stmt.executeQuery(sql);
int num=2;
%>
<center>
<table width="1000" rules="all" style="border:3px #FFD382 dashed;" cellpadding="10" border='1'>

<%
//顯示資料
String name="";
String tel="";
while(rs.next())
{  name=rs.getString("M_name");
   tel=rs.getString("M_tel");
   address=rs.getString("M_address");
        out.print("<tr>");
		out.print("<th>姓名</th>");
		out.print("<th>"+name+"</th>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<th>電話</th>");
		out.print("<th>"+tel+"</th>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<th>地址</th>");
		out.print("<th><input type='text' name='button1' id='button1' value='"+address+"'></input></th>");
        out.print("</tr>");			

}

out.print("</table>");

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

	<form method="get" action="doradiobutton">
	  <p>付款方式</p>
        <input type="radio" name="gender" value="銀行轉帳" checked>銀行轉帳
        <input type="radio" name="gender" value="信用卡/VISA金融卡">信用卡/VISA金融卡
		<input type="radio" name="gender" value="貨到付款" checked>貨到付款
	  <p>
    </form>

 
<br> 
  <style>
    	.box {    		
    		width: 300px;
    		height: 200px;
    		overflow: Rightscroll;
    	}
  </style>    


	<form method="get" action="dotextarea">
	 <p>留言</p> 
	 <textarea name="opinion" rows="5" cols="30"></textarea><p>
  </form>

   
<br>
<hr color=black>
<br>
   <form method="post" action="detil.jsp">
   <input type="text" name="num1" id="num1" value="<%=num1%>" style="display:none;">
   <input type="text" name="addr" id="addr" value="<%=address%>" style="display:none;">
   <%
     for(int j=1;j<=num1;j++){
		 out.print("<input type='text' name='qty"+j+"' id='qty"+j+"' value='"+num3[j]+"' style='display:none;'>");		 
	 }
     for(int k=1;k<=num1;k++){
		 out.print("<input type='text' name='pno"+k+"' id='pno"+k+"' value='"+pno[k]+"' style='display:none;'>");		 
	 }   	 
   %> 
	<input type="image" src="images/確認結帳.png" align="right-side" width="200" value="確認結帳">
    <p><!-- <input type="submit" value="送出">-->
            <!--<button type="submit">送出</button>-->
	</form>

</center>


<center>
<br>
<br>

<a href=http://localhost:8080/inputSharedData.html STYLE="text-decoration:none"><b>⊙返回首頁⊙</b></a>
</center>

</body>
</html>