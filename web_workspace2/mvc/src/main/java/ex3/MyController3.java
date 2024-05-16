package ex3;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// localhost:8080/mvc/mc			==>	ex3/hello.jsp (안녕하세요)
// localhost:8080/mvc/mc?type=hello	==> ex3/hello.jsp
// localhost:8080/mvc/mc?type=ip	==> ex3/ip.jsp (접속 IP : XXX.XXX.XXX.XXX)
// localhost:8080/mvc/mc?type=now	==> ex3/now.jsp (msg : 오늘 현재 시간 출력)
// localhost:8080/mvc/mc?type=dept	==> ex3/dept.jsp 

@WebServlet("/mc")
public class MyController3 extends HttpServlet {
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 한글처리
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		// 2. 파라미터 값 가져오기
		String type = req.getParameter("type");
		String url = "";
		String msg = "";
		ActionCommand ac = null;
		// 3. 파라미터 값이 무엇인지에 따라
		if (type == null || type.equals("hello")) {
			ac = new HelloCommand();

		} else if (type.equals("ip")) {
			ac = new IPCommand();

		} else if (type.equals("now")) {
			ac = new NowCommand();

		} else if (type.equals("dept")) {
			ac = new DeptCommand();
		}
		url = ac.execute(req, resp);

		// 5. forward
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
}
