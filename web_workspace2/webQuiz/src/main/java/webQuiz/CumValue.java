package webQuiz;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cumValue.do")
public class CumValue extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		req.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(req.getParameter("num"));
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>어디까지 더할까요?</title>");
		out.println("</head>");
		out.println("<body>");
		int sum = 0;
		for( int i = 1 ; i <= num ; i++) {
			sum += num;
		}
		out.println("<h3>" + num + "까지의 합 : " + sum + "</h3>");
		out.println("</body>");
		out.println("</html>");
	}

}
