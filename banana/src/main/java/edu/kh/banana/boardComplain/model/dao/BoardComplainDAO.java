package edu.kh.banana.boardcomplain.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardComplainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	/** 게시글 신고하기
	 * @param submit
	 * @return
	 */
	public int reportsubmit(Map<String, Object> submit) {
		
		return sqlsession.insert("boardcomplainMapper.reportSubmit", submit);
	}

	
	/** 게시글 신고 중복검사
	 * @param map
	 * @return
	 */
	public int boardDuplication(Map<String, Object> map) {
		
		return sqlsession.selectOne("boardcomplainMapper.boardDuplication",map);
	}

	
}
