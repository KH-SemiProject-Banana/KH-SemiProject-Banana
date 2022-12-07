package edu.kh.banana.userComplain.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserBlock {
	
	public int userBlocked; // 차단당한 사람
	public int userBlocker; // 차단한 사람

}
