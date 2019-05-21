<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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


<title>**購物網站</title>
<script type="text/javascript" src="images/jquery1.42.min.js"></script><script type="text/javascript" src="images/jquery.SuperSlide.2.1.3.js"></script>

</head>

<body>


		<style type="text/css">
		/* css 重置 */
		*{margin:0; padding:0; list-style:none; }
		body { 
		      background:#fff url(images/5-141012093457.jpg);
		      background-repeat: repeat;
              background-attachment: fixed;
              background-position: top left;
              background-size:  ;font:normal 18px/22px 宋体;  }
		img{ border:0;  }
		/*a{ text-decoration:none; color:#333;  }*/

		/* 本例子css */
		.slideBox{ width:850px; height:450px; overflow:hidden; position:relative; top:-250px; left:500px; border:1px ;solid #ddd;  }
		.slideBox .hd{ height:15px; overflow:hidden; position:absolute; right:5px; bottom:5px; z-index:1; }
		.slideBox .hd ul{ overflow:hidden; zoom:1; float:left;  }
		.slideBox .hd ul li{ float:left; margin-right:2px;  width:15px; height:15px; line-height:14px; text-align:center; background:#fff; cursor:pointer; }
		.slideBox .hd ul li.on{ background:#f00; color:#fff; }
		.slideBox .bd{ position:relative; height:100%; z-index:0;   }
		.slideBox .bd li{ zoom:1; vertical-align:middle; }
		.slideBox .bd img{ width:850px; height:450px; display:block;  }

		/* 下面是前/后按?代?，如果不需要?除即可 */
		.slideBox .prev,
		.slideBox .next{ position:absolute; left:3%; top:50%; margin-top:-25px; display:block; width:32px; height:40px; background:url(images/slider-arrow.png) -110px 5px no-repeat; filter:alpha(opacity=50);opacity:0.5;   }
		.slideBox .next{ left:auto; right:3%; background-position:8px 5px; }
		.slideBox .prev:hover,
		.slideBox .next:hover{ filter:alpha(opacity=100);opacity:1;  }
		.slideBox .prevStop{ display:none;  }
		.slideBox .nextStop{ display:none;  }
		input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
.errmsg{
	font-family:Microsoft JhengHei;
	color:red;
	
}
input[type=password], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=submit] {
    width: 100%;
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
FORM {
font-family: impact;
position:relative;
top:100px; left:200px;
width: 260px;
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
legend{
  text-align:center;
  font-size:18px;
  font-family: impact;
}
a:link{
//設定還沒有瀏覽過的連結
text-decoration:none;
background-color:#ffffff;
}
a:visited {
//設定已經瀏覽過的連結
color:#ffffff;
background-color:red;
}
a:hover {
//設定滑鼠移經的連結
text-decoration:underline;
background-color:#fafafa;
color:gray;
}
a:active {
//設定正在點選的連結
text-decoration:none;
background-color:gray;
color:#fafafa;
}
		</style>
<FORM id="form" name="form" method="post" action="http://localhost:8080/index2.jsp" >
<fieldset ><legend >會 員 登 入</legend>


<p>
<%
String number=(String)application.getAttribute("no");
application.setAttribute("loginok","");
try{ 
	  request.setCharacterEncoding("utf-8");
      Context initContext = new InitialContext();
      Context context = (Context) initContext.lookup("java:comp/env");
      DataSource ds = (DataSource) context.lookup("jdbc/my");
      // 取得資料庫連結和Statement物件
      Connection dbCon = ds.getConnection(); 
      Statement stmt = dbCon.createStatement(); 
	  String sSQL = "Select M_name From member Where '"+number+"'=M_a_number";
	  ResultSet rs = stmt.executeQuery(sSQL);
	  rs.next();
	  out.print("會員:"+rs.getString("M_name"));
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
<input type='button' name='button' id='button' value="登出" onclick="location.href='index.jsp'" style="width:80px;height:30px;border:3px #66ccff double;"/></a>
<br></br>
	</fieldset>
<p>
	<input type="submit" name="button" id="button" value="尋找商品" class="btn btn-lg btn-primary btn-block" />	
	<p>
	<input type="submit" name="button" id="button" value="訂單查詢" class="btn btn-lg btn-primary btn-block" />	
	<p>
	<input type="submit" name="button" id="button" value="商品維護" class="btn btn-lg btn-primary btn-block" />	

	</p>		<h1 class="errmsg">${loginerror}</h1>
	</FORM>
		<div  id="slideBox" class="slideBox">
			<div class="hd">
				<ul><li></li><li></li><li></li><li></li><li></li><li></li></ul>
			</div>
			<div class="bd">
				<ul>
					<li><a href="http://www.SuperSlide2.com" target="_blank"><img src="images/pic1.jpg" /></a></li>
					<li><a href="http://www.SuperSlide2.com" target="_blank"><img src="images/pic2.jpg" /></a></li>
					<li><a href="http://www.SuperSlide2.com" target="_blank"><img src="images/pic3.jpg" /></a></li>
					<li><a href="http://www.SuperSlide2.com" target="_blank"><img src="images/pic4.jpg" /></a></li>
					<li><a href="http://www.SuperSlide2.com" target="_blank"><img src="images/pic5.jpg" /></a></li>
					<li><a href="http://www.SuperSlide2.com" target="_blank"><img src="images/pic6.jpg" /></a></li>
				</ul>
			</div>

			<!-- 下面是前/后按?代?，如果不需要?除即可 -->
			<a class="prev" href="javascript:void(0)"></a>
			<a class="next" href="javascript:void(0)"></a>
		</div>
	<script type="text/javascript">
		jQuery(".slideBox").slide({mainCell:".bd ul",autoPlay:true});
		</script>


</body>
</html>
<!--<script type="text/javascript">
//百度??代?
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fa630f96b6a9dd549675d26373853f7f1' type='text/javascript'%3E%3C/script%3E"));
</script>-->

