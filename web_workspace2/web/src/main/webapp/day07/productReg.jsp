<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register.jsp</title>
<style>
* {
	margin: 0;
	padding: 0;
}

h1 {
	text-align: center;
	margin: 20px;
}

span {
	display: inline-block;
	width: 150px;
}

form {
	margin-left: 50px;
}

div#button {
	text-align: center;
}
</style>
<script type="text/javascript">
</script>
<script>
	window.onload = function() {
		let btn = document.getElementById("btn1");
		btn1.onclick = function() {
			let frm = document.frm;
			
			if (frm[0].value == '') {
				console.log("?");
				alert("상품명을 입력해주세요.");
				frm[0].focus();
				return;
			}
			if (frm[1].value == '') {
				alert("이미지 파일을 선택해주세요.");
				frm[1].focus();
				return;
			}
			if (frm[2].value == '') {
				alert("이미지 파일을 선택해주세요.");
				frm[2].focus();
				return;
			}
			if (frm[3].value == '') {
				alert("상품 수량을 입력해주세요.");
				frm[3].focus();
				return;
			}
			if (frm[4].value == '') {
				alert("판매가를 입력해주세요.");
				frm[4].focus();
				return;
			}
			if (frm[5].value == '') {
				alert("할인율을 입력해주세요.");
				frm[5].focus();
				return;
			}
			if (frm[6].value == '') {
				alert("상세설명을 입력해주세요.");
				frm[6].focus();
				return;
			}
			frm.action="productRegOk.jsp";
			frm.method="post";
			frm.submit();
		}
	}

</script>
</head>
<body>
	<h1>상품 등록</h1>

	<form action="productRegOk.jsp" name="frm" method= "post" enctype="multipart/form-data">
		<span>상품명:</span>
		<input type="text" name="pname" id="" placeholder="상품명을 입력하세요." /> <br> 
		<span>상품이미지1:</span>
		<input type="file" name="imgfile" id="" placeholder="상품 이미지를 선택하세요." /> <br>
		<span>상품이미지2:</span>
		<input type="file" name="bigfile" id="" placeholder="상품 이미지를 선택하세요." /> <br>
		<span>상품수량:</span>
		<input type="text" name="qty" id="" placeholder="상품 수량을 입력하세요." /> <br>
		<span>판매가:</span>
		<input type="text" name="price" id="" placeholder="판매가를 입력하세요." /> <br>
		<span>할인율</span>
		<input type="text" name="dcratio" id="" placeholder="할인율을 입력하세요." /> <br>
		<span>상세설명:</span>
		<textarea name="prodesc" id="" cols="30" rows="10" placeholder="상세설명을 입력하세요." style="resize: none;"></textarea><br>

		<div id="button">
		<input type="button" value="등록하기" id="btn1" />
		<input type="reset" value="RESET" />
		<input type="button" value="main" id="btn2" />
		</div>
	</form>
</body>
</html>