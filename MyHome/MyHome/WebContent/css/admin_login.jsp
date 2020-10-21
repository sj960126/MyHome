<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8"/>
  <link href="css/admin_login.css" rel="stylesheet"/>
  <title>관리자 로그인</title>
 </head>
 
 <body>
    <div id ="loginWrap">
	<form action= "admin_login_action" name="admin_login_action" method ="post"> 
      <table>
            <tr><th>LOGIN</th></tr>
         <tr>
            <td><input type="text" name ="id_txt" placeholder="아이디" class= "text"></td>
        </tr> 
        <tr>
            <td><input type="password" name ="pass_txt" placeholder="비밀번호" class= "text"></td>
        </tr>
        <tr><td><input type="submit" value ="LOGIN" id = "loginbtn" >
     	</td></tr>
        </table>
     </form>
     </div>
</body>
</html>