package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//Value Object

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DeptVO {
	private int deptno;
	private String dname;
	private String loc;
	
//	@Override
//	public String toString() {
//		return this.getDeptno() + " : " + this.getDname() 
//				+ " : " + this.getLoc();
//	}
	
}
