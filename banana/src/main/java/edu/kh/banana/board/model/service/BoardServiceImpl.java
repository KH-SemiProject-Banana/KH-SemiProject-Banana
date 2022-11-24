package edu.kh.banana.board.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.banana.board.model.dao.BoardDAO;
import edu.kh.banana.board.model.vo.Board;
import edu.kh.banana.board.model.vo.BoardImage;
import edu.kh.banana.board.model.vo.Pagination;
import edu.kh.banana.common.Util;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO dao;

	/**
	 * 특정 게시판 목록 조회 + 페이징 처리 계산
	 */
	@Override
	public Map<String, Object> selectBoardList(int boardCode, int cp) {
		
		// 1. 특정 게시판의 전체 게시글 수 조회
		// 2. 전체 게시글 수 + cp(current page)를 이용해 페이징처리 객체 생성
		// 3. 페이징 처리 객체를 이용해서 게시글 목록 조회
		
		int listCount = dao.getListCount(boardCode);
		Pagination pagination = new Pagination(listCount, cp);
		List<Board> boardList = dao.selectBoardList(pagination, boardCode);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		
		
		return map;
	}

	/**
	 * 게시판 타입 조회
	 */
	@Override
	public List<Map<String, Object>> selectBoardType() {

		return dao.selectBoardType();
	}

	/**
	 * 게시글 상세조회 + 댓글 목록 조회
	 */
	@Override
	public Board selectBoardDetail(int boardNo) {
		
		return dao.selectBoardDetail(boardNo);
	}

	/**
	 * 게시글 작성
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int boardWrite(Board board, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException {
		

		// 1. 게시글만 삽입
		// 		1) XSS(크로스 사이트 스크립트 공격), 개행문자 처리
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));
		
		board.setBoardContent(Util.newLineHandling(board.getBoardContent()));
		
		// 2. 게시글 삽입 DAO 호출 후 결과로 삽입된 게시글 번호 반환받기(mybatis)
		int boardNo = dao.boardWrite(board);
		
		
		// 2. 이미지만 삽입
		if(boardNo > 0) {
			
			
			List<BoardImage> boardImageList = new ArrayList<>();
			List<String> renameList = new ArrayList<>();
			
			
			for(int i = 0; i < imageList.size(); i++) {
				
				if(imageList.get(i).getSize() > 0) {
					
					// boardImage 객체 생성
					BoardImage img = new BoardImage();
					
					// 값 셋팅
					img.setImagePath(webPath);
					
					// 업로드된 이미지의 원본파일명을 변경된 파일명으로 변경
					String rename = Util.fileRename(imageList.get(i).getOriginalFilename());
					img.setImageRename(rename);
					renameList.add(rename);
					
					// 원본 파일명
					img.setImageOriginal(imageList.get(i).getOriginalFilename());
					img.setBoardNo(boardNo);
					img.setImageOrder(i);
					boardImageList.add(img);
				}
			}
			
			// boardImageList가 비어있지 않다면(업로드된 파일이 있어서 분류된 내용이 존재)
			if(!boardImageList.isEmpty()) {
				
				// DB에 업로드된 파일 정보 INSERT
				int result = dao.insertBoardImageList(boardImageList);
				
				if(result == boardImageList.size()) { // 전부 다 삽입된 경우
					
					// 파일로 변환작업
					for(int i = 0; i < result; i++) {
						
						int index = boardImageList.get(i).getImageOrder();
						
						// 실제 파일로 변환
						// 실제 업로드된 파일 중 1번 인덱스에 있는 파일을 
						//folderPath + renameList에서 0번 인덱스를 얻어와 대입함
						imageList.get(index).transferTo(new File(folderPath + renameList.get(i)));
					}
					
					
				} else {
					
				}
			}
		}
		
		
		return boardNo;
	}

	/**
	 * 나의 문의/안내내역 조회
	 */ 
	@Override
	public Map<String, Object> selectMyQuestion(int memberNo, int cp) {
		
		// 1. 특정 게시판의 전체 게시글 수 조회
		// 2. 전체 게시글 수 + CP(current Page)를 이용해 페이징처리 객체 생성
		// 3. 페이징처리 객체를 이용해 게시글 목록 조회
		

		int listCount = dao.getMyQuestionListCount(memberNo);
		Pagination pagination = new Pagination(listCount, cp);
		List<Board> boardList = dao.selectMyQuestionList(pagination, memberNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		
		return map;
	}

	/**
	 * 게시글 상세페이지 조회수 증가
	 */
	@Override
	public int updateReadCount(int boardNo) {
		
		return dao.updateReadCount(boardNo);
	}
}
