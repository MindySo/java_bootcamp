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
	//1. 버튼을 클릭하면 콘솔에 메시지 출력
	//2. server02.jsp에 사원이름 출력 SCOTT, BLACK, KING
	//3. 버튼을 클릭하면 server02.jsp의 내용을 콘솔에 출력
	$(function(){
		$("input").on("click", function(){
			console.log("버튼 클릭");
			$.ajax({
				url: "server02.jsp",
				success: function(data){
					console.log(data);
					let data2 = data.trim();
					data2.split(",");
					let vlist = data2.split(",");
					for(let i = 0 ; i < vlist.length ; i++ ){
						//4. 버튼을 클릭하면 server02.jsp의 내용을 배열로 만들어 콘솔에 출력
						let m = vlist[i];
						//5. 배열에서 한개씩 꺼내 <li>SCOTT</li> 형태로 완성
						let txt = "<li>" + m + "</li>";
						console.log(txt);
						//6. ul 태그 뒤에 붙인다
						$("ul").append(txt);
					}
				}
			})
			
			
		})
	})
	
	
</script>
</head>
<body>
	<h2>사원목록</h2>
	<input type="button" value="출력" />
	<div>
		<ul>
			<li>
				<h2>사원</h2>
			</li>
		</ul>
	</div>
</body>
</html>