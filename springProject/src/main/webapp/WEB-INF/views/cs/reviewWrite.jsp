
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
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
		function writeChk(){
			var subject = document.getElementById("review_subject");
			
			if(!subject.value){
				alert('제목은 필수사항입니다.');
				subject.focus();
			}
			else{
				document.getElementById("reviewSavedata").submit();
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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



<!-- VIEW단  -->
<h1 style="text-align: center;">글쓰기</h1>

<div>
   <form action="reviewSavedata" method="post" id="reviewSavedata" enctype="multipart/form-data" >
   <input type="hidden" value="${product.product_thumbnail}" name="review_product_image">
		<table class="table">
			<tr>
				<td>
					<input type="hidden" name="review_user_id" value="${sessionScope.id}">
					리뷰 점수
				</td>
				<td> 
					<select name="review_score">
						<option value="1">1
						<option value="2">2
						<option value="3">3
						<option value="4">4
						<option value="5">5
					</select> 
				</td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td><input type="text" name="review_subject" id="review_subject"></td>
			</tr>		
			<tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="100" style="resize: none" name="review_content">리뷰내용
					</textarea>
				</td>
			</tr>
			<tr>
				<th>상품 이미지</th>
				<td>
				<img style="width: 200px; height: 200px;"  src="<spring:url value='/imgUpload/'/>${product.product_thumbnail}" >
				</td>				
			</tr>
			<tr>
				<th>상품명</th>
				<td>
				<input type="text" value="${product.product_name_title}" name="review_product_title" readonly>
				</td>
			</tr>
			<tr>
			<th>리뷰 이미지</th>
			<td>
			<input type="file" name="file" id="review_image" name="review_image">
			</td>
			
			</tr>
			
			<tr>
				<th>리뷰 이미지 미리보기</th>
				<td><div class="select_img"><img src="" /></div></td>
			</tr>
			<script>
			  $("#review_image").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img img").attr("src", data.target.result).width(500);        
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
 				</script>
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