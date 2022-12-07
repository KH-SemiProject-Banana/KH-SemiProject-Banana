package edu.kh.banana.manager.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.banana.board.model.vo.Board;
import edu.kh.banana.board.model.vo.Pagination;
import edu.kh.banana.goods.model.vo.GoodsSell;
import edu.kh.banana.manager.model.dao.ManagerDAO;
import edu.kh.banana.member.model.vo.Member;

@Service
public class ManagerServiceImpl implements ManagerService{
	
	@Autowired
	private ManagerDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@Override
	public Member login(Member inputManager) {
		
		Member loginManager = dao.login(inputManager.getMemberEmail());
		
		
		if(loginManager != null) {
			if(bcrypt.matches(inputManager.getMemberPw(), loginManager.getMemberPw())) {
				loginManager.setMemberPw(null);
			} else {
				loginManager = null;
			}
		}
		return loginManager;
	}

	/**
	 * 고객센터-자주묻는 질문 추가
	 */
	@Override
	public int editBoard1(Board board) {
		
		return dao.editBoard1(board);
	}

	/*
	 * 회원 목록 조회
	 */
	@Override
	public Map<String, Object> memberSearch(Map<String, Object> paramMap, int cp) {
		
		// 조건에 맞는 회원 수
		int listCount = dao.getMemberListCount(paramMap);
		
		// 전체 회원 수
		int allMemberCount = dao.memberCount();
		
		// 전체 회원 수 + cp를 이용헤 페이징 처리
		Pagination pagination = new Pagination(listCount, cp);
		pagination.setLimit(30); // 한 페이지에 보일 회원목록 수 : 30
		
		
		// sort값 계산
		paramMap.put("order", "M.MEMBER_NO ASC");
		if(paramMap.get("sort").equals("1")) {
			paramMap.put("order", "M.MEMBER_NO ASC");
		}
		if(paramMap.get("sort").equals("2")) {
			paramMap.put("order", "M.MEMBER_NO DESC");
		}
		if(paramMap.get("sort").equals("3")) {
			paramMap.put("order", "SELL_COUNT ASC, M.MEMBER_NO ASC");
		}
		if(paramMap.get("sort").equals("4")) {
			paramMap.put("order", "BUY_COUNT DESC, M.MEMBER_NO ASC");
		}
		
		// 조건에 맞는 회원 목록
		List<Member> memberList = dao.memberSearch(pagination, paramMap);
		

		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("memberList", memberList);
		map.put("allMemberCount", allMemberCount);
		map.put("listCount", listCount);
		
		return map;
	}

	/**
	 * 회원 정보 수정
	 */
	@Override
	public int memberEdit(Member member) {
		
		return dao.memberEdit(member);
	}

	/**
	 * 회원 정보 삭제
	 */
	@Override
	public int memberDelete(int memberNo) {
		
		return dao.memberDelete(memberNo);
	}
	
	/**
	 * 회원 정보 삭제 복구
	 */
	@Override
	public int memberDeleteBack(int memberNo) {
		
		return dao.memberDeleteBack(memberNo);
	}
	
	
	/**
	 * 회원 차단
	 */
	@Override
	public int memberBlock(int memberNo) {
		
		return dao.memberBlock(memberNo);
	}
	
	/**
	 * 회원 차단 해제
	 */
	@Override
	public int memberBlockBack(int memberNo) {
		
		return dao.memberBlockBack(memberNo);
	}

	/**
	 * 상품 목록 조회
	 */
	@Override
	public Map<String, Object> goodsSearch(Map<String, Object> paramMap, int cp) {
		
		// 조건에 맞는 상품 갯수 조회
		int listCount = dao.getGoodsListCount(paramMap);
		
		// 전체 상품 수
		int allGoodsCount = dao.allGoodsCount();
		
		// 전체 상품 수 + cp를 이용헤 페이징 처리
		Pagination pagination = new Pagination(listCount, cp);
		pagination.setLimit(30); // // 한 페이지에 보일 상품목록 수 : 30
		
		
		// sort값 계산
		paramMap.put("order", "GOODS_NO DESC");
		if(paramMap.get("sort").equals("1")) {
			paramMap.put("order", "GOODS_NO DESC");
		}
		if(paramMap.get("sort").equals("2")) {
			paramMap.put("order", "GOODS_NO ASC");
		}
		if(paramMap.get("sort").equals("3")) {
			paramMap.put("order", "SELL_PRICE ASC, GOODS_NO DESC");
		}
		if(paramMap.get("sort").equals("4")) {
			paramMap.put("order", "SELL_PRICE DESC, GOODS_NO DESC");
		}
		
		
		// 조건에 맞는 상품 목록
		List<GoodsSell> goodsList = dao.goodsSearch(pagination, paramMap);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("goodsList", goodsList);
		map.put("allGoodsCount", allGoodsCount);
		map.put("listCount", listCount);
		
		return map;
	}

	/**
	 * 상품 삭제
	 */
	@Override
	public int goodsDelete(int goodsNo) {
		
		return dao.goodsDelete(goodsNo);
	}

	/**
	 * 상품 삭제 복구
	 */
	@Override
	public int goodsDeleteBack(int goodsNo) {
		
		return dao.goodsDeleteBack(goodsNo);
	}

	/**
	 * 조건이 있는 게시글 조회
	 */
	@Override
	public Map<String, Object> boardSearch(Map<String, Object> paramMap, int cp) {
		
		// 조건에 맞는 게시글 갯수 조회
		int listCount = dao.getBoardListCount(paramMap);
		
		// 전체 게시글 수
		int allBoardCount = dao.allBoardCount();
		
		// 전체 상품 수 + cp를 이용헤 페이징 처리
		Pagination pagination = new Pagination(listCount, cp);
		pagination.setLimit(30); // // 한 페이지에 보일 상품목록 수 : 30
		
		
		// sort값 계산
		paramMap.put("order", "BOARD_CODE ASC, BOARD_NO ASC");
		if(paramMap.get("sort").equals("1")) {
			paramMap.put("order", "BOARD_CODE ASC, BOARD_NO ASC ");
		}
		if(paramMap.get("sort").equals("2")) {
			paramMap.put("order", "BOARD_CODE ASC, BOARD_NO DESC ");
		}
		if(paramMap.get("sort").equals("3")) {
			paramMap.put("order", "BOARD_CODE ASC, VIEW_COUNT DESC");
		}
		if(paramMap.get("sort").equals("4")) {
			paramMap.put("order", "BOARD_CODE ASC, VIEW_COUNT ASC");
		}
		
		
		// 조건에 맞는 게시글 목록
		List<Board> boardList = dao.boardSearch(pagination, paramMap);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		map.put("allBoardCount", allBoardCount);
		map.put("listCount", listCount);
		
		return map;
	}


	/**
	 * 게시글 삭제
	 */
	@Override
	public int boardDelete(int boardNo) {
		
		return dao.boardDelete(boardNo);
	}

	/**
	 * 게시글 삭제 복구
	 */
	@Override
	public int boardDeleteBack(int boardNo) {
		
		return dao.boardDeleteBack(boardNo);
	}




}
