<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main_2024_04_23.css" />
</head>
<body>
	<%
	String fname = "";
	String fno = request.getParameter("fno");
	out.println(fno);
	if (fno == null) {
		fname = "news.jsp";
	} else {
		fname = fno + ".jsp";
	}

	String id = request.getParameter("id");
	String pwd = request.getParameter("pw");

	MemberDAO dao = new MemberDAO();
	MemberVO vo = dao.searchUser(id, pwd);
	String sbstate = "";
	%>
	
	
	<div id="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="nav.jsp" />
		<jsp:include page="<%=fname%>" />
		<jsp:include page="sidebar.jsp" />
		<jsp:include page="footer.jsp" />

	</div>
</body>
</html>