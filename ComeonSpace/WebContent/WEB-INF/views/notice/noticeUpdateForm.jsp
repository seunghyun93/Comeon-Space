<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int num = (Integer)request.getAttribute("num");
	String title = (String)request.getAttribute("title");
	String content = (String)request.getAttribute("content");

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>공지사항 수정 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    
</head>
<style>
	*{font-family: 'Jua', sans-serif !important;}
	.center-sideList{display: inline-block; width: 15%;}
	.center-sideList>ul{list-style-type:none;}
	.sideList-top{
		font-size: 35px;
		margin-top: 20px;
		margin-bottom: 10px;
		display:inline-block;
	}
	.sideList{
		width: 100px;
		border-bottom: 1px solid black;
		display: inline-block;		
		margin-bottom: 12px;
		cursor: pointer;
	}
	.center-content{
		display: inline-block;
		margin-left: 60px;
		margin-top: 20px;
		margin-bottom: 20px;
		background: #EFF4F8;
	}
	.question-table th{
		padding: 10px;
	}
	#table-button{
		text-align: center;
		padding-top: 60px;
	}
	#submit-button{
		margin-right: 25px;
	}
	.center-align{float:left;}
	#center-qTitle{
		margin-top: 20px;
		display: inline-block;
	
	}
	.center-vertical{
		vertical-align: middle;
		width: 75%;
		margin-left: 60px;
		
	}
	.question-button{
		box-shadow: 1px 1px 1px black;
	}
	.main-div{border-bottom: 2px solid green;}
	.section-div{padding-top: 1rem; padding-bottom: 1rem;}
	
</style>

<body>
	<%@ include file="../common/header.jsp" %>
    <section class="section-div">
        <div class="container">
            <div class="row">
                <div class="text-black main-div">
                    <h1 style="text-align: center">고객 센터</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- Close Banner -->

    <!-- Start Section -->
    <section class="container center">
       <div class="center-sideList center-align">
       		<span class="sideList-top">고객센터</span><br>
       		<span class="sideList"><a>문의하기</a></span><br>
       		<span class="sideList"><a>공지사항</a></span><br>
       		<span class="sideList"><a>FAQ</a></span><br>
       		<span class="sideList"><a>내 질문</a></span><br>
       		<span class="sideList"><a>회원탈퇴</a></span>
       </div>
       <div class="center-align center-vertical" id="center-qTitle">
       		<h2>공지사항 수정하기</h2>
			<br>
       		<span>고객님들에게 알릴 소식을 적어주세요.</span><br>
       		<span>고객을 위하는 Comeone Space</span>
       </div>
       <div class="center-content center-align center-vertical">
       		<form action="<%= request.getContextPath()%>/updateNotice.no" name="noInsertForm">
       			<br>
	       		<table class="question-table">
	       			<tr>
	       				<th>제목</th>
	       				<td>
	       					<input type="text" name="title" size='30' placeholder="제목을 입력해주세요" value="<%= title%>">
	       					<input type="hidden" name="number" value="<%= num %>">	       				
	       				</td>
	       			</tr>
	       			<tr>
	       				<th>공지 유형</th>
	       				<td>
	       					<select name="noDiv" required>
		       					<option>공지 유형</option>
		       					<option value="전체">전체</option>
		       					<option value="게스트">게스트</option>
		       					<option value="호스트">호스트</option>
	       					</select>
	       				</td>
	       			</tr>
	       			<tr>
	       				<th>내용</th>
	       				<td>
	       					<textarea cols="60" rows="15" name="content" placeholder="내용을 입력해주세요"><%= content %></textarea>
	       				</td>
	       			</tr>
	       			<tr>
	       				<th>사진 첨부</th>
	       				<td><input type="file" name="noImg" value="파일 첨부" multiple></td>
	       			</tr>
	       			<tr>
	       				<td></td>
	       				<td id="table-button">
	       					<input type="submit" class="btn btn-success text-white btn-block rounded-2 question-button" id="submit-button" value="수정하기">
							<input type="button" class="btn btn-success text-white btn-block rounded-2 question-button" onclick="location.href='javascript:history.go(-1)'" value="취소">	       				
	       				</td>
	       			</tr>
	       		</table>
	       		
	       	</form>  
       </div>
       <%@ include file="../common/footer.jsp" %>
    </section>
</body>

</html>