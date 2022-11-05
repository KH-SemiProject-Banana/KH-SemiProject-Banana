package edu.kh.banana.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@NoArgsConstructor
public class Member {

	private int memberNo;
	private String memberEmail;
	private String memberPw;
	private String memberNickname;
	private String introduce;
	private String memberTel;
	private String memberAddress;
	private String profileImage;
	private String enrollDate;
	private String memberDeleteFlag;
	private int authority;
	private String blockFlag;
	private String birthday;
	private int manner;
	
}
