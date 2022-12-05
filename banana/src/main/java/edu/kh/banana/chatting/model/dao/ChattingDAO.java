package edu.kh.banana.chatting.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.banana.chatting.model.vo.ChattingRoom;
import edu.kh.banana.chatting.model.vo.Message;
import edu.kh.banana.goods.model.vo.GoodsSell;

@Repository
public class ChattingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	/** 기존 채팅방이 있는지 확인
	 * @param map
	 * @return chattingNo
	 */
	public int checkChattingNo(Map<String, Integer> map) {
	        return sqlSession.selectOne("chattingMapper.checkChattingNo", map);
	}

    /** 채팅방 생성
     * @param map
     * @return chattingNo
     */
    public int createChattingRoom(Map<String, Integer> map) {
        int result = sqlSession.insert("chattingMapper.createChattingRoom", map);
        int chattingNo = 0;
        if(result > 0)  chattingNo = (int)map.get("chattingNo");
        return chattingNo;
    }
    
    /** 참여중인 채팅방
     * @param memberNo
     * @return roomList
     */
    public List<ChattingRoom> selectRoomList(int memberNo) {
        return sqlSession.selectList("chattingMapper.selectRoomList", memberNo);
	}
    
    /** 메세지 삽입
     * @param msg
     * @returnresult
     */
    public int insertMessage(Message msg) {
        return sqlSession.insert("chattingMapper.insertMessage", msg);
    }

    /** 읽음 처리
     * @param paramMap
     * @return result
     */
    public int updateReadFlag(Map<String, Object> paramMap) {
        return sqlSession.update("chattingMapper.updateReadFlag", paramMap);
    }

    /** 특정 채팅방 메세지 목록 조회
     * @param chattingNo
     * @return messageList
     */
    public List<Message> selectMessageList(int chattingNo) {
       return sqlSession.selectList("chattingMapper.selectMessageList", chattingNo);
    }

	/** 상품정보을 비동기로 조회
	 * @param goodsNo
	 * @return selectProductInfor
	 */
	public GoodsSell selectProductInfor(int goodsNo) {
		return sqlSession.selectOne("goodsMapper.selectProductInfor",goodsNo);
	}
    
    
    
}
