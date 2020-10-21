<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8"/>
  <title>나만의집 ::: 회원가입</title>
    <style>
body {
    height: 100%;
    width : 1080px;
    margin: auto;
    background-color: #5a6275;
}
form{
    width: 400px;
    display: inline-block;
    padding-top: 3%;
    margin-top: 5%;
    padding-bottom: 3%;
    margin-bottom: 5%;
}
#joinMenuWrap{
    border: 1px solid;
	width: 1000px;
    height: 400px;
    text-align: center;
    margin-top: 15%;
    margin-right: auto;
    margin-left: auto;
    background-color: white;
}
#joinbtn{
    width: 310px;
    height: 50px;
    background-color: #5a6275;
    border: none;
    color: white;
}
  </style>
 </head>
 <body>
 <div id ="joinMenuWrap">
	<form  action= "page_join.jsp" name="login_form" method ="post" style="border-right: 1px solid;"> 
        <h1>일반회원 가입</h1>
        <br>
        <br>
        <br>
    <input type = "submit" value ="나만의집 join" id ="joinbtn">
        <br>
        <br>
        <br>
    </form>
    <form  action= "kakaojoin.jsp" method ="post"> 
        <h1>카카오톡 가입</h1>
        <br>
        <br>
        <br>
     <%@ include file="join_kakaobtn.jsp"%>
        <br>
        <br>
        <br>
    </form> 
    </div>
</body>
</html>