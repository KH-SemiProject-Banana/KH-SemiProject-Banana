package edu.kh.banana.boardComplain.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardComplainDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
