<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@ page contentType="text/html;charset=utf-8" %>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import= "java.io.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.DataSource" %>
<%@page contentType="text/html;charset=utf-8"%>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Language" content="zh-CN">
	<head>
		<title>***購物系統</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="landing is-preload">
	

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<header id="header" class="alt">
						<h1><a href="index.html">**購物系統</a></h1>
						<nav id="nav">
							<ul>
								<li class="special">
									<a href="#menu" class="menuToggle"><span>Menu</span></a>
									<div id="menu">
										<ul>
											<li><a href="index.jsp">Home</a></li>
											<li><a href="homepage1220.jsp">尋找商品</a></li>
											<li><a href="#">訂單資訊</a></li>
											<li><a href="product/mainmenu.jsp">商品維護</a></li>
											<li>
											<FORM id="form" name="form" method="post" action="index2.jsp" >
<fieldset ><legend >會 員 登 入</legend></li>
<%
String no=(String)application.getAttribute("no");
application.setAttribute("loginok","");
application.setAttribute("plok","");
application.setAttribute("perror","");
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
<input type='button' name='button' id='button' value="登出" onclick="location.href='index.jsp'" /></a>
<br></br>
	</fieldset>
	<h1 class="errmsg">${loginerror}</h1>
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>

				<!-- Banner -->
					<section id="banner">
						<div class="inner">
							<h2>**購物系統</h2>
							<p>魅力空間，創意無限。<br />
							時刻準備著，美麗不打折。<br />
							自我自主，任你擺步。<!-- <a href="http://html5up.net">HTML5 UP</a>.--></p>
							
						</div>
						<a href="#one" class="more scrolly">Learn More</a>
					</section>

				<!-- One -->
					<section id="one" class="wrapper style1 special">
						<div class="inner">
							<header class="major">
								<h2>請先登入會員<br />
								eget augue amet aliquet nisl cep donec</h2>
								<p>Aliquam ut ex ut augue consectetur interdum. Donec amet imperdiet eleifend<br />
								fringilla tincidunt. Nullam dui leo Aenean mi ligula, rhoncus ullamcorper.</p>
							</header>
							<ul class="icons major">
								<li><span class="icon fa-diamond major style1"><span class="label">Lorem</span></span></li>
								<li><span class="icon fa-heart-o major style2"><span class="label">Ipsum</span></span></li>
								<li><span class="icon fa-code major style3"><span class="label">Dolor</span></span></li>
							</ul>
						</div>
					</section>

				<!-- Two -->
					<section id="two" class="wrapper alt style2">
						<section class="spotlight">
							<div class="image"><img src="images/pic01.jpg" alt="" /></div><div class="content">
								<h2>acer S30-20-553D 14吋8代i5獨顯輕薄筆電<br /></h2>
								<ul>i5-8250U/4G/256G SSD/MX150-2G
								<li>CPU：IntelR Core i5-8250U</li>
								<li>clock/Turbo：1.6 GHz/3.4 GHz</li>  
								<li>顯示晶片：NVIDIAR GeForceR MX150</li>
								<li>LCD 尺寸：14.0'' FHD IPS 鏡面/LED背光</li>
								
								</ul>
							</div>
						</section>
						<section class="spotlight">
							<div class="image"><img src="images/pic02.jpg" alt="" /></div><div class="content">
								<h2>Xbox One X 1TB 絕地求生版<br /></h2>
								<ul>Xbox One X 的特點：
								  <li>Xbox One X的GPU運算能力超越競品達40% 以上。</li>
								  <li>真 4K遊戲體驗：每秒6 萬億次圖形處理能力，內建4K藍光光碟機提供更沉浸的遊戲及娛樂體驗。</li>
								  <li>與廣大的Xbox Live玩家社區互動，一起在優質的網路上暢玩多人遊戲。</li>
								  <li>超採樣技術讓遊戲也能讓使用Full HD螢幕的玩家擁有更棒的體驗 – 遊戲更順暢、畫面更精彩、載入更快速。</li>
								</ul>
								
							</div>
						</section>
						<section class="spotlight">
							<div class="image"><img src="images/pic03.jpg" alt="" /></div><div class="content">
								<h2>SONY 索尼 PS4 Pro 7117 1TB<br /></h2>
								<ul>極致黑+第二手把T2G-黑-專+遊戲任選*1</ul>
								<li>CPU︰x86-64 AMD “Jaguar”(8 核心)</li>
								<li>GPU︰4.20 TFLOPS, AMD 次世代 Radeon based 圖像引擎</li>
								<li>記憶體：GDDR5 8GB   儲存容量：1TB</li>
								<li>4K超高解析度：由圖像彩現技術或升頻輸出。</li>
								
							</div>
						</section>
					</section>

				<!-- Three -->
					<section id="three" class="wrapper style3 special">
						<div class="inner">
							<header class="major">
								<h2>Accumsan mus tortor nunc aliquet</h2>
								<p>Aliquam ut ex ut augue consectetur interdum. Donec amet imperdiet eleifend<br />
								fringilla tincidunt. Nullam dui leo Aenean mi ligula, rhoncus ullamcorper.</p>
							</header>
							<ul class="features">
								<li class="icon fa-paper-plane-o">
									<h3>Arcu accumsan</h3>
									<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
								</li>
								<li class="icon fa-laptop">
									<h3>Ac Augue Eget</h3>
									<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
								</li>
								<li class="icon fa-code">
									<h3>Mus Scelerisque</h3>
									<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
								</li>
								<li class="icon fa-headphones">
									<h3>Mauris Imperdiet</h3>
									<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
								</li>
								<li class="icon fa-heart-o">
									<h3>Aenean Primis</h3>
									<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
								</li>
								<li class="icon fa-flag-o">
									<h3>Tortor Ut</h3>
									<p>Augue consectetur sed interdum imperdiet et ipsum. Mauris lorem tincidunt nullam amet leo Aenean ligula consequat consequat.</p>
								</li>
							</ul>
						</div>
					</section>

				<!-- CTA -->
					<section id="cta" class="wrapper style4">
						<div class="inner">
							<header>
								<h2>Arcue ut vel commodo</h2>
								<p>Aliquam ut ex ut augue consectetur interdum endrerit imperdiet amet eleifend fringilla.</p>
							</header>
							<ul class="actions stacked">
								<li><a href="#" class="button fit primary">Activate</a></li>
								<li><a href="#" class="button fit">Learn More</a></li>
							</ul>
						</div>
					</section>

				<!-- Footer -->
					<footer id="footer">
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
						</ul>
						<ul class="copyright">
							<li>&copy; Untitled</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
						</ul>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>