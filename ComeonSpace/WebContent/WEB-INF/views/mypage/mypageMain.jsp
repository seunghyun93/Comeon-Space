<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, img.model.vo.Img"%>
<%
	Img img = (Img)request.getAttribute("img");
%>
<!DOCTYPE html>
<html lang="en">

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
    
</head>
<style>
	.myP-main{
		border-bottom: 3px solid green;
		text-align: center;
		padding-bottom: 10px; 
	}
	.list-text{
		font-size: 13px !important;
	}
	.h-inline{display:inline-block;}
	.mypage-profile{display:inline-block;}
	
</style>
<header>
    <%@ include file="../common/header.jsp" %>
</header>
<body>
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">
			<!-- 메뉴바 시작 -->
            <%@include file="menubar.jsp" %>
			<!-- 메뉴바 끝 -->
            <div class="col-lg-9">
                <div class="myP-main h2">
                    	마이페이지
                </div>
                <br>
                <div class="row">
					<div id="mypageProfileImg">
						<%if(img != null){ %>
							<img class="mypage-profile" src="<%= request.getContextPath()%>/img_upload/<%= img.getImgChange() %>" width="200px;" height="150px;">
						<%} else { %>
							<img class="mypage-profile" src="<%= request.getContextPath()%>/resources/image/defaultProfile.png" width="200px;" height="150px;">
						<%} %>
						<h2 class="h-inline"><%= loginUser.getUserName() %></h2> <h4 class="h-inline">님,</h4>
						<h4 class="h-inline">반갑습니다.</h4>
					</div>
					<div>
						<br>
						<br>
						<hr>
						<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					</div>
                </div>
                
            </div>

        </div>
    </div>
</body>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>

</html>