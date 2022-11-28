package edu.kh.banana.boardcomplain.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.boardcomplain.model.dao.BoardComplainDAO;

@Service
public class BoardComplainServiceimpl implements BoardComplainService {

	@Autowired
	private BoardComplainDAO dao;

	// 게시글 신고하기
	@Override
	public int reportsubmit(Map<String, Object> submit) {
		
		return dao.reportsubmit(submit);
	}


	}

