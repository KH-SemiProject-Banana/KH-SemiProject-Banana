package edu.kh.banana.goods;

// 상품등록 중 예외발생시 처리되는 예외
public class GoodsWriteException extends RuntimeException{
	
	public GoodsWriteException() {
		// TODO Auto-generated constructor stub
	}
	
	
	public GoodsWriteException(String message) {
		super(message);
	}
	
	

}
