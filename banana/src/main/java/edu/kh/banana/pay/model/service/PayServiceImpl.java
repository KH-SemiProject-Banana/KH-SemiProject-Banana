package edu.kh.banana.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.pay.model.dao.PayDAO;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	private PayDAO dao;

}
