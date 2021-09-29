package dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Freeboard {
	private int idx;
	private String name;
	private String password;
	private String subject;
	private String content;
	private int readCount;
	private Timestamp wdate; //Date 타입은 날짜만 가져오고 시간은 못가져옴
	private String ip;
	private short commentCount;

	

}
