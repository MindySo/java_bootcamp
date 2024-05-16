<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
	<div class="container">
		<form action="writeOk.jsp" method="get">
			<table class="table table-striped">
				<tr>
					<th>부서명</th>
					<td><input class="fonm-control" type="text" name="dname" id="" /></td>
				</tr>
				<tr>
					<th>부서위치</th>
					<td><input class="fonm-control" type="text" name="loc" id="" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="list.jsp" class="btn btn-primary">목록</a>
						<input class="btn btn-success" type="submit" value="작성"/>
						<input class="btn btn-warning" type="reset" value="다시쓰기"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>