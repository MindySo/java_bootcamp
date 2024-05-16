package webQuiz;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//SQL> CREATE TABLE BOARD
//2  (BNO NUMBER(8) constraint board_bno_pk primary key,
//3  WRITE VARCHAR2(20),
//4  TITLE VARCHAR2(200),
//5  CONTENTS CLOB,
//6  REGDATE DATE,
//7  HITS NUMBER(5),
//8  ip char(16),
//9  status number(3));

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	private int bno;
	private String writer;
	private String title;
	private String contents;
	private String regdate;
	private int hits;
	private String ip;
	private int status;
}
