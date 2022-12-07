package edu.kh.banana.board.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.banana.board.model.service.BoardService;
import edu.kh.banana.board.model.vo.Board;
import edu.kh.banana.common.Util;
import edu.kh.banana.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	/** 특정 게시판 목록 조회
	 * @param model
	 * @param boardCode
	 * @param cp
	 * @return
	 */
	@GetMapping("/board/{boardCode}")
	public String selectBoardList(Model model,
			@PathVariable("boardCode") int boardCode,
			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
			@RequestParam Map<String, Object> paramMap
			) {
		
		if(paramMap.get("key") == null) { // '검색'이 아닌 경우
			
			Map<String, Object> map = service.selectBoardList(boardCode, cp);
			model.addAttribute("map", map);
		} else {
			
			paramMap.put("boardCode", boardCode); // boardCode, key, query, cp 담겨있음
			Map<String, Object> map = service.selectBoardList(paramMap, cp);
			model.addAttribute("map", map);
		}
		
		
		String path = null;
		if(boardCode == 1) {
			path = "board1";
		} else if(boardCode == 3){
			path = "questionList";
		} else {
			path="boardList";
		}
		
		return "board/" + path;
	}
	
	
	
	
	// 게시글 상세 조회
	@GetMapping("/board/{boardCode}/{boardNo}")
	public String selectBoardDetail(@PathVariable("boardNo") int boardNo,
			@PathVariable("boardCode") int boardCode,
			Model model,
			HttpServletRequest req,
			HttpServletResponse resp) throws ParseException {
		
		// 게시글 상세조회 서비스 호출
		Board board = service.selectBoardDetail(boardNo);
		model.addAttribute("board", board);
		
		// + 조회수 증가(쿠키 이용해서 해당 IP당 하루 1번)
		if(board != null) {
			Cookie[] cookies = req.getCookies();
			Cookie readBoardNo = null;
			
			if(cookies != null) {
				
				for(Cookie temp : cookies) {
					if(temp.getName().equals("readBoardNo")) {
						
						readBoardNo = temp;
					}
				}
			}
			
			int result = 0;
			
			if(readBoardNo == null) { // readBoardNo라는 쿠키가 없다면
				
				result = service.updateReadCount(boardNo);
				
				readBoardNo = new Cookie("readBoardNo", "|" + boardNo + "|");
				
				
			} else {
				
				// 해당하는 게시글번호의 쿠키가 없다면
				if(readBoardNo.getValue().indexOf("|" + boardNo + "|") == -1) {
					
					readBoardNo.setValue(readBoardNo.getValue() + "|" + boardNo + "|");
					result = service.updateReadCount(boardNo);
				}
			}
			// 조회수 증가 성공시 DB와 조회된 board 조회수 동기화
			if(result > 0) {
				
				board.setViewCount(board.getViewCount() + 1);
				readBoardNo.setPath("/");
				
				
				
				// 쿠키 시간 설정(금일 자정까지)
				Date now = new Date(); // 현재시간
				Calendar tomorrow = Calendar.getInstance();
				// Calendar의 time : 기준시간(1970년 1월1일)부터 현재까지 얼마나 지났는지 계산
				
				// cal.add(단위(연월일시분초), 추가할 일수)
				tomorrow.add(tomorrow.DATE, 1); // 날짜에 1추가 => 내일날짜 현재시간
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				// 하루 증가한 내일 날짜의 값을 이용해 date객체 생성
				Date temp = new Date(tomorrow.getTimeInMillis());
				
				// simpleDateFormat 이용해서 시분초 삭제(->내일날짜 00:00)
				Date midnight = sdf.parse(sdf.format(temp));
				
				long diff = midnight.getTime() - now.getTime();
				long sec = diff/1000;
				
				readBoardNo.setMaxAge((int) sec);
				resp.addCookie(readBoardNo);
				
			}
		}
		
		
		
		
		return "board/boardDetail";
	}

	
	
	// 게시글 작성 페이지로 이동
	@GetMapping("/write/{boardCode}")
	public String boardWrite(@PathVariable("boardCode") int boardCode) {
		
		
		return "board/boardWrite";
	}
	
	
	// 게시글 작성
	@PostMapping("/write/{boardCode}")
	public String boardWrite(@PathVariable("boardCode") int boardCode,
			@RequestHeader("referer") String referer,
			Board board,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam(value="images", required=false) List<MultipartFile> imageList,
			RedirectAttributes ra,
			HttpSession session
			
			) throws IOException {
		
		// 1. boardCode를 board객체에 셋팅
//		if(boardCode == 1) {
//			boardCode = 3;
//		}
		board.setBoardCode(boardCode);
		
		// 2. 로그인한 회원의 번호를 board객체에 셋팅
		board.setMemberNo(loginMember.getMemberNo());
		
		// 3. 업로드된 파일의 웹 접근 경로 / 서버 내부 경로 준비
		String webPath = "/resources/images/board/";
		String folderPath = session.getServletContext().getRealPath(webPath);
		
		// 4. 게시글 삽입 서비스 호출
		int boardNo = service.boardWrite(board, imageList, webPath, folderPath);
		
		String message = null;
		String path = null;
		
		if(boardNo > 0) {
			
			message = "게시글이 등록되었습니다.";
			path = "/board/" + boardCode + "/" + boardNo; //   /board/1/2003
			
		} else {
			
			message = "게시글 등록 실패";
			path = referer;
		}
		
		ra.addFlashAttribute("message", message);
		
		
		return "redirect:" + path;
	}
	
	
	
	
	
	
	
	
	// 나의 문의/안내 내역 페이지로 이동
	@GetMapping("/question/myQuestion")
	public String myQuestion(Model model,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam(value="cp", required=false, defaultValue="1") int cp
			) {
		
		int memberNo = loginMember.getMemberNo();
		Map<String, Object> map = service.selectMyQuestion(memberNo, cp);
		
		model.addAttribute("map", map);
		
		
		return "board/myQuestionList";
	}
	
	
	
	// 게시글 수정 화면 전환
	@GetMapping("/board/{boardCode}/{boardNo}/update")
	public String boardUpdate(
			@PathVariable("boardNo") int boardNo,
			@PathVariable("boardCode") int boardCode,
			Model model
			) {
		
		Board board = service.selectBoardDetail(boardNo);
		
		// 개행문자 처리해제
		board.setBoardContent(Util.newLineClear(board.getBoardContent()));
		model.addAttribute("board", board);
		
		return "board/boardUpdate";
	}
	
	
	// 게시글 수정
	@PostMapping("/board/{boardCode}/{boardNo}/update")
	public String boardUpdate(
			@PathVariable("boardCode") int boardCode,
			@PathVariable("boardNo") int boardNo,
			Board board,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp,
			@RequestParam(value="deleteList", required=false) String deleteList, // 삭제된 이미지 순서
			@RequestParam(value="images", required= false) List<MultipartFile> imageList,
			@RequestHeader("referer") String referer,
			HttpSession session,
			RedirectAttributes ra
		) throws IOException {
		
		// 1. board 객체에 boardCode 셋팅
		board.setBoardNo(boardNo);
		
		// 2. 이미지 저장 경로 얻어오기
		String webPath = "/resources/images/board/";
		String folderPath = session.getServletContext().getRealPath(webPath);
		
		// 3. 게시글 수정 서비스 호출
		int result = service.boardUpdate(webPath, folderPath, board, imageList, deleteList);
		
		// 4. 서비스 결과에 따른 응답 제어
		String message = null;
		String path = null;
		
		if(result > 0) {
			
			message = "게시글이 수정되었습니다";
			path = "/board/" + boardCode + "/" + boardNo + "?cp=" + cp; 
			
		} else {
			
			message = "게시글 수정 실패";
			path = referer;
			
		}
		ra.addFlashAttribute("message", message);
		
		return "redirect:" + path;
	}

	
	// 게시글 삭제
	@GetMapping("board/{boardCode}/{boardNo}/delete")
	public String boardDelete(
			@PathVariable("boardCode") int boardCode,
			@PathVariable("boardNo") int boardNo,
			RedirectAttributes ra,
			@RequestHeader("referer") String referer
			) {
		
		int result = service.boardDelete(boardNo);
		
		String message = null;
		String path = null;
		
		if(result >0) {
			
			message = "삭제되었습니다";
			path = "/board/{boardCode}";
			
		} else {
			
			message = "게시글 삭제 실패";
			path = referer;
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:" + path;
	}

}
