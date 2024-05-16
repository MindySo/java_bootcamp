package webQuiz;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/printGuGuDan.do")
public class GuGuTest extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>구구단 2단부터 9단까지 출력하기</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<table>");
		for( int i = 2 ; i < 10 ; i++) {
			out.println("<tr>");
			for( int j = 1 ; j < 10 ; j++) {
				out.println( "<td>" + i + "x" + j + "=" + i*j + "&nbsp;&nbsp;</td>");
			}
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("</body>");
		out.println("</html>");
	}

}
