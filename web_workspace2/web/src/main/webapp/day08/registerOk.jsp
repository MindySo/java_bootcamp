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
		
		out.println("id : " + id + "<br>");
		out.println("pw : " + pw + "<br>");
		out.println("name : " + name + "<br>");
		out.println("gender : " + gender + "<br>");
		out.println("motive : " + motive + "<br>");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPwd(pw);
		vo.setName(name);
		vo.setGender(gender);
		vo.setMotive(motive);
		
		dao.insertOne(vo);
		
		out.println("<h1>회원가입 완료.</h1>");
		response.sendRedirect("login.jsp");
	%>
</body>


</html>