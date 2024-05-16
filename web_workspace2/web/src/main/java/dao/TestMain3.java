package dao;

public class TestMain3 {
	public static void main(String[] args) {
		
		// 디자인 패턴 - singleton
		
//		DBConnection conn1 = new DBConnection();
//		DBConnection conn2 = new DBConnection();
//		System.out.println("conn1 : " + conn1);	// 서로 다른 
//		System.out.println("conn2 : " + conn2);	// 참조값
		
		DBConnection conn1 = DBConnection.getInstance();
		DBConnection conn2 = DBConnection.getInstance();
		System.out.println("conn1 : " + conn1);	// 참조값이
		System.out.println("conn2 : " + conn2);	// 일치
		
		System.out.println("-------------------------------------");
		
//		Connection conn = conn1.getconnection();
	}
}
