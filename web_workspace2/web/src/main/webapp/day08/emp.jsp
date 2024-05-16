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
      
      function empnoCheck() {
         console.log("btn click");
         let empno = document.querySelector("#empno").value;
         empno = empno.replaceAll(' ', '');
         console.log("empno : " + empno);
         
         $.ajax({
				url: "empnoCheckup.jsp", 
				dataType: "html",
				data : {"empno": empno},
				success : function(response, status, request){
					console.log("비동기통신");
					console.log(response);
					$("#msg").html("<span>" + response + "</span>")
				}
			})
      }
}
</script>
</head>
<body>
	<!-- 
	search2.jsp?empno=7788
	 -->
	<input type="text" name="empno" id="empno" />
	<input type="button" value="검색" id="btn"/>
	<div id="info">
		사원명
		<span id="msg"></span>
	</div>

</body>
</html>