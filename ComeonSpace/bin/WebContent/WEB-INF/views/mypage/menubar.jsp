<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Zay Shop - Product Listing Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
<style>
	.list-text{
		font-size: 13px !important;
		padding-left: 20px;
	}
	.list-text:hover{cursor: pointer; border-bottom: 1px solid black;}
</style>
</head>
<body>
	<div class="col-lg-3">
         <h1 class="h3 pb-4">마이페이지</h1>
         <ul class="list-unstyled templatemo-accordion">
             <li class="pb-3">
                 <a class="collapsed d-flex justify-content-between text-decoration-none" href="#" id="editInfoBtn">
                     	개인정보수정
                 </a>
             </li>
             <li class="pb-3">
                 <a class="collapsed d-flex justify-content-between text-decoration-none" href="#" id="qnaListBtn">
                     	나의 문의내역
                 </a>
             </li>
             <li class="pb-3">
                 <a class="collapsed d-flex justify-content-between text-decoration-none" href="#">
                     	판매내역
                     <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                 </a>
                 <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                     <li><a class="text-decoration-none list-text" href="#">예약현황</a></li>
                     <li><a class="text-decoration-none list-text" href="#">작성된 후기</a></li>
                     <li><a class="text-decoration-none list-text" href="#">결제내역</a></li>
                 </ul>
             </li>
             <li class="pb-3">
                 <a class="collapsed d-flex justify-content-between text-decoration-none" href="#">
                     	구매내역
                     <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                 </a>
                 <ul id="collapseThree" class="collapse list-unstyled pl-3">
                     <li><a class="text-decoration-none list-text" href="#">예약현황</a></li>
                     <li><a class="text-decoration-none list-text" href="#">후기</a></li>
                 </ul>
             </li>
         </ul>
     </div>
     <script>
     	$("#editInfoBtn").on("click",function(){
     		location.href="<%=request.getContextPath()%>/editInfo.my";
     	})
     	$("#qnaListBtn").on("click",function(){
     		location.href="<%=request.getContextPath()%>/qnaList.my";
     	})
     </script>
</body>
</html>