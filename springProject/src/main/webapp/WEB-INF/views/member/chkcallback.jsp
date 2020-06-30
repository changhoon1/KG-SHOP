<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <title>네이버로그인</title>
  </head>
  <body>
 <script type="text/javascript">
		var naver_id_login = new naver_id_login("s2clEYDL6OP7KrTI2H7_", "http://localhost:9090/controller/chkcallback"); // 역시 마찬가지로 'localhost'가 포함된 CallBack URL
		
		// 접근 토큰 값 출력
		//document.write(naver_id_login.oauthParams.access_token);
		
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			alert(naver_id_login.getProfileData('email'));
			alert(naver_id_login.getProfileData('nickname'));
			//alert(naver_id_login.getProfileData('age'));
			//sessionStorage.setItem('naverId',naver_id_login.getProfileData('nickname'));
			localStorage.naverId = naver_id_login.getProfileData('email')
			opener.location.href="home";
			window.close();
		}
		
	</script>
  </body>
</html>