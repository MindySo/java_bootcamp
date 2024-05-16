package test;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import vo.DeptVO;
import vo.EmpVO;

public class TestMain {
	public static void main(String[] args) {
		System.out.println("Hello MyBatis World");
		
		// 1. MyBatis의 설정파일을 읽기 (설계도)
		try {
			Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
			
			// Connection conn ==> SqlSesionFactory <== SqlSessionFactoryBuilder
			// 2. 건설 노동자 : SqlSessionFactoryBuilder
			
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			
			// 3. 공장 건설
			SqlSessionFactory factory = builder.build(r);
			
			// 4. 설계도 닫기
			r.close();

			// 5. 자동차 생산
			// true : auto commit, false 수동커밋
			SqlSession ss = factory.openSession(true);
			
			System.out.println("ss : " + ss);
			// JDBC : Connection
			// MyBatis : SqlSession
			
			/* ss.selectList("별칭명"); */
			List<DeptVO> list = ss.selectList("AllDept");
			
			System.out.println("list : " + list);
			
			// for문 사용해서 부서번호 : 부서명 : 위치 형식으로 출력
			System.out.println("----------------------------");
			for( DeptVO vo : list) {
				System.out.println(vo.getDeptno() + " : " + vo.getDname() + " : " + vo.getLoc());
			}

			// 1건 추가
			DeptVO vo2 = new DeptVO(99, "회계", "LA");
			ss.insert("addOne", vo2);
			
			// Stream을 사용해서 부서번호 : 부서명 : 위치 형식으로 출력
			System.out.println("----------------------------");
			list.stream().forEach(vo -> {
				System.out.println(vo.getDeptno() + " : " + vo.getDname() + " : " + vo.getLoc());
			});
			
			// 1건 데이터 읽기
			System.out.println("----------------------------");
			DeptVO vo = ss.selectOne("SelectOne", 20);
			System.out.println("1건 조회 : " + vo.getDeptno() + " : " + vo.getDname() + " : " + vo.getLoc());
			
			// 2번 부서 확인, 1건 수정 (IT:울산)
			System.out.println("----------------------------");
			DeptVO vo3 = new DeptVO();
			vo3.setDeptno(2);
			vo3.setDname("IT");
			vo3.setLoc("울산");
		
			ss.update("modifyOne", vo3);
			DeptVO vo4 = ss.selectOne("SelectOne", 2);
			
			System.out.println("수정 후 : " + vo4.getDeptno() + " : " + vo4.getDname() + " : " + vo4.getLoc());
			
			// 삭제(3번 부서)
			System.out.println("----------------------------");
			ss.delete("deleteDeptOne", 3);
			
			// Emp 테이블 조회
			List<EmpVO> list2 = ss.selectList("getEmpData");
			list2.stream().forEach(evo -> {
				System.out.println(evo.getEmpno() + " : " + evo.getEname() + " : " 
									+ evo.getJob() + " : " + evo.getMgr() + " : " + evo.getHiredate() + " : " 
									+ evo.getSal() + " : " + evo.getComm() + " : " + evo.getDeptno());
			});
			
			// 6. 자원 반납
			ss.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
