<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>

<script>
function validateForm(form){
  if(form.M_name.value==""
    ||form.M_a_number.value==""||form.M_password.value==""){
    alert("帳號、密碼、姓名、電話欄不得為空");
    return -1;
  }
  var re = /^[\w]{4,12}$/;
	if (re.test(form.M_password.value)&&re.test(form.M_a_number.value))
	{
		form.submit();
        return 0;
	}
	else
	{
		alert("帳號密碼有誤 !!");
	}	
  
 
}
</script>
<style>
body { 
		      background:#fff url(images/5-141012093457.jpg);
		      background-repeat: repeat;
              background-attachment: fixed;
              background-position: top left;
              background-size:  ;font:normal 18px/22px 宋体;  }
input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
	border: none;
    border-bottom: 2px solid red;
    
    box-sizing: border-box;
}

input[type=password], select {

    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
	border: none;
    border-bottom: 2px solid red;
    
    box-sizing: border-box;
}
input[type=submit] {
    width: 15%;
    background-color: #66ccff;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=button] {
    width: 15%;
    background-color: #66ccff;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=submit]:hover {
    background-color: #007FFF;
}
input[type=button]:hover {
    background-color: #007FFF;
}
fieldset {
  border-radius: 5px;
  
  padding: 20px;
  text-align: center;
 border-width:3px;
		border-color:#DDDDDD;
		width:13cm;
}
.errmsg{
	font-family:Microsoft JhengHei;
	color:red;
	
}
body {　

　overflow-y: scroll;

　overflow-x: hidden;

}
</style>
<title>會員註冊</title>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body class="landing is-preload">
<section id="banner">
<div id="page-wrapper"/>
<center>
<FORM id="form" name="form" method="post" action="register.jsp" onclick="return false">

<fieldset>


<h2>會 員 註 冊</h2>

<p>
會員帳號 :
<input type="text" name="M_a_number" id="M_a_number"  maxlength="12" class="form-control" placeholder="至少4個以上" /></p>

	會員密碼:<input type="password" name="M_password" id="M_password" maxlength="12" class="form-control" placeholder="至少4個以上"/></p>
	
	
	會員姓名:<input type="text" name="M_name" id="M_name" maxlength="12" class="form-control" placeholder="不得為空"/>

	會員電話:<input type="text" name="M_tel" id="M_tel" maxlength="12"  />
	
	居住地址:<input type="text" name="M_address" id="M_address" value="" maxlength="50"  />
	
</p>
	</fieldset>
<p>
	<input type="submit" name="button" id="button" value="確 認 送 出" class="btn btn-lg btn-primary btn-block" onClick="validateForm(this.form)"/>
	<input type="button" name="button" id="button" value="返 回 首 頁" onclick="location.href='./index.jsp'" />
	
	</FORM><h1 class="errmsg">${pok}</h1><h1 class="errmsg1">${perror}</h1>
	 </center>
	 </section>
	 <%
	 application.setAttribute("loginerror","");
	 %>
	 <script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>   
</html>   
   
   