package edu.kh.banana.chatting.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.banana.chatting.model.service.ChattingService;
import edu.kh.banana.chatting.model.vo.ChattingRoom;
import edu.kh.banana.chatting.model.vo.Message;
import edu.kh.banana.goods.model.vo.GoodsSell;
import edu.kh.banana.member.model.vo.Member;


@Controller
public class ChattingController {

	@Autowired
	private ChattingService service;
	
	
	// 채팅방 입장
    @GetMapping("/chatting/enter")
    public String chattingEnter(int targetNo,int goodsNo, RedirectAttributes ra,
            @SessionAttribute("loginMember") Member loginMember) {
     
    	// targetNo : 상대방 회원 번호
    	// loginMemberNo : 현재 로그인한 회원 번호(본인)
    	
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("targetNo", targetNo); //판매자 번호
        map.put("goodsNo", goodsNo); // 상품
        map.put("loginMemberNo", loginMember.getMemberNo());
        
        // 기존 채팅방이 있는지 확인
        int chattingNo = service.checkChattingNo(map);
        
        // 기존 채팅방이 없다면
        if(chattingNo == 0) {
        	
        	// 새로운 채팅방 생성 후 채팅방 번호 반환
            chattingNo = service.createChattingRoom(map);
        }
        
        ra.addFlashAttribute("chattingNo", chattingNo);
        
        return "redirect:/chatting";
    }
    
    
    
    // 채팅 화면으로 이동
    @GetMapping("/chatting")
    public String chatting(@SessionAttribute("loginMember") Member loginMember, Model model) {
        
        List<ChattingRoom> roomList = service.selectRoomList(loginMember.getMemberNo());
        model.addAttribute("roomList", roomList);
//        return "chatting/chatting";
		return "chatting/BananaTalk"; 
    }
    
    // 메세지 목록을 비동기 조회
    @GetMapping("/chatting/selectMessage")
    @ResponseBody
    public String selectMessageList(@RequestParam Map<String, Object> paramMap) {
        System.out.println(paramMap);
        List<Message> messageList = service.selectMessageList(paramMap);
        //맵으로 조회 2개 가져가기 
        return new Gson().toJson(messageList);
    }
    
    // 수정중
    // 상품정보을 비동기로 조회
    @GetMapping("/chatting/selectProductInfor")
    @ResponseBody
    public String selectProductInfor(int goodsNo) {
       
    	//Map<String, Object> selectProductInfor = service.selectProductInfor(goodsNo);
    	GoodsSell selectProductInfor = service.selectProductInfor(goodsNo);
       
        return new Gson().toJson(selectProductInfor);
    }
    
    
    
    
    // 채팅 방 목록을 비동기 조회
    @GetMapping("/chatting/roomList")
    @ResponseBody
    public String selectRoomList(int memberNo) {
        
        List<ChattingRoom> roomList = service.selectRoomList(memberNo);
        return new Gson().toJson(roomList);
    }
    
    // 읽음 비동기 처리
    @GetMapping("/chatting/updateReadFlag")
    @ResponseBody
    public int updateReadFlag(@RequestParam Map<String, Object> paramMap) {
        return service.updateReadFlag(paramMap);
    }
    
    
}

