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
	<script>
function validateForm(form){
  if(form.name.value==""
    ||form.number.value==""||form.price.value==""){
    alert("商品名稱、數量、價格不得為空");
     return -1;
  }
  else{
		form.submit();
        return 0;
  }
	
	
 
}
</script>		
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
<title>商品維護<新增商品></title>


<script language="JavaScript">
  //function Check() {
    //if(document.product.name.value.length==0 || document.product.number.value.length==0||document.product.price.value.length==0||document.product.T_NO.value.length==0||document.product.imformation.value.length==0||document.product.picture.value.length==0) 
	//{
	    //alert('資料輸入不完整');
		//document.product.name.focus();
		//document.product.name.select();
		//document.product.number.focus();
		//document.product.number.select();
		//document.product.price.focus();
		//document.product.price.select();
		//document.product.T_NO.focus();
		//document.product.T_NO.select();
		//document.product.imformation.focus();
		//document.product.imformation.select();
		//document.product.picture.focus();
		//document.product.picture.select();
		
	//}
	//else
	//{
	//    document.product.submit();
	//}
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
											<FORM id="form1" name="form1" method="" action="index2.jsp" >
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
<center> <h2>新增商品</h2> 
<h1 class="errmsg">${pok}</h1><h1 class="errmsg1">${perror}</h1>
  <form method="post" name="form" id="form" action="getaddproduct.jsp" onclick="return false" >
<fieldset>

  <p>商品名稱:
    <input name="name" type="text" id="name" size="10" /></p>
   <p>數量:
     <input name="number" type="text" id="number" size="11" /></p>
     <p>價格:
    <input name="price" type="text" id="price" size="11" /></p>
     <p>T_NO:
    <input name="T_NO" type="text" id="T_NO" size="1" /></p>
	 <p>詳細資訊:
 
     <textarea name="imformation" id="imformation"  cols="50" rows="5">
     </textarea></p>
	商品圖片:直接輸入檔名
  <p>
     <input name="picture" id="picture" type="text" size="11"/>
  <p>
    <input type="submit" name="button" id="button" value="確 認 送 出" class="btn btn-lg btn-primary btn-block" onClick="validateForm(this.form)"/>
	<input type="reset"  value="重新填寫" onclick="location.href='addproduct.jsp'"/>
</fieldset>
</form>
</center>
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
