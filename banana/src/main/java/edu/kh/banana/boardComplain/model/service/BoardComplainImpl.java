package edu.kh.banana.boardComplain.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.boardComplain.model.dao.BoardComplainDAO;

@Service
public class BoardComplainImpl implements BoardComplainService {

	
	@Autowired
	private BoardComplainDAO dao;
		
}
