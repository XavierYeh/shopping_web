<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.lang.*"%> 
<%@ page import="java.sql.*"%> 
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
	
  </head> 
  <body > 
    <%	request.setCharacterEncoding("utf-8");
    String num1=(String)request.getParameter("all");
	int j = Integer.parseInt(num1);
    String code="";	
    for(int i=1;i<=j;i++){
		String pp=(String)session.getAttribute("p"+i);
		String val=(String)request.getParameter("delv"+i);
		//out.print("*"+pp);
		String all=(String)request.getParameter("all"+i);
		//out.print("#"+all);
	    if(all==null){
			if(pp!=null){
				if(code==""){
				code=pp;
			    }else{
				code=code+","+pp;
			    }
			}
			
		}
		
	}
	session.setAttribute("pno1", code);
	response.sendRedirect("http://localhost:8080/cartcart.jsp");
	out.print(code);
	out.print("aaa");  


%>	
     

  </body>
</html>
