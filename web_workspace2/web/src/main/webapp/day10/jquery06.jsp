<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	//1. getMemberJSON.jsp ==> 회원정보(member)를 JSON 형태로 출력(with json-simple)
	$(function(){
		$("input").on("click", function(){
			$.ajax({
				url : "getMemberJSON.jsp",
				type : "get",
				success : function(data) {
					console.log(data);
					let obj = JSON.parse(data);
					console.log(obj);
					for(let i = 0 ; i < obj.length ; i++){
						let txt = "<li>" + obj[i].id + " : " + obj[i].pw + " : " + obj[i].name + "</li>";
						$("ul").append(txt);
					}
				}
			})
		})
	})
	
	//2. 버튼 클릭시 회원 id, pw, name을 ul 태그 자손으로 출력
</script>
</head>
<body>
	<h1>ajax member JSON</h1>
	<input type="button" value="출력" />
	<ul>
		<li>목록</li>
	</ul>
</body>
</html>