<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	function prt(){
		console.log("prt() 호출중")
		
		// search.jsp?txt=뽀로로코딩컴퓨터
		// 				=
		// ==> https://shop-phinf.pstatic.net/어쩌구.jpg
		
		let txt = document.querySelector("#txt").value;
		let params = "txt="+txt;
		sendRequest("search.jsp", params, callback, "GET");
		
	}
	
	function callback(){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responseText);
			let img = document.querySelector("#img");
			img.src = xhr.responseText;	
		}
	}

</script>

<body>
	<input type="text" name="txt" id="txt" />
	<input type="button" value="출력" onclick="prt()" />
	<div id="myconsole">
		<img src="../images/before.PNG" alt="뽀로로" id="img"/>
	</div>
</body>
</html>