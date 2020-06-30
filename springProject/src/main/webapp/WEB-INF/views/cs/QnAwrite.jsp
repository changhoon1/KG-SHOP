
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.button{
	width: 100px;
	
	background-color:  #00D8FF;

    border: none;

    color:#fff;

    padding: 8px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;
    
    border-radius:10px;
	}
	.button1 {
	width: 100px;
	
	background-color:  #ED0000;

    border: none;

    color:#fff;

    padding: 8px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;
    
    border-radius:10px;
	}
</style>
	<script type="text/javascript">
		
		function publicRadioChk(){
			var password = document.getElementById("qa_pwd");
			password.value='';
			document.getElementById("radiovaluechk").value='0';
			console.log('라디오 값 =',document.getElementById("radiovaluechk").value);
		}
		function privateRadioChk(){
			document.getElementById("radiovaluechk").value='1';
			console.log('라디오 값 =',document.getElementById("radiovaluechk").value);
		}
		function writeChk(){
			var subject = document.getElementById("qa_subject");
			var password = document.getElementById("qa_pwd");
			var radioValue= document.getElementById("radiovaluechk").value;
			console.log('비밀번호 체크시 라디오 값 =',radioValue);
			
			if(!subject.value){
				alert('제목은 필수사항입니다.');
				subject.focus();
				
			}
			else if(!password.value&&radioValue==1){
				alert('비밀번호는 필수사항입니다.');
				password.focus();
			}
			else{
				document.getElementById("savedata").submit();
			}
		}
		
		
	</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="home">KG SHOP</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
          <c:choose>
               <c:when test="${id eq 'system'}"><a class="nav-link" href="#" >${id }님 환영합니다 
              <span class="sr-only">(current)</span></a>
              </c:when>
              <c:when test="${empty id }"> <a class="nav-link" href="home">홈
              <span class="sr-only">(current)</span>
              </a></c:when>
               <c:when test="${id eq id}"><a class="nav-link" href="#" >${id }님 환영합니다 
              <span class="sr-only">(current)</span>
              </a>
              </c:when>       
          </c:choose>
           
            
          </li>
          <li class="nav-item">
            <a class="nav-link" href="QnA">Q&A게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="reviewPage">리뷰게시판</a>
          </li>
          
         <li class="nav-item">
         <c:choose>
               <c:when test="${id eq 'system'}"></c:when>
               <c:when test="${empty id }"></c:when>
            <c:otherwise> <a class="nav-link" href="shoppingcart">장바구니</a></c:otherwise>
             </c:choose>
          </li>
            
           <li class="nav-item">

   
             <c:choose>
               <c:when test="${id eq 'system'}"><a class="nav-link" href="myPage">관리자페이지</a></c:when>
                <c:when test="${empty id }"> 
               <a class="nav-link" href="bootMember">회원가입</a>
                </c:when>
               <c:otherwise><a class="nav-link" href="myPage">마이페이지</a></c:otherwise>    
            </c:choose>
          
          <li class="nav-item">
             <c:choose>
                  <c:when test="${empty id }"> <a class="nav-link" href="bootlogin">로그인</a> </c:when>
                  <c:otherwise>  <a class="nav-link" href="logout">로그아웃</a></c:otherwise>       
            </c:choose>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>
<p>
	<p>
	<p>
	<p>
	<p>

<h1 style="text-align: center;">글쓰기</h1>

<div>
	<form action="savedata" method="get" id="savedata">
		<table class="table">
			<tr>
				<td>
					<input type="hidden" name="user_id" value="${sessionScope.id}">
					카테고리 분류
				</td>
				<td> 
					<select name="qa_category">
						<option value="상품문의">상품문의
						<option value="배송문의">배송문의
						<option value="교환/환불문의">교환/환불문의
						<option value="취소문의">취소문의
					</select> 
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="qa_subject" id="qa_subject" ></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="100" style="resize: none" name="qa_content">
					☆ 문의내용
					</textarea>
				</td>
			</tr>
			<tr>
				<td>비공개 여부 </td>
				<td> 
					공개<input type="radio" name="qa_state" id="public" value="0" 
						onClick="this.form.qa_pwd.disabled=true; publicRadioChk();">
					비공개<input type="radio" name="qa_state" id="private" checked="checked" value="1"
					    onClick="this.form.qa_pwd.disabled=false; privateRadioChk();">
					 	<input type="hidden" id="radiovaluechk"  value="1">
				</td>
			</tr>		
			<tr>
				<td>비밀번호</td>
				<td> <input type="password" name="qa_pwd" id="qa_pwd"> </td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		<div style="text-align: center;"><input type="button" value="확인" onclick="writeChk()" class="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="취소" onclick="location.href='QnA'" class="button1"></div>
	</form>
	<p>
	<p>
	<p>
	<p>
	<p>
	
	<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</div>
</body>
</html>