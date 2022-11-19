package edu.kh.banana.customer.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
