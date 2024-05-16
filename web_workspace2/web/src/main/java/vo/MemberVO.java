package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	private int no;
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String motive;
	private int zipcode;
}
