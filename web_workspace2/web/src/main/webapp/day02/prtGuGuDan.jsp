<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prtGuGuDan.jsp</title>
</head>
<body>
	<!-- action 값을 따로 지정하지 않으면 자기 자신에게 리턴 -->
	<form action="" method="get">
		<input type="text" name="dan" id=""/>
		<input type="submit" value="출력"/>
	</form>
	<%
		String d = request.getParameter("dan");
		if(d!= null){
			int dan = Integer.parseInt(d);
			for( int i = 1 ; i < 10 ; i++ ){
				out.println("<h3>" + dan + " x " + i + " = " + i * dan + "</h3>");
			}
		}
	%>
</body>
</html>