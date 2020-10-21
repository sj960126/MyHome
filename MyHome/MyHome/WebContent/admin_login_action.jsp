<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
	request.setCharacterEncoding("utf-8");
	RequestDispatcher dispat = request.getRequestDispatcher("admin_login.jsp");
	RequestDispatcher dispat2 = request.getRequestDispatcher("admin_main.jsp");
	
 	String admin_id = "admin";
 	String pw = "1234";
 	
 	String input_id = request.getParameter("id_txt"); 
	String input_pw = request.getParameter("pass_txt");
	
	
	/*로그인 안했을때, 로그인이 틀렸을때*/
	try{
		if(input_id.equals(admin_id)&&input_pw.equals(pw)){/*(위에서 선언한 VO 객체명).get아이디()*/
			dispat2.forward(request, response);
		}
		else{
			dispat.forward(request, response);
		}
	}catch(Exception e){
		dispat.forward(request, response);
	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
