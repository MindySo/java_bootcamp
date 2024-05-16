package day03;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


// DAO(Data Access Object)

public class JDBCEx2 {
	public static void main(String[] args) {

		// 1. 환경변수
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "scott";
		String password = "tiger";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 2. 드라이버 로딩
		try {
			Class.forName(driver);
			// 3. connection
			conn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 4. sql 문장
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT empno, ename, sal, deptno, hiredate FROM emp WHERE deptno = 10");

		// 5. sql 문장 객체
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				int sal = rs.getInt("sal");
				int deptno = rs.getInt("deptno");
				Date hiredate = rs.getDate("hiredate");
				System.out.println(empno + " : " + ename + " : " + sal + " : " + deptno + " : " + hiredate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

}
