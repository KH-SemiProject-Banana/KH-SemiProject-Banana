package edu.kh.banana.manager.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.banana.board.model.vo.Board;
import edu.kh.banana.member.model.vo.Member;

@Repository
public class ManagerDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member login(String memberEmail) {
		
		return sqlSession.selectOne("memberMapper.managerLogin", memberEmail);
	}

	/** 고객센터-자주묻는 질문 추가
	 * @param board
	 * @return result
	 */
	public int editBoard1(Board board) {
		
		return sqlSession.insert("boardMapper.boardWrite", board);
	}

}
