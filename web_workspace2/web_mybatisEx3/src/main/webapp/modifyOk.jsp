<%@page import="kr.co.jhta.web.vo.DeptVO"%>
<%@page import="kr.co.jhta.web.dao.DeptDAO"%>
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
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	String d = request.getParameter("deptno");

	if (dname != null && loc != null && d != null) {
		int deptno = Integer.parseInt(d);
		DeptDAO dao = new DeptDAO();
		DeptVO vo = new DeptVO(deptno, dname, loc);

		dao.updateOne(vo);
		response.sendRedirect("list.jsp");
	}
	%>
</body>
</html>