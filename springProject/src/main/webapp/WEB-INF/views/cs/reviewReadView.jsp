<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>

  <!-- Bootstrap core CSS -->
  <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>게시판</title>
</head>
<script type="text/javascript">
   $(document).ready(function(){
      var formObj = $("form[name='readForm']");
      
      // 수정 
      $(".update_btn").on("click", function(){
         formObj.attr("action", "reviewUpdateView");
         formObj.attr("method", "get");
         formObj.submit();            
      })
      
      // 삭제
      $(".delete_btn").on("click", function(){
         formObj.attr("action", "reviewDelete");
         formObj.attr("method", "post");
         formObj.submit();
      })
      
      // 취소
      $(".list_btn").on("click", function(){
         location.href = "reviewPage?page=${scri.page}"
         +"&perPageNum=${scri.perPageNum}";
      })
      
      //수정 버튼을 클릭했을 때 url주소가 게시판
      //qa_seq, page, perPageNum, searchType, keyword 그리고 댓글번호인 rno가 들어가 있는것이 보입니다. 
      //여기서 $(this).attr("data-qa_reply_seq")는 클릭 이벤트가 발생한 수정 버튼의 data-qa_reply_seq값을 가져오겠다는 말이에요.
   })
</script>
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
      
      
      
      
      <!-- view단 -->
      <h1 style="text-align: center; padding-top: 30px;">리뷰게시판 조회</h1>
      <form name="readForm" role="form" method="post">
         <input type="hidden" id="review_seq" name="review_seq" value="${read.review_seq}" />
         <input type="hidden" id="page" name="page" value="${scri.page}"> 
         <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
      </form>
      
      <table class="table" style="margin-top: 30px;">
         <tr>
            <th style=" text-align: center; width: 200px;">글 번호</th>
            <td><input type="text" id="review_seq" name="review_seq" value="${read.review_seq}" readonly="readonly" style="margin-left: 15px;"/></td>
         </tr>
         <tr>
            <th style="text-align: center;">리뷰점수</th>
            <td><input type="text" id="review_score" name="review_score" value="${read.review_score}" readonly="readonly" style="margin-left: 15px;"/></td>
         </tr>
         <tr>
            <th style="text-align: center;">제목</th>
            <td><input type="text" id="review_subject" name="review_subject" value="${read.review_subject}" readonly="readonly" style="margin-left: 15px;"/></td>
         </tr>
         <tr>
            <th style="text-align: center;">상품이름</th>
            <td><input type="text" id="review_product_title" name="review_product_title" value="${read.review_product_title}" readonly="readonly" style="margin-left: 15px;"/></td>
         </tr>
         <tr>
            <th style="text-align: center;">제품이미지</th>
           <td> <img style="width: 100px; height: 100px;" id="review_product_image" name="review_product_image" 
            src="<spring:url value='/imgUpload/'/>${read.review_product_image}" style="margin-left: 15px;">
            </td>
         </tr>
         <tr>
            <th style="text-align: center;">내용</th>
            <td><div class="col-sm-8">
                  <textarea id="review_content" name="review_content" readonly="readonly" 
                  rows="10" cols="100" style="resize: none"><c:out value="${read.review_content}" /></textarea>
               </div>
            </td>
         </tr>
         <tr>
         	<th>
         		리뷰이미지
         	</th>
         	<td>
         		<img style="width: 350px; height: 200px;" id="review_product_image" name="review_product_image" 
            src="<spring:url value='/imgUpload/'/>${read.review_image}" style="margin-left: 15px;">
         	</td>
         </tr>
         <tr>
            <th style="text-align: center;">작성자</th>
            <td><input type="text" id="review_user_id" name="review_user_id" value="${read.review_user_id}" readonly="readonly" style="margin-left: 15px;"/></td>
         </tr>
         <tr>
            <th style="text-align: center;">작성날짜</th>
            <td><fmt:formatDate value="${read.review_logtime}" pattern="yyyy-MM-dd" /></td>
         </tr>
      </table>   
            
               <div style="text-align: center;">
               <c:choose>
               <c:when test="${id eq 'system' }">
               <button type="submit" class="update_btn btn btn-default">수정</button>
               <button type="submit" class="list_btn btn btn-default">목록</button>   
                  <button type="submit" class="delete_btn btn btn-warning">삭제</button>
               </c:when>
               <c:otherwise><button type="submit" class="update_btn btn btn-default">수정</button>
               <button type="submit" class="list_btn btn btn-default">목록</button>   
               <button type="submit" class="delete_btn btn btn-warning">삭제</button>
               </c:otherwise>
               </c:choose>
               </div>
   
   
            
            
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