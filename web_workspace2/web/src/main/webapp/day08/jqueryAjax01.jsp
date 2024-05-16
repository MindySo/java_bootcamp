<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#img").on("click", function() {
			console.log("?");
			// 이미지를 클릭하면 after.PNG
			$("#img").attr("src", "../images/after.PNG")
			
			$.ajax({
				url: "getJSON22.jsp", 
				type: "get",
				dataType: "html", //전송받을 데이터 html, json, xml 가능
				data : {"id": "aaa"},	// getJSON.jsp?id=aaa 이렇게 요청
				success : function(response, status, request){
					console.log("성공시 메세지 출력");
					console.log(response);
					$("img").attr("src", response);
				},
				error: function(response, status, request){
					console.log("에러 메세지 출력");
					$("img").attr("src", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvgXUCai130zN8rfbneflvvYBdH1nWNyG_ogL08x7K9g&s");
				},
				complete: function(){
					console.log("AJAX 통신 끝");
					$("img").fadeIn(2000);
				},
				beforeSend : function(){
					console.log("요청 보내기 전에 호출됨");
					$("img").fadeOut(2000);
				}
			})
		})

	})
</script>
</head>
<body>
	<!-- jquery를 사용해서 이미지를 클릭하면 콘솔에 메세지 출력 -->
	<img src="../images/before.PNG" alt="" id="img" />
</body>
</html>