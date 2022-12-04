package edu.kh.banana.userComplain.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.userComplain.model.dao.UserComplainDAO;

@Service
public class UsercomplainServiceImpl implements UserComplainService {
	
	@Autowired
	private UserComplainDAO dao;

	@Override
	public int userReportSubmit(Map<String, Object> submit) {
		
		return dao.userReportSubmit(submit);
	}

	@Override
	public int userDuplication(Map<String, Object> map) {
		
		return dao.userDuplication(map);
	}

}
