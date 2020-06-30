<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
<html>
<head>
	<title>Home</title>
	  <!-- Bootstrap core CSS -->
  <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">
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
            <a class="nav-link" href="">리뷰게시판</a>
          </li>
          
         <li class="nav-item">
         <c:choose>
          	  <c:when test="${id eq 'system'}"></c:when>
          	  <c:when test="${empty id }"></c:when>
            <c:otherwise> <a class="nav-link" href="shoppingcart?user_id=${id}">장바구니</a></c:otherwise>
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

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

      
        <div class="list-group">
          <h1 class="my-4">Category</h1>
          <a href="notebookproduct?product_category_no=notebook" class="list-group-item">노트북</a>
          <a href="notebookproduct?product_category_no=computer" class="list-group-item">컴퓨터</a>
          <a href="notebookproduct?product_category_no=moniter" class="list-group-item">모니터</a>
          <a href="notebookproduct?product_category_no=mouse" class="list-group-item">마우스</a>
          <a href="notebookproduct?product_category_no=speaker" class="list-group-item">스피커</a>
          <a href="notebookproduct?product_category_no=graphiccard" class="list-group-item">그래픽카드</a>
          <a href="notebookproduct?product_category_no=cpu" class="list-group-item">CPU</a>
          <a href="notebookproduct?product_category_no=ram" class="list-group-item">램</a>
          <a href="notebookproduct?product_category_no=mainboard" class="list-group-item">메인보드</a>
          <a href="notebookproduct?product_category_no=hdd" class="list-group-item">하드디스크</a>
          <a href="notebookproduct?product_category_no=sdd" class="list-group-item">SDD</a>
        </div>
      </div>
      <!-- /.col-lg-3 -->

    <div class="col-lg-9">

        <br>

          <div class="row">
		<c:forEach items="${searchView}" var="dto">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="productview?product_name_no=${dto.product_name_no}"><img style="width: 253px; height: 200px;" src="<spring:url value='/imgUpload/'/>${dto.product_thumbnail }" ></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="productview?product_name_no=${dto.product_name_no}">${dto.product_name_title}</a>
                </h4>
        	
               
              </div>
              <div class="card-footer">
            			  <fmt:formatNumber value="${dto.product_name_price}"  /> 원
              </div>
            </div>
          </div>
		</c:forEach>
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  		  <ul class="pagination">
		    <c:if test="${pageMaker.prev}">
		    	<li><a href="searchView${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
		    </c:if> 
			
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		    	<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}"/>>
		    	<a href="searchView${pageMaker.makeSearch(idx)}&product_category_no=${product_category_no}">${idx}</a></li>
		    </c:forEach>
		
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		    	<li><a href="searchView${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
		    </c:if> 
		  </ul>
	  
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