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
     <title>商品網頁</title>
	 <style>
    
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


</form>
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
//Class.forName("com.mysql.jdbc.Driver").newInstance();


try
{
//String sDriver = "com.mysql.jdbc.Driver";
//      String user     = "root";
//      String password = "123456";
//      String url      = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";//&amp;useUnicode=true&characterEncoding=utf8
//Connection conn= DriverManager.getConnection(url,user,password);
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
<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.scrollex.min.js"></script>
			<script src="../assets/js/jquery.scrolly.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
</body>

</html>