package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SessionDto {
	//Customer 정보중에 session 객체에 저장하고 싶은 것들
	private int idx;
	private String name;
	private String email;
	private int age;
}
