package ex3;

import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class NowCommand implements ActionCommand {
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd(E) hh:mm:ss");
		req.setAttribute("msg", sdf.format(now));
		
//		req.setAttribute("msg", new SimpleDateFormat("yyyy.MM.dd(E) hh:mm:ss").format(new Date()));
		
		return "ex3/now.jsp";
	}
}
