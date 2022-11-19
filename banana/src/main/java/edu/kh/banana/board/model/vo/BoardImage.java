package edu.kh.banana.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class BoardImage {

	   private int imageNo;
	   private String imagePath;
	   private String imageRename;
	   private String imageOriginal;
	   private int imageOrder;
	   private int boardNo;
}
