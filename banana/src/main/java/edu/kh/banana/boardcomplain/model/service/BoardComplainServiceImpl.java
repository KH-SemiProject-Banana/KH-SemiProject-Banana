package edu.kh.banana.boardcomplain.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.boardcomplain.model.dao.BoardComplainDAO;


@Service
public class BoardComplainServiceImpl implements BoardComplainService {

	@Autowired
	private BoardComplainDAO dao;

	// 게시글 신고하기
	@Override
	public int reportsubmit(Map<String, Object> submit) {
		
		return dao.reportsubmit(submit);
	}

	// 게시글 신고 중복성 검사
	@Override
	public int boardDuplication(Map<String, Object> map) {
		
		return dao.boardDuplication(map);
	}


	}

