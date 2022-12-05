package edu.kh.banana.manager.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.banana.board.model.vo.Pagination;
import edu.kh.banana.member.model.vo.Member;

@Repository
public class ManagerDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member login(String memberEmail) {
		
		return sqlSession.selectOne("memberMapper.managerLogin", memberEmail);
	}

	/** 회원 목록 조회
	 * @param paramMap
	 * @return memberList
	 */
	public List<Member> memberSearch(Pagination pagination, Map<String , Object> paramMap) {
		
		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("memberMapper.admin-memberSearch", paramMap, rowBounds);
	}

	/** 전체 회원 수 조회
	 * @return
	 */
	public int memberCount() {
		
		return sqlSession.selectOne("memberMapper.memberCount");
	}

	/** 특정 조건 회원 수 조회
	 * @param paramMap
	 * @return
	 */
	public int getMemberListCount(Map<String, Object> paramMap) {
		
		return sqlSession.selectOne("memberMapper.getMemberListCount", paramMap);
	}

}
