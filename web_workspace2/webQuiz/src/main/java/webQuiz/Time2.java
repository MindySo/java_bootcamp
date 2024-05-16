package webQuiz;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/time2.do")
public class Time2 extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>today.do</title>");
		out.println("</head>");
		out.println("<body>");
		Date today = new Date();
		SimpleDateFormat datefmt = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
		out.println("<h3>" + datefmt.format(today) + "</h3>");
		out.println("</body>");
		out.println("</html>");
	}
}
