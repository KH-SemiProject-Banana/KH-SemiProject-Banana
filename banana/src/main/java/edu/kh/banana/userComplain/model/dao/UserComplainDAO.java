package edu.kh.banana.userComplain.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserComplainDAO {

	@Autowired
	SqlSessionTemplate sqlsession;
	
	public int userReportSubmit(Map<String, Object> submit) {
		
		return sqlsession.insert("usercomplainMapper.userreportsubmit", submit);
	}

	// 카테고리 중복검사
	public int userDuplication(Map<String, Object> map) {
		
		return sqlsession.selectOne("usercomplainMapper.userDuplication",map);
	}

	public int userBlock(int memberNo, int userBlocked) {
		
		return sqlsession.insert("usercomplainMapper.userBlock");
	}

}
