<%@page import="webQuiz.BoardDAO"%>
<%@page import="webQuiz.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<body>
	<%
	//1. 전달 받은 파라미터의 값 가져오기
	String b = request.getParameter("bno");
	BoardVO vo = new BoardVO();

	// 2. bno가 null이 아니면
	if (b != null) {
		// 3. 숫자로 형변환
		int bno = Integer.parseInt(b);
		// 4. dao 객체
		BoardDAO dao = new BoardDAO();
		// 5. dao를 통해서 지정한 게시물을 가져오기
		dao.deleteOne(bno);
	}
		response.sendRedirect("list.jsp");
	%>
</body>
</html>