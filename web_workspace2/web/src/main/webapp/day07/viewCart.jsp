<%@page import="java.util.Set"%>
<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style>
img {
	width: 70px;
	height: 70px;
}
th{
	text-align: center;
}
#item>th{
	text-align: center;
	line-height: 75px;
	
}
#total{
	text-align: right;
}
</style>
</head>
<body>
	<table class="table">
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>이미지</th>
			<th>수량</th>
			<th>할인가격</th>
		</tr>
		<%
		// session에서 cart 속성 가져오기 : obj
		Object obj = session.getAttribute("cart");
		// obj <== null
		if (obj == null) {
			// ArrayList 생성
			ArrayList<Integer> cart = new ArrayList<Integer>();

			// 세션의 속성 지정
			session.setAttribute("cart", cart);

			// 다시 가져오기
			obj = session.getAttribute("cart");
		}

		// 아래 코드부터는 obj가 반드시 존재하게 된다.
		ArrayList<Integer> cart = (ArrayList<Integer>) obj;

		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();

		// 1개씩 꺼내서 상품과 수량을 집계

		for (Integer it : cart) {
			// n번 상품이 존재한다면

			if (map.containsKey(it)) {
				int cnt = map.get(it);
				cnt++;
				map.put(it, cnt);
			} else {
				map.put(it, 1);
				System.out.println("map : " + map);
			}
		}
		//화면에 표형태로 출력
		Set key = map.keySet();
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductVO> item = dao.getData(key);
		ArrayList<Integer> priceArr = new ArrayList();
		for (ProductVO vo : item) {
			int realPrice = (int)Math.round(vo.getPrice() * (1 - vo.getDcratio()* 0.01) * map.get(vo.getPno()));
			priceArr.add(realPrice);
		%>

		<tr id="item">
			<th><%=vo.getPno()%></th>
			<th><%=vo.getPname()%></th>
			<th><img src="<%=vo.getImgfile()%>" alt="" /></th>
			<th><%=map.get(vo.getPno())%></th>
			<th><%= realPrice %>원</th>
		</tr>

		<%
		}
		int total = 0;
		for(int price : priceArr){
			total += price;
		}
		%>
		
		<tr>
			<th colspan="4" id="total">총계 : </th>
			<th><%= total %>원</th>
		</tr>
		<tr>
			<th colspan="5">
			<input type="button" value="결제하기" />
			</th>
		</tr>
	</table>
</body>
</html>