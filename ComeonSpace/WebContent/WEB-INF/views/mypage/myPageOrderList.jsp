<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, order.model.vo.Order, common.pageInfo.model.vo.PageInfo"%>
<%
	ArrayList<Order> list = (ArrayList)request.getAttribute("list");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int noStartPage = pi.getStartPage();
	int noEndPage = pi.getEndPage();
	int noCurrentPage = pi.getCurrentPage();
	int noMaxPage = pi.getMaxPage();
%>    
<!DOCTYPE html>
<html lang="en">

<head>
    <title>구매 내역 - 예약 현황</title>
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
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
	
</head>
<style>
	.myP-main{
		padding-bottom: 10px;
		text-align: center; 
	}
	.list-text{
		font-size: 13px !important;
	}

	
	.hh-content{
    	line-height:110px;
    }
    
    .hh-content2{
    	line-height:60px;
    }
    
    .mytable-color{
    	background-color: #EAEAEA !important;
    }
	
	.intro-font {
		font-weight:bold;
		font-size: 75%;
		position: relative;
		top: 10px;
	}
	
	
	.intro-font1 {
		font-weight:bold;
		font-size: 75%;
	}
	
	.intro-font2 {
		position: relative;
		font-size: 75%;
		top: 10px;
	}
	
	.intro-font-count{
		font-size: 100%;
		color: #0f6756;
	}
	
	.checkbox-select{
		zoom: 2;
		
	}
	
	#select-delete{
		position: relative;
		bottom: 10px;
	}
	
	.review-Write {
		position: relative;
		top: 10px;
		right: 2px;
	}
	
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
					<div class="container">
						<br>
						<hr><br>
						    <div class="row">
						        <div class="intro-name col-sm-5"><span style="color:#0f6756; font-weight:bold; font-size:120%; "><%= loginUser.getUserNic() %></span><span class="intro-font1"> 님<br>안녕하세요!</span></div>
						        <div class="intro-before col-sm-2"><span class="intro-font">이용 전</span><br><span class="intro-font intro-font-count">N</span><span class="intro-font2"> 개</span></div>
						        <div class="intro-after col-sm-2"><span class="intro-font">이용 완료</span><br><span class="intro-font intro-font-count">N</span><span class="intro-font2"> 개</span></div>
						        <div class="intro-review col-sm-2"><span class="intro-font">구매 후기</span><br><span class="intro-font intro-font-count">N</span><span class="intro-font2"> 개</span></div>
						    </div>
						<br><hr>
						<br><br><br>
						<h5>예약 현황 전체 보기</h5>
						<br>
					</div>
                </div>
                
                
					<div class="container">
						<form name="체크박스" action="#">
						  <table class="table box" id="tableArea">
						    <thead class="thead-light mytable-color">
						      <tr>
						        <th>no</th>
						        <th>구매 일자</th>
						        <th>구매 상품 정보</th>
						        <th>결제 금액</th>
						        <th>진행 상태</th>
						      </tr>
						    </thead>
						    <tbody>

							<% if(list.isEmpty()) { %>
							<tr>
								<td colspan="5">존재하는 결제 내역이 없습니다.</td>
							</tr>
							<% } else { %>
							<% 		for(Order or : list) { %>
						      <tr>
								<td class="hh-content"><%= or.getOrderNum() %></td>
						        <td class="hh-content"><%= or.getOrderDate() %></td>
						        <td>
						        	<br>
						        	<p style="color: #0f6756; font-size: 125%; font-weight: bold; cursor: pointer;" class="proName"><%= or.getProdName() %></p>
						            <p><%= or.getRevDate() %></p>
						        </td>
						        <td class="hh-content"><b><%= or.getTotalPrice() %></b> 원</td>
						        <td>   
						        	<br>
						        	이용 완료<br>
						        	<button type="button" class="btn btn-success btn-sm review-Write">후기 쓰기</button>
						        </td>
						      </tr>
						    <% 		} %>
						    <%	} %>  
						      
						    </tbody>
						  </table>
						 </form>
						 <br>
						 						  <!-- 페이징 시작 -->
							<div id="pageDiv" style="position: relative; left: 240px;">
								<!-- 맨 처음으로 -->
								<button onclick="location.href='<%=request.getContextPath()%>/orderList.my?currentPage=1'" class="btn btn-outline-success">맨처음</button>
								<!-- 이전 페이지 -->
								<button onclick="location.href='<%=request.getContextPath() %>/orderList.my?currentPage=<%=noCurrentPage - 1%>'" id="beforeBtn" class="btn btn-outline-success">이전</button>
								<script>
									if(<%=noCurrentPage%> <= 1){
										$("#beforeBtn").prop("disabled",true);
									};
								</script>
								<!-- 숫자 페이지 -->
								<%for(int p = noStartPage; p <= noEndPage; p++){ %>
									<%if(noCurrentPage == p){ %>
										<button disabled><%=p %></button>
									<%} else { %>
										<button onclick="location.href='<%=request.getContextPath()%>/orderList.my?currentPage=<%=p%>'" class="btn btn-outline-success"><%= p %></button>
									<%} %>
								<%} %>
								<!-- 다음 페이지 -->
								<button onclick="location.href='<%=request.getContextPath()%>/orderList.my?currentPage=<%=noCurrentPage + 1%>'" id="afterBtn" class="btn btn-outline-success">다음</button>
								<script>
						         	if(<%=noCurrentPage%> >= <%=noMaxPage%>){
						         		$("#afterBtn").prop("disabled",true);
						         	}
						         </script>
								<!-- 맨끝 으로 -->
								<button onclick="location.href='<%=request.getContextPath() %>/orderList.my?currentPage=<%=noMaxPage %>'" id="lastBtn"class="btn btn-outline-success">맨끝</button>
								<script>
						         	if(<%=noCurrentPage%> >= <%=noMaxPage%>){
						         		$("#lastBtn").prop("disabled",true);
						         	}
						         </script>
							</div>
							<!-- 페이징 끝 -->
					<br>
					</div>

            </div>
        </div>
    </div>



    <!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->
    
    <script>
    
    
 	$("#tableArea button[type=button]").on("click",function(){
 		var num = $(this).parent().parent().children('td').eq(0).text();
 		location.href="<%=request.getContextPath()%>/writeReview.my?no="+num;
 	});
 	
 	
	$(".proName").on("click",function(){
		var num = $(this).parent().parent().children('td').eq(0).text();
		location.href="<%= request.getContextPath()%>/orderDetail.my?no="+num;
	});
	
    </script>
    
</body>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</html>