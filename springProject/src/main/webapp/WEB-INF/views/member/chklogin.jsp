<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
   <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <title>네이버로그인</title>
  </head>
  <body>

   
   <div id="naver_id_login"></div>
	
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
	<script type="text/javascript">
 		var naver_id_login = new naver_id_login("s2clEYDL6OP7KrTI2H7_", "http://localhost:9090/controller/chkcallback");	// Client ID, CallBack URL 삽입
											// 단 'localhost'가 포함된 CallBack URL
 		var state = naver_id_login.getUniqState();
		
 		naver_id_login.setButton("white", 2, 40);
 		naver_id_login.setDomain("http://localhost:9090/controller/chklogin");	//  URL
 		naver_id_login.setState(state);
 		naver_id_login.setPopup();
 		naver_id_login.init_naver_id_login();
	</script>
  </body>
</html>