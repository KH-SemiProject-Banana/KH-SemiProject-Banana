package edu.kh.banana.board.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Board {

    private int boardNo;
    private String boardTitle;
    private String boardContent;
    private String boardCreateDate;
    private String boardUpdateDate;
    private int viewCount;
    private int commentCount;
    private String memberNickname;
    private int memberNo;
    private String profileImage;
    private String thumbnail;
    
    private List<BoardImage> imageList;
    
    private List<Comment> commentList;
    
    
    private int boardCode;
    
}
