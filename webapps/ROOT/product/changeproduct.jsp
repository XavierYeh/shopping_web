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
<title>輸入欲更改資料</title>
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

}
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
 function Check(form) {
  returnvalue = true;
  errormsg="";

  if (form.name.value == "") { errormsg+="請填寫【商品名稱】\n"; returnvalue = false; }
  if (returnvalue == false) { alert(errormsg); form.name.focus(); }
  else{return true;}

  if (form.number.value == "") { errormsg+="請填寫【數量】\n"; returnvalue = false; }
  if (returnvalue == false) { alert(errormsg); form.number.focus();}
  else{return true;}
  
  if (form.price.value == "") { errormsg+="請輸入價格\n"; returnvalue = false; }
  if (returnvalue == false) { alert(errormsg); form.price.focus(); }
  else{return true;}
  
  if (form.T_NO.value == "") { errormsg+="請輸入T_NO\n"; returnvalue = false; }
  if (returnvalue == false) { alert(errormsg); form.T_NO.focus(); }
  else{return true;}
  
  if (form.imformation.value == "") { errormsg+="請輸入詳細資訊\n"; returnvalue = false; }
  if (returnvalue == false) { alert(errormsg); form.imformation.focus(); }
  else{return true;}
  
  if (form.picture.value == "") { errormsg+="請輸入商品圖片\n"; returnvalue = false; }
  if (returnvalue == false) { alert(errormsg); form.picture.focus(); }
  else{return true;}
  
  if (returnvalue == true) form.sumbit();
  }
</script>
</head>

 <body class="landing is-preload">

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
  

  <div id="page-wrapper">
 
  
 </form>
 <center> <fieldset><h2>輸入欲更改資料</h2>
<h1 class="errmsg">${pok}</h1><h1 class="errmsg1">${perror}</h1>
<form method="post" action="getchangeproduct.jsp" onSubmit="return returnvalue">
  
  <p>商品編號:
    <input name="id" type="text" id="id" size="10" />
	
  <p>商品名稱:
    <input name="name" type="text" id="name" size="10" />
  <p>  數量:
     <input name="number" type="text" id="number" size="11" />
  <p>價格:
    <input name="price" type="text" id="price" size="11" />
  <p>T_NO:
    <input name="T_NO" type="text" id="T_NO" size="1" /><p>
	詳細資訊:
  <p>
     <textarea name="imformation" id="imformation"  cols="50" rows="5">
     </textarea><p>
	商品圖片:直接輸入檔名
  <p>
     <input name="picture" id="picture" type="text" size="11"/>
  <p>
    <input type="Submit"  value="送出" onclick="check(this.form);"/>
		<input type="button"  value="重新填寫" onclick="location.href='changeproduct.jsp'"/>
		</fieldset>
</center>
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
