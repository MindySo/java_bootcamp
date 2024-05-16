<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hap.jsp</title>
</head>
<body>
	<%	
		String n1 = request.getParameter("num1");	
		String n2 = request.getParameter("num2");
		int num1 = 0;
		int num2 = 0;
		int result = 0;
		
		if(n1 != null){
		num1 = Integer.parseInt(n1);
		}
		if(n2 != null){
		num2 = Integer.parseInt(n2);
		
		result = num1 + num2;
		}
	%>

	<form action="">
		<input type="text" name="num1" id="" value="<%=num1 %>" />
		+
		<input type="text" name="num2" id="" value="<%=num2 %>" />
		<input type="submit" value="="/>
		<input type="text" name="result" id="result" value="<%=result %>" />
	</form>
</body>
</html>