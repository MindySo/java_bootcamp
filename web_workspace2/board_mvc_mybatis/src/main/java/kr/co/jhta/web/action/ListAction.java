package kr.co.jhta.web.action;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.jhta.web.dao.BoardDAO;
import kr.co.jhta.web.vo.BoardVO;

public class ListAction implements Action {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		BoardDAO dao = new BoardDAO();
		int totalCount = dao.getTotalCount();

		// 한 페이지 당 게시물 수 : 20
		int recordPerPage = 20;

		//총 페이지수/페이지당 게시물 수
		int totalPage = (totalCount % recordPerPage == 0) ? totalCount / recordPerPage : totalCount / recordPerPage + 1;

		// 현재 페이지 번호
		String cp = req.getParameter("cp");

		int currentPage = 0;
		if (cp != null) {
			currentPage = Integer.parseInt(cp);
		} else {
			currentPage = 1;
		}

		// 1페이지(1~20) / 2페이지(21~40) / 3페이지(41~60)

		// 시작번호
		int startNo = (currentPage - 1) * recordPerPage + 1;

		// 끝번호
		int endNo = currentPage * recordPerPage;

		// 시작 페이지 번호
		int startPage = 1;
		// 끝 페이지 번호
		int endPage = totalPage;
		
		// 이전페이지가 존재
		boolean isPrev = false;
		
		// 다음 페이지가 존재
		boolean isNext = false;
		

		// 시작 페이지를 현재 페이지 기준으로 앞에 5개만
		if (currentPage <= 5) {
			startPage = 1;
		} else if (currentPage >= 6) {
			startPage = currentPage - 4;
		}

		// 끝 페이지는 현재 페이지 기준으로 다음 5개만
		if (totalPage - currentPage <= 5) {
			endPage = totalPage;
		} else if (totalPage - currentPage > 5) {
			if (currentPage <= 5) {
				if (totalPage > 10) {
			endPage = 10;
				} else {
			endPage = totalPage;
				}
			} else {
				endPage = currentPage - 4;
			}
		}
		
		// 이전 페이지가 존재
		if(startPage >= 2) {
			isPrev = true;
		} else if (endPage < totalPage) {
			isNext = true;
		}
		

		dao = new BoardDAO();
		List<BoardVO> list = dao.selectAll(startNo, endNo);
		
		req.setAttribute("list", list);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("recordPerPage", recordPerPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("startNo", startNo);
		req.setAttribute("endNo", endNo);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("isPrev", isPrev);
		req.setAttribute("isNext", isNext);
		return "views/list.jsp";
	}
}
