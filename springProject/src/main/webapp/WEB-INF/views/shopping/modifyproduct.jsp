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
    <!-- Bootstrap core CSS -->
  <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
.button2 {

    width:100px;

    background-color: #f8585b;

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
.button3 {

    width:100px;

    background-color: #5CD1E5;

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
<script >
function product_write() {
	var product_name_no = document.getElementById("product_name_no");
	var	product_name_title =  document.getElementById("product_name_title");
	var	product_stock =  document.getElementById("product_stock");
	var	product_name_price =  document.getElementById("product_name_price");
	var product_name_detail =  document.getElementById("product_name_detail");

    	
		if(product_name_title.value == "") {
			alert("상품명을 입력하세요")
			productName.product_name_title.focus();
			return false;
		}else if (product_stock.value == ""){
			alert("재고량 을 입력하세요")
			productName.product_stock.focus();
			return false;
		}else if (product_name_price.value == ""){
			alert("상품 가격을 입력하세요")
			productName.product_name_price.focus();
			return false;
		}else if (product_name_detail.value == ""){
			alert("상품 설명을 입력하세요")
			productName.product_name_detail.focus();
			return false;
		}else{
			return true;
		}
    }
</script>

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
<h1 style="text-align:center; padding-top:30px;">상품 수정</h1>

<form name="productName" id="productName" action="ModifySaveProduct" method="post" enctype="multipart/form-data" onsubmit="return product_write()" > 
			<table class="table" style="margin-top:30px;">
			  <tr>
				<th style="text-align:center;">상품 고유번호</th>
				<td><input type="text" name="product_name_no" id="product_name_no" value="${modifylist.product_name_no}" readonly></td>
			 </tr>
			<tr>
				<th style="text-align:center;">상품 카테고리</th>
				<td>
				<select name="product_category_no" id="product_category_no">
    			<option value="notebook">노트북</option>
    			<option value="computer">컴퓨터</option>
   				<option value="moniter">모니터</option>
   				<option value="mouse">마우스</option>
   				<option value="speaker">스피커</option>
   				<option value="graphiccard">그래픽카드</option>
   				<option value="cpu">CPU</option>
   				<option value="mainboard">메인보드</option>
   				<option value="hdd">하드디스크</option>
   				<option value="sdd">SDD</option>
   				<option value="ram">RAM</option>
				</select>
				</td>
			</tr>
			<tr>
				<th style="text-align:center;">상품명</th>
				<td><input type="text" name="product_name_title" id="product_name_title" value="${modifylist.product_name_title}"></td>
			</tr>
			
			<tr>
				<th style="text-align:center;">상품재고</th>
				<td><input type="text" name="product_stock" id="product_stock"  value="${modifylist.product_stock}"></td>
			</tr>
			<tr>
				<th style="text-align:center;">상품가격</th>
				<td><input type="text" name="product_name_price" id="product_name_price"  value="${modifylist.product_name_price}"></td>
			</tr>
			<tr>
				<th style="text-align:center;">상품설명</th>
				<td><textarea rows="5" cols="50" style="resize: none;" name="product_name_detail" id="product_name_detail"  value="${modifylist.product_name_detail}">
				</textarea></td>
			</tr>
			<tr>
				<th style="text-align:center;">상품 해쉬태그</th>
				<td><textarea rows="5" cols="50" style="resize: none;" name="product_hashtag" id="product_hashtag" value="${modifylist.product_hashtag}">
				</textarea></td>
			</tr>
			
			 <tr>
				<th style="text-align:center;"><label for="product_name_image">상품 이미지</label></th>
				<td><input type="file" name="file" id="product_name_image"></td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" value="상품 수정" class="button2" >
 					<input type="button" value="취소" onclick="history.go(-1)" class="button3" >				
 				</td>
			</tr>
	</table>
	</form>
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