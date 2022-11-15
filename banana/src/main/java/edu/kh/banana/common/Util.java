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
}
