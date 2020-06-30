<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<style type="text/css">
.button {

    width:80px;

    background-color: #00D8FF;

    border: none;

    color:#fff;

    padding: 15px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;
    
    border-radius:10px;"

}

</style>
<script type="text/javascript">
   function pwdchk(){
      var qa_pwd = document.getElementById('qa_pwd').value;
      var form = document.form;
      console.log(${read.qa_pwd})
      if(qa_pwd==${read.qa_pwd}){
         form.submit();
      }else{
         document.getElementById('qa_pwd').focus;
         document.getElementById('qa_pwd').value = '';
         alert('비밀번호가 일치하지 않습니다.');
      }
   }
   $(document).ready(function(){
      $(".list_btn").on("click", function(){
         location.href = "QnA?page=${scri.page}"
         +"&perPageNum=${scri.perPageNum}"
         +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
         })
      })
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Navigation -->
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




<div>
   <form action="QnApassWord" method="post" name="form">
      이 글은 비밀 글입니다.<br>
      비밀번호를 입력하여 주세요.<br>
      <input type="text" id="qa_pwd"><br>
      <input type="button" value="목록" class="list_btn" style=" width:80px;background-color: #FFBB00; border: none; color:#fff;
      padding: 15px 0;text-align: center;text-decoration: none;display: inline-block;font-size: 15px;margin: 4px;cursor: pointer;
      border-radius:10px;"> 
      <input type="button" value="확인" onclick="pwdchk()" class="button">
      <input type="hidden" name="qa_seq" value="${read.qa_seq}">
      <input type="hidden" id="page" name="page" value="${scri.page}"> 
      <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
      <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
      <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
   </form>
</div>
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