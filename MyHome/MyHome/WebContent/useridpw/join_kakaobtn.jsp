<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ㅋ카오톡 조진다.</title>
  <script src="//developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<a id="kakao-login-btn"></a>
  <script type='text/javascript'>
			Kakao.init('c93301369bfaa9389a01c287d3053cc9');
			// 카카오 로그인 버튼을 생성합니다.
			Kakao.Auth.createLoginButton({
				container : '#kakao-login-btn',
				success : function(authObj) {
					// 로그인 성공시, API를 호출합니다.
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(res) {
							
							console.log(res);
							console.log(res.id);
							console.log(res.kaccount_email);
							console.log(res.properties.nickname);
							console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
							
							//다른 페이지에 출력하기위해 변수저장
							var kakaonickname = res.properties.nickname;
							var kakaoid = res.id;
							
							var url = 'kakaojoin.jsp?kakaonickname=' + encodeURI(kakaonickname) + '&kakaoid=' + kakaoid;
					        window.location.href = url;                   
						},
						fail : function(error) {
							alert(JSON.stringify(error));
						}
					});
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
				
			});
		</script>

</body>
</html>