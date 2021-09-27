package dto;

import java.sql.Date;

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
	private Date wdate;
	private String ip;
	private short commentCount;

	

}
