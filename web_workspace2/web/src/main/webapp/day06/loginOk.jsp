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
		String id = request.getParameter("id");
		String pwd = request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo =  dao.searchUser(id, pwd);
		
		if (vo != null) {
			session.setAttribute("vo", vo);
		}
			response.sendRedirect("layout.jsp");
	%>
</body>
</html>