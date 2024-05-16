<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
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
	// hello.jsp?txt=aaa
	String txt = request.getParameter("txt");

	if (txt != null) {
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getOne(txt);
		out.println("<h2>" + vo.getName() + "</h2>");
	}
	%>
</body>
</html>