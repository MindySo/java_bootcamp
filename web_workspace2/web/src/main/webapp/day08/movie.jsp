<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
 window.onload = function() {
      let frm = document.frm;
      
      console.dir(frm);
      
      $("#btn").on("click", empnoCheck);
      
      $("#txt").on("keyup", empnoCheck);
      
      function empnoCheck() {
         console.log("btn click");
         let movie = document.querySelector("#movie").value;
         movie = movie.replaceAll(' ', '');
         console.log("movie : " + movie);
         $.ajax({
				url: "movieCheckup.jsp", 
				dataType: "html",
				data : {"movie": movie},
				success : function(response, status, request){
					console.log("비동기통신");
					console.log(response);
					$("#img").attr("src", response);
				}
			})
      }
}
</script>
</head>
<body>
<h2>영화소개</h2>
	<!-- 
	1. 영화명 검색
	
	searchMovie.jsp?name=ebs
	2. 비동기 방식으로 영화이미지 경로를 얻어오기
	3. 현재 화면 img 태그의 소스로 지정
	 -->
	<input type="text" name="movie" id="movie" />
	<input type="button" value="검색" id="btn"/>
	<div>
		<img src="" alt="" id="img"/>
	</div>

</body>
</html>