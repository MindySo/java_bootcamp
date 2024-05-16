package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BoardVO;

public class BoardDAO {

	private Connection conn;
	StringBuffer sb = new StringBuffer();
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public BoardDAO() { 
		conn = DBConnection.getInstance().getConnection();

	}

	public ArrayList<BoardVO> selectAll(int startNo, int endNo) {
		sb.setLength(0);
//		sb.append("SELECT bno, writer, title, contents, regdate, hits, ip, status FROM board ORDER BY bno desc");
		  
		sb.append("SELECT rn, bno, writer, title, contents, regdate, hits, ip , status ");
		sb.append("FROM (SELECT ROWNUM rn, bno, writer, title, contents, regdate, hits, ip , status ");
		sb.append("FROM (SELECT bno, writer, title, contents, regdate, hits, ip , status ");
		sb.append("FROM board ");
		sb.append("ORDER BY bno desc) ");
		sb.append("WHERE ROWNUM <= ?) ");
		sb.append("WHERE rn >= ?");
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String regdate = rs.getString("regdate");
				int hits = rs.getInt("hits");
				String ip = rs.getString("ip");
				int status = rs.getInt("status");
				BoardVO vo = new BoardVO(bno, writer, title, contents, regdate, hits, ip, status);
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close();
		return list;
	}

	// 1건 조회
	public BoardVO getOne(int bno) {
		sb.setLength(0);
		sb.append("SELECT bno, writer, title, contents, to_char(regdate, 'yyyy-mm-dd') regdate, hits, ip, status FROM board WHERE bno = ?");
		BoardVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String regdate = rs.getString("regdate");
				int hits = rs.getInt("hits");
				String ip = rs.getString("ip");
				int status = rs.getInt("status");
				vo = new BoardVO(bno, writer, title, contents, regdate, hits, ip, status);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return vo;
	}

	// 1건 추가
	public void addOne(BoardVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO board VALUES (BOARD_BNO_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, 0, ?, 1)");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContents());
			pstmt.setString(4, vo.getIp());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}

	// 1건 변경
	public void updateOne(BoardVO vo) {
		// 제목, 내용, 작성자만 변경
		sb.setLength(0);
		sb.append("UPDATE board ");
		sb.append("SET writer = ? , title = ? , contents = ? ");
		sb.append("WHERE bno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContents());
			pstmt.setInt(4, vo.getBno());

			pstmt.executeUpdate();
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 1건 삭제
	public void deleteOne(int bno) {
		// 게시물번호로 게시물 삭제
		sb.setLength(0);
		sb.append("DELETE FROM board WHERE bno = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	
	public void raiseHits(int bno) {
		sb.setLength(0);
		sb.append("UPDATE board SET hits = hits + 1 WHERE bno = ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) cnt FROM board");
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return cnt;
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
