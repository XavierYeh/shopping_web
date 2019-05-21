<%@ page contentType="text/html;charset=utf-8"%>

<%@ page import="java.sql.*"%> 
<%@ page import= "java.io.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.DataSource" %>
<html lang=en>
<head>
   <meta charset="utf-8">
   
   <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<noscript><link rel="stylesheet" href="../assets/css/noscript.css" /></noscript>
     <title>HomePage</title>
	 <style>
	
   
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

 
 <body class="landing is-preload">

  <div id="page-wrapper">
 <div id="page-wrapper"/>
					<header id="header" class="alt">
						<h1><a href="index.html">**購物系統</a></h1>
						<nav id="nav">
							<ul>
								<li class="special">
									<a href="#menu" class="menuToggle"><span>Menu</span></a>
									<div id="menu">
										<ul>
											<li><a href="index1.jsp">Home</a></li>
											<li><a href="cartcart.jsp ">購物車</a></li>
											<li><a href="#">訂單資訊</a></li>
											<li><a href="product/mainmenu.jsp">商品維護</a></li>
											<li>
											<FORM id="form" name="form" method="post" action="index2.jsp" >
<fieldset ><legend >會 員 登 入</legend></li>
<%
String no=(String)application.getAttribute("no");
application.setAttribute("loginok","");
application.setAttribute("perror","");
application.setAttribute("pok","");
try{ 
      if(no.equals(""))
	  response.sendRedirect("index.jsp");
	  request.setCharacterEncoding("utf-8");
      Context initContext = new InitialContext();
      Context context = (Context) initContext.lookup("java:comp/env");
      DataSource ds = (DataSource) context.lookup("jdbc/my");
      // 取得資料庫連結和Statement物件
      Connection dbCon = ds.getConnection(); 
      Statement ptmt = dbCon.createStatement(); 
	  String sSQL = "Select M_name From member Where '"+no+"'=M_no";
	  ResultSet ps = ptmt.executeQuery(sSQL);
	  ps.next();
	  out.print("會員: "+ps.getString("M_name")+" 您好!!");
      out.print("");
	  ptmt.close();   // 關閉Statement物件
      dbCon.close();  // 關閉連結
    }
    catch(Exception e) {
      out.print(e);   
    }                     
%>

</p>
<br></br>
<input type='button' name='button' id='button' value="登出" onclick="location.href='../index.jsp'" /></a>
<br></br>
	</fieldset>
	<h1 class="errmsg">${loginerror}</h1>
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>



<%
//request.setCharacterEncoding("utf-8");
String name="";
//try{ 
//String no=(String)application.getAttribute("no");
 //if(no!="")  { 
//	  Context initContext = new InitialContext();
  //    Context context = (Context) initContext.lookup("java:comp/env");
  //    DataSource ds = (DataSource) context.lookup("jdbc/my");
      // 取得資料庫連結和Statement物件
//	  Connection dbCon = ds.getConnection(); 
  //    Statement ptmt = dbCon.createStatement(); 
//	  String sSQL = "Select M_name From member Where '"+no+"'=M_no";
//	  ResultSet ps = ptmt.executeQuery(sSQL);
//	  ps.next();
//	  name="會員: "+ps.getString("M_name");   
  //    ps.close();
//	  ps=null;
 //     ptmt.close();	  // 關閉Statement物件
//	  ptmt=null;
  //    dbCon.close();  // 關閉連結	 
 //}
// else{	
//	name="遊客";
//	}
//}
 //  catch(Exception e) {
 //    out.print(e);   
 //  }        
%>





<center>
  <form method="post" action="hserch.jsp">

    <h2>商 品 搜 尋</h2>
	
    <input type = "text" name = "se" id="se" size = "30">&nbsp;
    <input type="submit" value="傳送">
  </form>
  </center>


<left>
<br>
<br>
<br>
<hr color=black>



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

try
{
//連接mysql資料庫

// 資料庫名稱"zend_test",帳號"root",密碼"123456",
// 使用Unicode編碼"true",字元集"UTF-8"
Context initContext = new InitialContext();
      Context context = (Context) initContext.lookup("java:comp/env");
      DataSource ds = (DataSource) context.lookup("jdbc/my");
      // 取得資料庫連結和Statement物件
      Connection conn = ds.getConnection();

try
{
//建立statement
Statement stmt = conn.createStatement();
try
{
//建立SQL查詢
String sql="select * from product "+pser+";"; 
ResultSet rs = stmt.executeQuery(sql);

%>




<%
//顯示資料

while(rs.next())
{
%>	
<table width="1200" rules="all" style="border:3px #FFD382 dashed;" cellpadding="10" border='1'>
  <center>
    <tr>
      <th width="200">
	    <a href="http://localhost:8080/db_test1.jsp?keyword=<%=rs.getString("P_NO")%>" title="商品詳細資料">
		<img src="<%=rs.getString("P_PICTURE")%>" style="float: left;" align="left" hspace="8px" vspace="5px" height="64" width="64">
		</a>
	  </th>
	  <th width="1500" ><%=rs.getString("P_NAME")%></th>
	  <th><%=rs.getString("P_PRICE")%></th>
    </tr></center>
</table>	
	
	
	
<% 
}
%>


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
<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.scrollex.min.js"></script>
			<script src="../assets/js/jquery.scrolly.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>

</body>

</html>