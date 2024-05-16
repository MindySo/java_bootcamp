<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// 로그인 정보가 존재하는지 확인
	Object obj = session.getAttribute("vo");
	MemberVO vo = (MemberVO) obj;
	if (vo.getId().equals("admin")) {
	%>

	<div>
		<%=vo.getName()%>님 환영합니다.
	</div>
	<a href="productReg.jsp"><input type="button" value="상품등록"></a>
	<div>
		<strong>광고부분입니다.</strong>
	</div>

	<%
	} else if (obj != null) {
	%>
	
	<div>
		<%=vo.getName()%>님 환영합니다.
	</div>
	<a href="logout.jsp"><input type="button" value="로그아웃"></a>
	<div>
		<strong>광고부분입니다.</strong>
	</div>

	<%
	}
	%>
</body>
</html>