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
<title>商品維護</title>


</head>
  
  <body class="landing is-preload">
<section id="banner">
  <div id="page-wrapper"/>
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
	</fieldset>
	<h1 class="errmsg">${loginerror}</h1>
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>

  <h2>商 品 維 護</h2>
  

  <p>
  <form method="post" action="">
  
	<input type="button" name="Submit" value="新增" background="gary" onclick="location.href='addproduct.jsp'" />
  
	<input type="button" name="Submit" value="修改"  onclick="location.href='changeproduct.jsp'" />
  
	<input type="button" name="Submit" value="刪除" onclick="location.href='deleteproduct.jsp'" />
	
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