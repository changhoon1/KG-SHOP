<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

function pay(){
	var form = document.form;
	var count = document.getElementById("count").value;
	
	
	document.getElementById("product_count").value=count;
	
	form.submit();
}

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
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
.table {
 
}


.button1 {

    width:250px;

    background-color: #5CD1E5;

    border: none;

    color:#fff;

    padding: 8px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 50px;

    cursor: pointer;
    
    border-radius:10px;

}
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
.button4 {

    width:100px;

    background-color: #FFBB00;

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
.button5 {

    width:250px;

    background-color:  #f8585b;

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
  
 <form name="view" id="view" method="post"  role="form" action="SaveshoppingCart">
<table class="table">
	<tr>
		<td style="text-align: center;" rowspan="4">
		<img style="width: 295px; height: 250px;"
			src="<spring:url value='/imgUpload/'/>${productlist.product_name_image }" >
		</td>
		<td style="padding-top: 50px;"><font size="6px">상품명 &nbsp;&nbsp;&nbsp;${productlist.product_name_title}</font></td>
		
	</tr>
	<tr>
	<td ><font >상품가격 &nbsp;&nbsp;&nbsp;<fmt:formatNumber
				value="${productlist.product_name_price}" pattern="###,###,###" />원
		</font> </td>
	
	</tr>
	<tr>
		<td ><button type="button" class="minus"  style="border:none; background:none;">-</button>
수량 : <input id="count" type="number" class="numBox" name="product_count" min="1"  value="1" readonly="readonly"
			style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: center;"/>
  		<button type="button" class="plus"  style=" border:none; background:none;">+</button></td>
		
	</tr>
	<tr>
		<td>총 금액 : <input type="number" class="sumprice"  readonly="readonly"  value="${productlist.product_name_price}"
		style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align: center;"/> 원</td>
		
	</tr>
	<tr>
		<td style="text-align: center;"><c:choose>
         <c:when test="${id eq 'system'}">
            <a href="modifyproduct?product_name_no=${productlist.product_name_no}"><input type="button" class="button3" value="상품수정"></a>
            <a href="deleteproduct?product_name_no=${productlist.product_name_no}"><input type="button" class="button2" value="상품삭제"></a>
         </c:when>
         <c:when test="${empty id}"> </c:when>
         <c:otherwise>         
         </c:otherwise>
      </c:choose></td>
		<td><div class="section2">
 		 <input type="button" value="장바구니담기" class="button5" onclick="cartChk()" >
 		</div></td>
	</tr>
</table>

 
  <input type="hidden" name="product_name_image" value="${productlist.product_name_image }">
  <input type="hidden" name="product_name_title" value="${productlist.product_name_title}">
  <input type="hidden" name="product_name_price" value="${productlist.product_name_price}">
  
  
   <script>
        function cartChk() {
            
            $.ajax({
                url: "cartChk",
                type: "post",
                dataType : "json",
                data : {"product_name_title" :"${productlist.product_name_title}"},
                success: function(data) {
                    if(data==1){
                        alert("이미 담겨진 상품 입니다")                    
                    }else if(data==0){
                        alert("장바구니에 상품이 정상적으로 등록되었습니다")
                        document.view.submit();
                    }
                }
            });
        }
   </script>
   
 <script>
  $(".plus").click(function(){
   var num = $(".numBox").val();
   var plusNum = Number(num) + 1;
   
   if(plusNum > "${productlist.product_stock}") {
    $(".numBox").val(num);
    alert('최대수량 입니다');
    $(".sumprice").val("${productlist.product_stock}"*"${productlist.product_name_price}");
   } else {
    $(".numBox").val(plusNum);
    $(".sumprice").val(plusNum*"${productlist.product_name_price}");
   }
	
  });
  
  $(".minus").click(function(){
   var num = $(".numBox").val();
   var minusNum = Number(num) - 1;
   $(".sumprice").val(minusNum*"${productlist.product_name_price}");

   if(minusNum <= 0) {
    $(".numBox").val(num);
    alert('최소수량은 1개 입니다');
    $(".sumprice").val("${productlist.product_name_price}");
 
   } else {
    $(".numBox").val(minusNum);   
   
   }

  });
 
 </script>  
 </form>
 <form name="form" action="orderview">
 <table  class="table" >
 	<tr>	
 		<td style="text-align: center; padding-left: 313px;">	
 		<input type="hidden" name="product_name_title" value="${productlist.product_name_title}">
 				<input type="hidden" name="product_count" value="" id="product_count">
 				<input type="button" value="결제하기"  class="button1" onclick="pay()"></td>
 	</tr>
 </table>
 </form>
 <table class="table">
 	<tr>
 		<td style="text-align: center;"> 제품 설명 : ${productlist.product_name_detail}</td>
 	</tr>
 	<tr>
 		<td style="text-align: center;"><input type="button" onclick="history.back()" value="목록으로" class="button4"></td>
 	</tr>
 </table>
<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>
<script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 

      
       
</body>
</html>