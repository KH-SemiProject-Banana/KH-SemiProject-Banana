package edu.kh.banana.chatting.model.service;

import java.util.List;
import java.util.Map;


import edu.kh.banana.chatting.model.vo.ChattingRoom;
import edu.kh.banana.chatting.model.vo.Message;
import edu.kh.banana.goods.model.vo.GoodsSell;

public interface ChattingService {

	
	/** 기존 채팅방이 있는지 확인
	 * @param map
	 * @return chattingNo
	 */
	int checkChattingNo(Map<String, Integer> map);

	/** 채팅방 생성
	 * @param map
	 * @return chattingNo
	 */
	int createChattingRoom(Map<String, Integer> map);

	
	
	/** 채팅 화면
	 * @param memberNo
	 * @return roomList
	 */
	List<ChattingRoom> selectRoomList(int memberNo);

	
    /** 메세지 삽입
     * @param msg
     * @return result
     */
    int insertMessage(Message msg);

    /** 읽음 처리
     * @param paramMap
     * @return result
     */
    int updateReadFlag(Map<String, Object> paramMap);

    /** 특정 채팅방 메세지 목록 조회
     * @param paramMap
     * @return messageList
     */
    List<Message> selectMessageList( Map<String, Object> paramMap);

	/** 상품정보을 비동기로 조회
	 * @param goodsNo
	 * @return  selectProductInfor
	 */
	GoodsSell selectProductInfor(int goodsNo);

}
