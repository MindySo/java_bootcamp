<%@page import="webQuiz.BoardVO"%>
<%@page import="webQuiz.BoardDAO"%>
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
	String b = request.getParameter("bno");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	if (b != null) {
		int bno = Integer.parseInt(b);
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.getOne(bno);

		vo.setWriter(writer);
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setBno(bno);
		
		dao = new BoardDAO();
		dao.updateOne(vo);
	}

	response.sendRedirect("list.jsp");
	%>
</body>
</html>