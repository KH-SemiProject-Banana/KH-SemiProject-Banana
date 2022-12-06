package edu.kh.banana.member.model.vo;

import java.util.List;

import edu.kh.banana.goods.model.vo.GoodsSell;
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
	private String memberName;
	private String memberBirth;
	private String memberTel;
	private String memberAddress;
	private String introduce;
	private String profileImage;
	private String enrollDate;
	private String memberDeleteFlag;
	private int authority;
	private String blockFlag;
	private double manner;
	
	
	// 카테고리(CATEGORY)테이블
//	private int categoryNo;
//	private String categoryName;
	
	// GoodsSell 테이블
	private List<GoodsSell> goodsList;
	private int goodsNo;
	
	
	// ERD의 찜했따(GOODS_LIKE) 테이블
	private int[] likeGoodsNo; // 내가 찜한 판매글번호
	private String likeTime; // 찜한 시간
	
	// 유저차단 테이블(USER_BLOCK)
	private int[] userBlocked; // 차단당한사람
	
}
