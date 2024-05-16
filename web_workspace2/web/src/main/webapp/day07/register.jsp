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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	window.onload=function(){	
		let btn= document.getElementById("btn");
		btn.onclick=openKakaoPostCode;
	}
	function openKakaoPostCode(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	// 팝업에서 검색 결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분
	        	console.dir(data);
	        	document.getElementById("zipcode").value=data.zonecode;
	        	document.getElementById("addrs1").value=data.roadAddress;
	        }
	    }).open()
	}
</script>
<script>
	window.onload = function() {
		let btn = document.getElementById("btn1");
		btn1.onclick = function() {
			let frm = document.frm;
			
			if (frm[0].value == '') {
				console.log("?");
				alert("id를 입력해주세요.");
				frm[0].focus();
				return;
			}
			if (frm[1].value == '') {
				alert("이름을 입력해주세요.");
				frm[1].focus();
				return;
			}
			if (frm[2].value == '') {
				alert("패스워드를 입력해주세요.");
				frm[2].focus();
				return;
			}
			if (!(frm[3].checked || frm[4].checked)) {
				alert("성별을 선택해주세요.");
				frm[3].focus();
				return;
			}
			if (frm[5].value == '') {
				alert("가입동기를 입력해주세요.");
				frm[5].focus();
				return;
			}
			/* if (frm[6].value == '' || frm[7].value == '') {
				alert("우편번호를 입력해주세요.");
				frm[6].focus();
				return;
			}
			if (frm[8].value == '') {
				alert("상세주소를 입력해주세요.");
				frm[7].focus();
				return;
			} */
			frm.action="registerOk.jsp";
			frm.method="get";
			frm.submit();
		}
	}

	function email(x) {
		let email2 = document.getElementById("email2");
		email2.value = (x.value == "직접입력") ? "" : x.value;
	}

</script>
</head>
<body>
	<h1>가입신청서</h1>

	<form action="registerOk.jsp" name="frm">
		<span>ID:</span>
		<input type="text" name="id" id="" placeholder="id를 입력하세요." /> <br> 
		<span>NAME:</span>
		<input type="text" name="name" id="" placeholder="이름을 입력하세요." /> <br>
		<span>비밀번호:</span>
		<input type="password" name="pw" id="" placeholder="패스워드를 입력하세요." /> <br>
		<span>성별:</span>
		<input type="radio" name="gender" id="" value="남" />남
		<input type="radio" name="gender" id="" value="여" />여 <br>
		<span>가입동기</span>
		<textarea name="motive" id="" cols="30" rows="10" placeholder="가입동기를 입력하세요." style="resize: none;"></textarea><br>
		<span>우편번호:</span>
		<input type="text" name="" id="zipcode" placeholder="도로명주소 검색" /> 
		<input type="button" value="우편번호찾기" id="btn" /><br>
		<span>도로명 :</span>
		<input type="text" name="addrs1" id="addrs1" size="20"/><br>
		<span>상세주소 :</span>
		<input type="text" name="addrs2" id="addrs2" size="20"/><br>
		<!-- 가입 버튼을 누르면 현재 입력된 값들이 올바른지 검사 후에 registerOk.jsp로 전달 -->
		<div id="button">
		<input type="button" value="가입하기" id="btn1" />
		<input type="reset" value="취소하기" />
		</div>
	</form>
</body>
</html>