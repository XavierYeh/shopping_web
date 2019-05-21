<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "javax.naming.*" %>

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


<br>

<head>   
  <style>
	  table {
		  width: auto px;
		  
	  }
	  
	  th{ text-align:center;

	  }
	  
	  form {
	-webkit-border-radius: 50px;   

  }
	  
  </style>
</head>
  <body> 
    <center>
	<font size="6"><b>訂單資訊</b></font><p>
	<br>
	<br>
	
    <%
	  request.setCharacterEncoding("utf-8");
	  String str = request.getParameter("str");
      Connection dbCon = null;
      Statement stmt = null;
      ResultSet rs = null;
	  ResultSet ts = null;
	  ResultSet ys = null;
	  ResultSetMetaData md = null;
      //驅動程式參數
	   
      String sDriver = "com.mysql.cj.jdbc.Driver";
      String user     = "root";
      String password = "123456";
      String url      = "jdbc:mysql://localhost/mydb?serverTimezone=GMT&useSSL=false";
      StringBuffer sb = new StringBuffer();
      Class.forName(sDriver);
      dbCon = DriverManager.getConnection(url,user,password);
   
 
      String sql="select  odr.O_number,odr.O_date,odr.M_no,m.M_name,odr.P_no,p.P_name,p.P_price,odr.quantitty,p.P_price*odr.quantitty,p.T_NO,odr.O_picker,odr.O_address,odr.O_schedule from (odr inner join member m on m.M_no=odr.M_no)inner join product p on p.P_NO=odr.P_no where odr.O_number=";
	  
	  stmt = dbCon.createStatement();
	  rs=stmt.executeQuery(sql+"'"+str+"'");
	  
	  
      sb.append("<TABLE border='2' width='600'><TR>");
	  sb.append("<TH align='center'>客戶姓名</TH>");
	  sb.append("<TH align='center'>客戶編號</TH>");
      sb.append("<TH align='center'>訂單編號</TH>");
      sb.append("<TH align='center'>訂單日期</TH>");
	  sb.append("<TH align='center'>收件人編號</TH>");
      sb.append("<TH align='center'>配送地址</TH>");
	  sb.append("<TH align='center'>訂單進度</TH>");
	  sb.append("</TR>");
	  sb.append("</TABLE>\n");
	  
	  sb.append("<br>\n");
	  sb.append("<br>\n");
	  
	  sb.append("<TABLE border='2' width='600'><TR>");	
	  sb.append("<TH align='center'>商品編號</TH>");
	  sb.append("<TH align='center'>商品名稱</TH>");
	  sb.append("<TH align='center'>商品價格</TH>");
	  sb.append("<TH align='center'>購買數量</TH>");
	  sb.append("<TH align='center'>總金額</TH>");
	  sb.append("<TH align='center'>折價方式</TH>");
	  sb.append("</TR>");
	  sb.append("</TABLE>\n");
	  
	  
	 
      while(rs.next()){
		sb.append("<TABLE border='2' width='600'><TR>");		
		sb.append("<TR>");   
		sb.append("<TD>");
        sb.append(rs.getString("m.M_name"));
	    sb.append("</TD>");
        sb.append("<TD>");
        sb.append(rs.getString("odr.O_number"));
		sb.append("</TD>");
		sb.append("<TD>");
        sb.append(rs.getString("odr.O_picker"));
	    sb.append("</TD>");
        sb.append("<TD>");
        sb.append(rs.getDate("odr.O_date"));
	    sb.append("</TD>");
        sb.append("<TD>");
        sb.append(rs.getInt("odr.M_no"));
		sb.append("</TD>");
		sb.append("<TD>");
		sb.append(rs.getString("odr.O_address"));
	    sb.append("</TD>");
		sb.append("<TD>");
        sb.append(rs.getString("odr.O_schedule"));
	    sb.append("</TD>");
		sb.append("<TR>");
		sb.append("</TABLE>\n");
		
		sb.append("<TABLE border='2' width='600'><TR>");	
        sb.append("<TD>");
        sb.append(rs.getString("odr.P_no"));
	    sb.append("</TD>");
		sb.append("<TD>");
        sb.append(rs.getString("p.P_name"));
	    sb.append("</TD>");
		sb.append("<TD>");
        sb.append(rs.getString("p.P_price"));
	    sb.append("</TD>");
		sb.append("<TD>");
        sb.append(rs.getString("odr.quantitty"));
	    sb.append("</TD>");
		sb.append("<TD>");
        sb.append(rs.getString("p.P_price*odr.quantitty"));
	    sb.append("</TD>");
		sb.append("<TD>");
        sb.append(rs.getString("p.T_NO"));
	    sb.append("</TD>");
		sb.append("</TR>");
		sb.append("</TABLE>\n");
      }
	  
      String result= sb.toString();
      out.print(result);
      
      stmt.close();
      dbCon.close();
    %>
	</center>
	
	<center>
	</form>
	<form method="post" action="testconnect.jsp">
      <input type="submit" value="查詢其他明細">
	<form method="post" action="首頁">
      <input type="submit" value="返回首頁">
	  </form>
	</center>
	
	
  </body>
</html>