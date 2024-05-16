<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".summernote").summernote({
			height : 150,
			lang : "ko-KR"
		});
	})
</script>
</head>
<body>
	<div class="container">
		<form action="board.do" method="get">
			<h2>수정하기</h2>
			<table class="table table-striped">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" id="" value="${vo.writer }" /></td>
					<th>조회수</th>
					<td>${vo.hits }</td>
					<th>작성일자</th>
					<td>
					${vo.regdate}
					<input type="hidden" name="bno" value="${vo.bno}"/>
					<input type="hidden" name="cmd" value="modifyOk"/>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="5"><input type="text" name="title"
						value="${vo.title }" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="5">
					<textarea class="summernote" name="contents" id="" cols="30" rows="10">${vo.contents }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="board.do" class="btn btn-success">목록</a>
						<input class="btn btn-primary" type="submit" value="작성" />
						<input class="btn btn-danger" type="reset" value="다시쓰기" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>