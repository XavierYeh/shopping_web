<!doctype html>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.*" %>
<html>
<head>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<noscript><link rel="stylesheet" href="../assets/css/noscript.css" /></noscript>
<title>輸入欲刪除資料</title>

<style>		
		fieldset {
  border-radius: 5px;
  
  padding: 20px;
  text-align: center;
 border-width:3px;
		border-color:#DDDDDD;
		width:13cm;
}
body {　

　overflow-y: scroll;

　overflow-x: hidden;
height:100%;
}
body,html {height:100%;}
.div_under_body {height:100%;}
.errmsg{
	font-family:Microsoft JhengHei;
	color:blue;
	
}
.errmsg1{
	font-family:Microsoft JhengHei;
	color:red;
	
}
</style>	
<script>
function myFunction() {
	answer = confirm("確任刪除資料");
	if (answer)
	document.del.submit();
	else
		document.del.no.value="";
}
</script>

</head>
<body class="landing is-preload">
<section id="banner">
  <div id="page-wrapper">

					<header id="header" class="alt">
						<h1><a href="index.html">**購物系統</a></h1>
						<nav id="nav">
							<ul>
								<li class="special">
									<a href="#menu" class="menuToggle"><span>Menu</span></a>
									<div id="menu">
										<ul>
											<li><a href="../index1.jsp">Home</a></li>
											<li><a href="#">尋找商品</a></li>
											<li><a href="#">訂單資訊</a></li>
											<li><a href="mainmenu.jsp">商品維護</a></li>
											<li>
											<FORM id="form" name="form" method="post" action="index2.jsp" >
<legend >會 員 登 入</legend></li>
<%
String no=(String)application.getAttribute("no");
application.setAttribute("loginok","");
try{ 
      if(no.equals(""))
		 response.sendRedirect("index.jsp");
	  request.setCharacterEncoding("utf-8");
      Context initContext = new InitialContext();
      Context context = (Context) initContext.lookup("java:comp/env");
      DataSource ds = (DataSource) context.lookup("jdbc/my");
      // 取得資料庫連結和Statement物件
      Connection dbCon = ds.getConnection(); 
      Statement stmt = dbCon.createStatement(); 
	  String sSQL = "Select M_name From member Where '"+no+"'=M_no";
	  ResultSet rs = stmt.executeQuery(sSQL);
	  rs.next();
	   out.print("會員: "+rs.getString("M_name")+" 您好!!");
      out.print("");
	  stmt.close();   // 關閉Statement物件
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

	<h1 class="errmsg">${loginerror}</h1>
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>
  
</form>
  <div id="page-wrapper">
  <center> <h2>輸入欲刪除資料</h2><fieldset>
<form name="del" method="post" action="getdeleteproduct.jsp" onclick="return false">

 <p>商品編號:
    <input name="id" type="text" id="id" size="10" />
	
  <p>商品名稱:
    <input name="name" type="text" id="name" size="60" />
  <p>
    <input type="Submit" name="Submit" value="送出" onclick="myFunction()"/>
		<input type="button"  value="重新填寫" onclick="location.href='deleteproduct.jsp'"/>
		<h1 class="errmsg">${pok}</h1><h1 class="errmsg1">${perror}</h1>

</form>
</div>
<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.scrollex.min.js"></script>
			<script src="../assets/js/jquery.scrolly.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
</body>
</html>
