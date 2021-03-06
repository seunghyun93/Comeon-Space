<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, qna.model.vo.Qna"%>
<%
	ArrayList<Qna> hostList = (ArrayList)request.getAttribute("hostList");
	ArrayList<Qna> userList = (ArrayList)request.getAttribute("userList");
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
	#noQnaTd{text-align: center;}
	
</style>
<header>
    <%@ include file="../common/header.jsp" %>
</header>
<body>
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">
			<!-- 메뉴바 시작 -->
            <%@include file="menubar.jsp"%>
			<!-- 메뉴바 끝 -->
            <div class="col-lg-9">
                <div class="myP-main h2">
                    	마이페이지
                </div>
                <br>
                <div class="row">
					<div id="mypageProfileImg">
						<table class="table" id="tableArea">
							<tr>
								<th width="5%;">번호</th>
								<th width="15%;">작성자</th>
								<th width="20%;">공간명</th>
								<th width="40%;">내용</th>
								<th width="10%;">작성날짜</th>
								<th width="20%;">비고</th>
							</tr>
							<%if(loginUser.getUserDiv().equals("guest")){ %>
								<%if(userList.isEmpty()){ %>
									<tr>
										<td colspan="4" id="noQnaTd">등록된 Q&A가 없습니다.</td>
									</tr>
								<%} else { %>
									<%for(Qna q : userList){ %>
										<tr>
											<td><%=q.getQnaNum() %></td>
											<td><%=q.getUserNick() %></td>
											<td><%=q.getpName() %></td>
											<td><%=q.getQnaContent() %></td>
											<td><%=q.getQnaDate() %></td>
											<td>
												<%if(q.getQnaAnswer() == null){ %>
													답변대기
												<%} else {%>
													<input type="button" value="답변보기" class="ansBtn">
												<%} %>
											</td>
										</tr>
									<%} %>
								<%} %>
							<%} else {%>
								<%if(hostList.isEmpty()){ %>
									<tr>
										<td colspan="4" id="noQnaTd">등록된 Q&A가 없습니다.</td>
									</tr>
								<%} else { %>
									<%for(Qna q : hostList){ %>
										<tr>
											<td><%=q.getQnaNum() %></td>
											<td><%=q.getUserNick() %></td>
											<td><%=q.getpName() %></td>
											<td><%=q.getQnaContent() %></td>
											<td><%=q.getQnaDate() %></td>
											<td><input type="button" value="답변하기" class="ansBtn"></td>
										</tr>
									<%} %>
								<%} %>
							<%} %>
						</table>
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
    <script>
	    $("#tableArea input").on("click",function(){
			var num = $(this).parent().parent().children().eq(0).text();
			location.href="<%= request.getContextPath()%>/qnaDetail.my?no="+num;
		})
    </script>
</body>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>

</html>