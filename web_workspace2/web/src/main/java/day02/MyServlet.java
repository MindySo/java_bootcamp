package day02;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/myServlet.do")
public class MyServlet extends GenericServlet {

	@Override
	public void init() throws ServletException {
		System.out.println("초기화 메서드 호출중");
	}

	@Override
	public void destroy() {
		System.out.println("서블릿 제거중");
	}

	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		System.out.println("service() 호출중");
		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title></title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1> service() 호출중 </h1>");
		out.println("</body>");
		out.println("</html>");
	}
}