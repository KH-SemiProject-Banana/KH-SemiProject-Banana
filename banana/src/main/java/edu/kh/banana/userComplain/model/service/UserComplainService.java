package edu.kh.banana.userComplain.model.service;

import java.util.Map;

public interface UserComplainService {
	
	int userReportSubmit(Map<String, Object> submit);

	int userDuplication(Map<String, Object> map);

}
