package edu.kh.banana.board.model.service;

import java.util.List;

import edu.kh.banana.board.model.vo.Comment;


public interface CommentService {

	
	/** 댓글 목록 조회
	 * @param boardNo
	 * @return rList
	 */
	List<Comment> selectCommentList(int boardNo);

	
	
	/** 댓글 등록
	 * @param comment
	 * @return result
	 */
	int insertComment(Comment comment);



	/** 댓글 삭제
	 * @param commentNo
	 * @return
	 */
	int deleteComment(int commentNo);



	/** 댓글 수정
	 * @param comment
	 * @return
	 */
	int updateComment(Comment comment);

}
