<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>상세보기</h1>
		<table class="table table-striped">
			<tr>
				<th>작성자</th>
				<td>${vo.writer }</td>
				<th>조회수</th>
				<td>${vo.hits }</a></td>
				<th>작성일자</th>
				<td>${vo.regdate }</a></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="5">${vo.title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="5">${vo.contents }</a></td>
			</tr>
			<tr>
				<td colspan="6">
					<a href="board.do" class="btn btn-primary">목록</a>
					<a href="board.do?cmd=modify&bno=${vo.bno }" class="btn btn-success">수정</a>
					<a href="board.do?cmd=delete&bno=${vo.bno }" class="btn btn-danger">삭제</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>