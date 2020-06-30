<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 <title>Shop Homepage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">
</head>
<body>

	
 <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">KG SHOP</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#" >${id }님 환영합니다
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Q&A게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">리뷰게시판</a>
          </li>
         <li class="nav-item">
            <a class="nav-link" href="shoppingcart?user_id=test">장바구니</a>
          </li>
          
             <c:choose>
          	  <c:when test="${id eq 'system'}"><a class="nav-link" href="myPage">관리자페이지</a></c:when>
          	  <c:otherwise><a class="nav-link" href="myPage">마이페이지</a></c:otherwise>    
            </c:choose>
          
          <li class="nav-item">
            <a class="nav-link" href="logout">로그아웃</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">
	
      <div class="col-lg-3">
		<c:choose>
		 <c:when test="${id eq 'system'}"> 
		 <h1 class="my-4">관리자페이지</h1>
		  <div class="list-group">
         <a href="viewbanner" class="list-group-item">배너수정</a>
         <a href="#" class="list-group-item">상품등록</a>
         <!-- 
         <a href="#" class="list-group-item">비밀번호수정</a>
         <a href="#" class="list-group-item">상품전체</a>
         <a href="#" class="list-group-item">댓글달기</a>
          -->
        
         </div>
		 </c:when>
		 	
		<c:otherwise>
        <h1 class="my-4">마이페이지</h1>
        <div class="list-group">
    
         <a href="bootMemberModify" class="list-group-item">회원정보수정</a>
     
         <a href="#" class="list-group-item">내가 쓴글</a>
         <a href="#" class="list-group-item">장바구니</a>
         <a href="#" class="list-group-item">주문내역</a>

        </div>
		</c:otherwise>
		</c:choose>
      </div>
 
      <!-- /.col-lg-3 -->
      <div class="col-lg-9">






      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>