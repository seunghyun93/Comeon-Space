<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		location.href="<%=request.getContextPath()%>/mainView.mv";
	})
</script>
<%-- 	<%@ include file="WEB-INF/views/common/header.jsp" %> --%>

<%-- 	<%@ include file="WEB-INF/views/common/home.jsp" %> --%>
	
<%-- 	<%@ include file="WEB-INF/views/common/footer.jsp" %> --%>
</body>
</html>