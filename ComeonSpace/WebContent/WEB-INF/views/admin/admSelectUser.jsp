<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, member.model.vo.Member"
	import="member.model.service.*, common.pageInfo.model.vo.PageInfo"%>
<% ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list"); %>
<% PageInfo fPi = (PageInfo) request.getAttribute("fPi");

int fStartPage = fPi.getStartPage();
int fEndPage = fPi.getEndPage();
int fCurrentPage = fPi.getCurrentPage();
int fMaxPage = fPi.getMaxPage();

%>

<!DOCTYPE html>
<html>

<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
#pageDiv {text-align: center;}
</style>

<body>
	<%@ include file="../common/header.jsp"%>
	<!-- font -->
	<div style="font-family: Sans-serif">
		<%@ include file="/WEB-INF/views/admin/admMenubar.jsp"%>
		<!-- Page Content -->
		<div style="margin-left: 15%; margin-right: 100px; padding: 10%">
			<div class="w3-bottombar w3-border-teal" style="text-align: center;">
				<h2>관리자 페이지</h2>
			</div>
			<div>
				<br>
				<h5 style="padding: 1%">
					<b>전체회원관리</b>
				</h5>
				<br>
				<div>
					<form action="<%=request.getContextPath()%>/selectUser.me"
						id="admWithdrawList" method="post">
						<table class="table table-bordered table-sm"
							style="text-align: center;">
							<%
								if (list == null) {
							%>
							<thead class="w3-light-grey">
								<tr>
									<td>NULL ERROR!</td>
								</tr>
							</thead>
							<%
								} else if (list.isEmpty()) {
							%>
							<thead class="w3-light-grey">
								<tr>
									<td>가입된 회원이 없습니다.</td>
								</tr>
							</thead>
							<%
								} else {
							%>
							<thead class="w3-light-grey">
								<tr>
									<th>이름</th>
									<th>이메일</th>
									<th>닉네임</th>
									<th>핸드폰번호</th>
									<th>강제탈퇴</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (Member m : list) {
								%>
								<tr>
									<td><%=m.getUserName()%></td>
									<td><%=m.getUserEmail()%></td>
									<td><%=m.getUserNic()%></td>
									<td><%=m.getUserPhone()%></td>
									<td>
										<%
											if ("admin".equals(m.getUserDiv()) == false) {
										%> <a
										href="<%=request.getContextPath()%>/admDeleteMember.me?userNum=<%=m.getUserNum()%>">강제탈퇴</a>
										<%
											}
										%>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
							<%
								}
							%>
						</table>
					</form>
				</div>
			</div>
			
			<%
				if (!list.isEmpty()) {
			%>
		 			<div class="w3-center w3-bar" >
<!-- 		 			<div class="w3-bar"> -->
					<a href="<%=request.getContextPath()%>/selectUser.me?CurrentPage=1"
						class="btn btn-outline-success">맨처음</a> <a
						href="<%=request.getContextPath()%>/selectUser.me?fCurrentPage=<%=fCurrentPage - 1%>"
						class="btn btn-outline-success" id="beforeBtn">이전</a>
					<script>
						if (
					<%=fCurrentPage%>
						<= 1) {
							$("#beforeBtn").prop("disabled", true);
						};
					</script>
					<!-- 숫자페이지 -->
					<%
						for (int p = fStartPage; p <= fEndPage; p++) {
					%>
					<%
						if (fCurrentPage == p) {
					%>


					<a href="<%=request.getContextPath()%>/selectUser.me?pageNo=<%=p%>"
						class="btn btn-outline"><%=p%></a>
					<%
						} else {
					%>
					<a href="<%=request.getContextPath()%>/selectUser.me?pageNo=<%=p%>"
						class="btn btn-outline-success"><%=p%></a>
					<%
						}
					%>
					<%
						}
					%>
					<a
						href="<%=request.getContextPath()%>/selectUser.me?fCurrentPage=<%=fCurrentPage + 1%>"
						class="btn btn-outline-success" id="afterBtn">다음</a>
					<script>
						if (
					<%=fCurrentPage%>
						
					<%=fMaxPage%>
						) {
							$("#afterBtn").prop("disabled", true);
						}
					</script>
					<a
						href="<%=request.getContextPath()%>/selectUser.me?fCurrentPage=<%=fMaxPage%>"
						class="btn btn-outline-success" id="lastBtn">맨끝</a>
					<script>
						if (
					<%=fCurrentPage%>
						
					<%=fMaxPage%>
						) {
							$("#lastBtn").prop("disabled", true);
						}
					</script>
				<%
					}
				%>
<!-- 				</div> -->
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
	<script></script>
</body>

</html>
