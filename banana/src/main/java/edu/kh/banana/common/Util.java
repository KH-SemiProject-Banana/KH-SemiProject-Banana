package edu.kh.banana.common;

import java.text.SimpleDateFormat;

public class Util {

	public static String fileRename(String originalFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String data = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int) (Math.random() * 100000);
		String str = "_" + String.format("%05d", ranNum);
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		return data + str + ext;
		// ex) 20221114123411_12345.png
	}
	

	
	// XSS 방지 처리 : HTML에서 해석되는 문자를 단순 글자로 변경
	public static String XSSHandling(String content) {
		
		if(content != null) {
			
			content = content.replaceAll("&", "&amp;");
			content = content.replaceAll("<", "&lt;");
			content = content.replaceAll(">", "&gt;");
			content = content.replaceAll("\"", "&quot;");
		}
		
		return content;
	}
	
	
	// 개행문자 처리 : \r\n,    \n,    \r,   \n\r
	public static String newLineHandling(String content) {
		
		if(content != null) {
			
			content = content.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		}
		
		return content;
	}
	
	
	// 개행문자처리 해제
	public static String newLineClear(String content) {
		
		return content.replaceAll("<br>", "\n");
	}
}
