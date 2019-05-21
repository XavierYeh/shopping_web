<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "javax.naming.*" %>
<%@ page import= "javax.sql.*" %>
<html lang=en>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
   <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
     <title>訂單資訊</title>
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	 <style>
	 body{
	 background-image: url("images/5-141012093457.jpg");
	 }
	 
    h2{
    	color: white;	
    	padding: px auto;
    	margin: 0px auto;
    	position: relative;
    	top: px;
    	left: px;
    }
	
	.navbar-brand{
            padding: 0px;
            background: url(https://source.unsplash.com/random/100x35) center / contain no-repeat;
                width: 100px;
          }

          .navbar-brand>img {
           max-height: 100%;
           height: auto;
           padding: 15px; /* firefox bug fix */
           -o-object-fit: contain;
           object-fit: contain;
          }
    </style>    	 
</head>

<body>
<%request.setCharacterEncoding("utf-8");
String ano=(String)application.getAttribute("no");
String admin="";
if(ano!=null){admin=ano;}
else{admin="遊客";}
%>
<center>
<div id="navbar"></div>
<nav class="navbar navbar-default navbar-inverse" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a style="margin: auto 5x;" class="navbar-brand" href="#"></a>
                </div>
			
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">首頁</a></li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" name = "se" id="se" size = "30" placeholder="Search" >
                        </div>
                        <button type="submit" class="btn btn-default">Search</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
					    <li><th width="" style="float: right-side;"><a href=http://localhost:8080/cartcart.jsp STYLE="text-decoration:none"><b>購物車</b></a></li>
					    <li><th width="" style="float: right-side;"><a href="#"><b><%out.print(admin);%>會員中心</b></a></li>
                        <li><th width="" style="float: right-side;"><a href="#">與我聯絡</a></li>
				        <li><th width="" style="float: right-side;"><a href="#">關於我們</a></li>
                        <li><th width="" style="float: right-side;"><a href="#">登出</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div>
        </nav>
</center>
</body>

  <head>   
    <title>訂單紀錄列表</title>
	<style>
	 <style type="text/css">
  form {
	-webkit-border-radius: 50px;   
	border:#000 2px dashed;
	padding:center;
	width:450px;
    margin:auto; 
	text-align:center;
  }
  input {
	-webkit-border-radius: 10px; 
	font-size:90%;
	background:#E6E6FA;
	border:#AAA 1px solid;
  }
  </style>
  </head>
  
 <body background="../pic/bg.jpg">
 <div style="border:1.5px  solid;padding:0px;">
 <div style="background-color:azure;padding:50px;margin-bottom:0px;opacity:0.5;" align="center" valign="center">訂單紀錄列表</div>
  </div >  
   <p>

<center>
<%
	  request.setCharacterEncoding("utf-8");
	  //String M_no = request.getParameter("M_no");
      Connection dbCon = null;
      Statement stmt = null;
      ResultSet rs = null;
	  ResultSetMetaData md = null;
	 
      String sDriver = "com.mysql.cj.jdbc.Driver";
      String user     = "root";
      String password = "123456";
      String url      = "jdbc:mysql://localhost/mydb?serverTimezone=GMT&useSSL=false";
      Class.forName(sDriver);
      dbCon = DriverManager.getConnection(url,user,password);
      stmt = dbCon.createStatement();
	  
      String ssql="select * from order_record_list" ;//where M_no=;+"'"+M_no+"'"
      rs=stmt.executeQuery(ssql);
	  int i=1;
	  
      out.print("<TABLE border='2' width='600'><TR>");	
      out.print("<TD align='center'><b>訂單編號</b></TD>");
      out.print("<TD align='center'><b>訂單日期</b></TD>");
      out.print("<TD align='center'><b>客戶編號</b></TD>");
	  out.print("<TD align='center'></TD>");

	 
      while(rs.next()){
		  
		 out.print("<TR>");
		 out.print("<TD align='center'>");
		 out.print(rs.getString("O_number"));
		 out.print("</TD>");
		 out.print("<TD align='center'>");
         out.print(rs.getString("O_date"));
		 out.print("</TD>");
		 out.print("<TD align='center'>");
		 out.print(rs.getString("M_no"));
		 out.print("</TD>");
		 out.print("<TD>");
		 %>
		 
		 <FORM method="post" name="btn" id="btn" action="">
		 <center>
		 <a href='order_detail.jsp?str=o<%=i%>' >
		 <INPUT TYPE="button" NAME="o<%=i%>" VALUE="查看明細" align="center" onclick="location.href='order_detail.jsp'"></a>
		 </center>
		 </FORM>
		
		 <%
		
		 out.print("</TD>");
		 out.print("</TR>");
		 i++;
		 
      }
      out.print("</TABLE>\n");
      stmt.close();
      dbCon.close();
    %>
	
	<p>
	 <center>
	  <FORM method="post" name="btn" id="btn" action="">
       <INPUT TYPE="SUBMIT" VALUE="重新填寫" style="margin-center:px;" onclick="location.href='testconnect.jsp'">
      </FORM>
	  </center>
	  
   </center>  
  </body>
</html>