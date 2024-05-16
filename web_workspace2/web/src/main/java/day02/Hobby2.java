package day02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hobby2.do")
public class Hobby2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		hobby2(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		hobby2(req, resp);
	}

	private void hobby2(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		PrintWriter out = resp.getWriter();
		req.setCharacterEncoding("UTF-8");
		String[] hList = req.getParameterValues("hobby");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>취미</title>");
		out.println("</head>");
		out.println("<body>");

//		for (int i = 0; i < hList.length; i++) {
//			out.println("<h2>당신의 취미는 " + hList[i] + "입니다.</h2>");
//		}

//		out.println("-------------------------------------------");
//		for (String string : hList) {
//			out.println("<h2>당신의 취미는 " + hList + "입니다.</h2>");
//		}

//		out.println("-------------------------------------------");
//		List<String> strList = Arrays.asList(hList);
//		strList.forEach(x -> out.println("<h2>당신의 취미는 " + x + "입니다.</h2>"));

		out.println("-------------------------------------------");
		Arrays.asList(hList).forEach(x -> out.println("<h2>당신의 취미는 " + x + "입니다.</h2>"));

		out.println("</body>");
		out.println("</html>");
	}
}