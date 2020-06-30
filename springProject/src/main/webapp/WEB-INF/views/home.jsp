<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.care.DTO.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
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
      <a class="navbar-brand" href="home">KG SHOP</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="search row">
		<div class="col-xs-4 col-sm-4">
		    <select name="searchType" class="form-control">
		      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
		      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>상품명</option>
		      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>해시태그</option>
		      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>상품명+해시태그</option>
		    </select>
		</div>
		<div class="col-xs-8 col-sm-8">
			<div class="input-group">
		    	<input class="form-control" type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
		    	<span class="input-group-btn">
		    		<button class="btn btn-info" id="searchBtn" type="button">검색</button>
		    	</span>
			</div>
		</div>
		    	
	    <script>
	      $(function(){
	        $('#searchBtn').click(function() {
	          self.location = "searchView?" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	        });
	      });   
	    </script>
	 </div>
      
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
          <c:choose>
              <c:when test="${empty id }"> <a class="nav-link" href="home">홈
              <span class="sr-only">(current)</span>
              </a></c:when>
               <c:when test="${id eq id}"><a class="nav-link" >${id }님 환영합니다 
              <span class="sr-only">(current)</span>
              </a>
              </c:when>             
          </c:choose>
           
            
          </li>
          <li class="nav-item">
            <a class="nav-link" href="QnA">Q&A</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="reviewPage">리뷰</a>
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

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">Category</h1>
        <div class="list-group">
         <a href="notebookproduct?product_category_no=notebook" class="list-group-item">노트북</a>
          <a href="notebookproduct?product_category_no=computer" class="list-group-item">컴퓨터</a>
          <a href="notebookproduct?product_category_no=moniter" class="list-group-item">모니터</a>
          <a href="notebookproduct?product_category_no=mouse" class="list-group-item">마우스</a>
          <a href="notebookproduct?product_category_no=speaker" class="list-group-item">스피커</a>
          <a href="notebookproduct?product_category_no=graphiccard" class="list-group-item">그래픽카드</a>
          <a href="notebookproduct?product_category_no=cpu" class="list-group-item">CPU</a>
          <a href="notebookproductt?product_category_no=ram" class="list-group-item">램</a>
          <a href="notebookproduct?product_category_no=mainboard" class="list-group-item">메인보드</a>
          <a href="notebookproduct?product_category_no=hdd" class="list-group-item">하드디스크</a>
          <a href="notebookproduct?product_category_no=sdd" class="list-group-item">SDD</a>
        </div>

      </div>
     <!-- /.col-lg-3 -->
      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
        
          <ol class="carousel-indicators">
          
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
            <img class="d-block img-fluid" width=900px,height=300px src="<spring:url value='/imgUpload/'/>${banner[0].banner_image}" alt="First slide">
             
            </div>
            <div class="carousel-item">
               <img class="d-block img-fluid" width=900px,height=300px src="<spring:url value='/imgUpload/'/>${banner[1].banner_image}" alt="Second slide">
             
            </div>
            <div class="carousel-item">
               <img class="d-block img-fluid" width=900px,height=300px src="<spring:url value='/imgUpload/'/>${banner[2].banner_image}" alt="Third slide">
      
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        <div><h2>BEST30</h2></div>
        <div class="row">
		<c:forEach items="${bestView}" var="dto">
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
 <script type="text/javascript">
 function init() {
       var val = localStorage.getItem('naverId');
      document.querySelector("#naverresult").innerHTML = val;
   }
   
</script>
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