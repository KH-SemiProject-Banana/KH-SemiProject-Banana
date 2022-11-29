package edu.kh.banana.common.scheduling;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import edu.kh.banana.board.model.service.BoardService;

@Component
public class ImageDeleteScheduling {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private ServletContext application;
	
	// 로그를 출력하는 객체 얻어오기
	private Logger logger = LoggerFactory.getLogger(ImageDeleteScheduling.class);

	
	@Scheduled(cron = "* * 0/1 * * *") // 1시간마다 실행
	public void deleteBoardImageFile() {
		
		// 1. DB에서 BOARD_IMG 테이블의 모든 이미지 변경명을 조회
		List<String> dbList = service.selectImageList();
		
		// 2. server에 저장된 모든 이미지 파일 조회
		String folderPath = application.getRealPath("/resources/images/board");
		;
		// 		- 지정된 경로에 존재하는 모든 파일 목록을 배열로 반환
		File[] arr = new File(folderPath).listFiles();
		
		//		- 배열->list로 반환
		List<File> fileList = Arrays.asList(arr);
		
		// 3. 둘을 비교하여 Server 이미지 목록 중 DB에 없는 이미지를 삭제
		if(!fileList.isEmpty()) {
			
			for(File file : fileList) {
				
				file.toString();
				
				String fileName = file.getName();
				if(dbList.indexOf(fileName) == -1) { // dbList에서 fileName과 일치하는 파일명이 없다면
					
					// ==  서버에는 있는데 DB에는 없는 파일
					logger.info(fileName + " 삭제");
					
					file.delete();
					
				}
			}
		}
		logger.info("이미지 파일 삭제 스케줄링 완료");
	}
	
	
}
