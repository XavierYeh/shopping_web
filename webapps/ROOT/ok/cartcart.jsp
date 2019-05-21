<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%> 
<!doctype html>
<html>
<head>

   <meta charset="utf-8">
     <title>商品網頁</title>
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
        <th width="" style="float: right-side;"> <a href="#cart" STYLE="text-decoration:none"><b>購物車</b></a></th>
        <th width="" style="float: right-side;"> <a href="#account" STYLE="text-decoration:none"><b><%out.print(admin);%>會員中心</b></a></th>
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
<%  request.setCharacterEncoding("utf-8");
    String val = "";
	val=(String)request.getParameter("button1");
	String val1= (String)session.getAttribute("pno1");
	
	if(val!=""){
		if(val1!=""){
			val=val1+","+val;
			session.setAttribute("pno1",val);
		}else{
		    session.setAttribute("pno1",val);
		}	
    }
	
	String infoStr=(String)session.getAttribute("pno1");
	String code="";
    if(code!="")
    code = code+","+infoStr;
	else
		code=infoStr;
    


	
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
try
{
//建立SQL查詢
String sql="select p.P_NAME,P_NUMBER,P_PRICE,T_NAME,P_PICTURE,P_FEATURES,p.P_NO from product p,type t where P_NO in("+code+") and (p.T_NO=t.T_NO)"; 
ResultSet rs = stmt.executeQuery(sql);
int num=2;
%>
<center>
<table width="1200" rules="all" style="border:3px #FFD382 dashed;" cellpadding="10" border='1'>
        <tr>
		<th>圖片</th>
		<th>名稱</th>
		<th>單價</th>
		<th>數量</th>
		<th>總價</th>
		</tr>
<%
//顯示資料 
int num1=0;
String pricedb[];
pricedb=new String[100];
while(rs.next())
{  num1++;
   
   pricedb[num1]=rs.getString("P_PRICE");
      String pp=rs.getString("P_NO");
	 session.setAttribute("p"+num1,pp);
        out.print("<tr>");
		out.print("<th><img src='"+rs.getString("P_PICTURE")+"' style='float: left;' align='left' hspace='8px' vspace='5px' height='40' width='50'></th>");
		out.print("<th>"+rs.getString("P_NAME")+"</th>");
		out.print("<th><span class='price'>"+pricedb[num1]+"</span></th>");
		out.print("<th>");		    
        out.print(" <form name='myform' id='myform' method='get' action='yesno.jsp'>");
	    out.print("<input type='button' value='-' id='qtyminus' onclick='checkData"+num1+"();' />");    
	    out.print("<input type='text' name='qty"+num1+"' value='0' id='qty"+num1+"' style='width:40px;height:25px;'/>");    	
	    out.print("<input type='button' value='+' id='qtyplus' onclick='checkData"+(num1+100)+"();' />");    		
	    out.print(" </form>	"); 
	    out.print("<th><p><label id='total"+num1+"' name='total"+num1+"' value='0'></label></p></th>");
		out.print(" <form name='mydel' id='mydel' method='get' action='cartj.jsp'>");
		out.print("<input type='text' name='all' id='all' value='"+num1+"' style='display:none;'>");
		out.print("<input type='text' name='all"+num1+"' id='all"+num1+"' value='0' style='display:none;'>");
        out.print("<input type='text' name='delv"+num1+"' id='delv"+num1+"' value='"+num1+"' style='display:none;'>");
		out.print("<th><input id='del"+num1+"' name='del"+num1+"' type='submit' value='刪除' onclick='allData"+num1+"();'></th>");
        out.print(" </form>	");		
		out.print("</tr>");	

}

out.print("</table>");

%> </center>

<hr color=black>
<br>
<center>
 <form method="post" action="yesno.jsp">
<%
for(int j=1;j<=num1;j++){
out.print("<input type='text' name='money"+j+"' id='money"+j+"' value='0' style='display:none;'>");

}
out.print("<script language='Javascript'>");
for(int i=1;i<=num1;i++){
	
	out.print("function checkData"+i+"()");
	out.print("{var tv=document.getElementById('qty"+i+"');tv.value--;if(tv.value<0){tv.value=0}");		
	out.print(" var tt=document.getElementById('total"+i+"');tt.innerText="+pricedb[i]+"*tv.value;");
	out.print(" var tm=document.getElementById('money"+i+"');tm.value=tv.value;}");
	out.print("function checkData"+(i+100)+"(){");
	out.print("var tv=document.getElementById('qty"+i+"');tv.value++;");
	out.print("var tt=document.getElementById('total"+i+"');tt.innerText="+pricedb[i]+"*tv.value;");
	out.print(" var tm=document.getElementById('money"+i+"');tm.value=tv.value;}");
out.print("function allData"+i+"(){");
out.print(" var ta=document.getElementById('all"+i+"');	ta.value="+i+";}");
}out.print("</script>");
%>   
<p><input type="image" src="images/結帳.png" align="right-side" width="200" value="結帳">
	</form>
</center>
<center>
<br>
<br>

<a href=http://localhost:8080/homepage1220.jsp STYLE="text-decoration:none"><b>⊙返回首頁⊙</b></a>
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
</body>
</html>