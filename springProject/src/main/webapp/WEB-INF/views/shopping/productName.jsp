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

 <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/shop-homepage.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	.table {
		margin-left: 50px;
	}
	.button {

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
	.button1 {

    width:100px;

    background-color: #F15F5F;

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

	var	product_name_title =  document.getElementById("product_name_title");
	var	product_stock =  document.getElementById("product_stock");
	var	product_name_price =  document.getElementById("product_name_price");
	var product_name_detail =  document.getElementById("product_name_detail");
	var product_images =  document.getElementById("product_images");
    	
		
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
		}else if (product_images.value == ""){
			alert("상품 이미지을 입력하세요")
			productName.product_images.focus();
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
<h1 style="margin-left: 50px; padding-top: 10px;">상품 등록</h1>

<form name="productName" id="productName" action="SaveProduct" method="post" enctype="multipart/form-data" onsubmit="return product_write()" > 
			<table class="table">
			
			
			<tr>
				<th>상품 카테고리</th>
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
				<th>상품 명</th>
				<td>
				<input type="text" name="product_name_title" id="product_name_title">
				<input type="button" class="conform" id="titleChk" value="중복확인" onclick="titlecheck()">
				</td>
			</tr>
			
			<tr>
				<th>상품 재고</th>
				<td><input type="text" name="product_stock" id="product_stock"></td>
			</tr>
			<tr>
				<th>상품 가격</th>
				<td><input type="text" name="product_name_price" id="product_name_price"></td>
			</tr>
			<tr>
				<th>상품 설명</th>
				<td><textarea rows="5" cols="50" style="resize: none;" name="product_name_detail" id="product_name_detail">
				</textarea></td>
			</tr>
			<tr>
				<th>상품 해쉬태그</th>
				<td><textarea rows="5" cols="50" style="resize: none;" name="product_hashtag" id="product_hashtag">
				</textarea></td>
			</tr>
			
			 <tr>
				<th><label for="product_name_image">상품 이미지</label></th>
				<td><input type="file" name="file" id="product_name_image"></td>
			</tr>
			<tr>
			<th>이미지 미리보기</th>
			<td><div class="select_img"><img src="" /></div></td>
			 </tr>
			<script>
			  $("#product_name_image").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $(".select_img img").attr("src", data.target.result).width(500);        
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
 				</script>
			<tr>
				<td colspan="2">
					<input type="submit" value="상품 등록" class="button">
 					<input type="button" value="취소" onclick="location.href='myPage'" class="button1">				
 				</td>
			</tr>
	</table>
	
   <script>
        function titlecheck() {
            $.ajax({
                url: "titleChk",
                type: "post",
                dataType : "json",
                data : {"product_name_title" : $(product_name_title).val()},
                success: function(data) {
                    if(data==1){
                        alert("중복된 상품명 입니다")
                        $(product_name_title).val("");                        
                    }else if(data==0){
                        alert("사용가능한 상품명 입니다")
                    }
                }
            });
        }
   </script>
 
	</form>
</body>
</html>