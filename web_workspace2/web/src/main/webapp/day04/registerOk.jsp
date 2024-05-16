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
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String motive = request.getParameter("motive");
		
		MemberDAO dao = new MemberDAO();
		dao.insertUser(id, pw, name, gender, motive);
		
		out.println("<h1>회원가입 완료.</h1>");
	%>
</body>
</html>