package day03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCEx1 {
	public static void main(String[] args) {
		// 1. 환경변수
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String username="scott";
		String password="tiger";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 2. 드라이버로딩
		try {
			Class.forName(driver);
			// 3. Connection
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("conn : " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 4. sql 문장
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT * FROM DEPT");
		
		// 5. sql 문장 객체
		try {
			pstmt = conn.prepareStatement(sb.toString());
			// 6. 실행(ResultSet)
			rs = pstmt.executeQuery();

			// 7. 레코드별 로직 처리
			
			while(rs.next()) {	// 전달받은 리젤트셋의 첫번째 레코드
				int deptno = rs.getInt("deptno");
//				int deptno = rs.getInt(1);	// 컬럼 넘버로도 조회 가능
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				System.out.println(deptno + " : " + dname + " : " + loc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 8. 자원반납
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
	}
}
