package dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
	private int idx;
	private int mref;
	private String name;
	private String password;
	private String content;
	private Timestamp wdate; //Date 타입은 날짜만 가져오고 시간은 못가져옴
	private String ip;
}
