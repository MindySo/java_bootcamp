<%@page import="java.util.Arrays"%>
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
		String name = request.getParameter("name");
		String idnum = request.getParameter("idnum1")+"-"+request.getParameter("idnum2");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel1") 
					+ "-" + request.getParameter("tel2") 
					+ "-" + request.getParameter("tel3");
		String address = request.getParameter("address");
		String domain = request.getParameter("domain");
		String email = request.getParameter("email1") + "@" 
						+ (request.getParameter("email2").isEmpty() ? domain : request.getParameter("email2"));
		String gender = request.getParameter("gender");
		String hobby[] = request.getParameterValues("hobby");
		
		out.println("ID : " + id + "<br>");
		out.println("NAME : " + name + "<br>");
		out.println("주민등록번호 : " + idnum + "<br>");
		out.println("비밀번호 : " + pw + "<br>");
		out.println("전화번호 : " + tel + "<br>");
		out.println("주소 : " + address + "<br>");
		out.println("EMAIL : " + email + "<br>");
		out.println("성별 : " + gender + "<br>");
		out.println("취미 : " + Arrays.toString(hobby));
	%>
</body>
</html>