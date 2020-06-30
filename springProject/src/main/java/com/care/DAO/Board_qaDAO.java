
package com.care.DAO;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.care.DTO.Board_qaDTO;
import com.care.DTO.board_qaReplyDTO;
import com.care.DTO.Board_qaSearchCriteria;

@Repository
public class Board_qaDAO {
	private static final String namespace ="com.care.mybatis.Mapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	//게시물 추가
	public int insert(Board_qaDTO dto) {
		int i = sqlSession.insert(namespace+".savedata",dto);
		return i;
	}
	//게시물 목록 조회
	public List<Board_qaDTO> list(Board_qaSearchCriteria scri) throws Exception {
		return sqlSession.selectList(namespace+".listPage",scri);
	}
	//게시물 숫자 카운트Board_qaReplyDTO
	public int listCount(Board_qaSearchCriteria scri) throws Exception{
		return sqlSession.selectOne(namespace+".listCount", scri);
	}
	//게시물 조회
	public Board_qaDTO read(int qa_seq) {
		return sqlSession.selectOne(namespace+".read",qa_seq);
	}
	// 게시물 수정
	public void update(Board_qaDTO dto) throws Exception {
		System.out.println("게시글 조회 번호"+dto.getQa_seq());
		int i = sqlSession.update(namespace+".update", dto);
		System.out.println("수정 결과 값"+i);
	}
	// 게시물 삭제
	public void delete(int qa_seq) throws Exception {
		sqlSession.delete(namespace+".delete",qa_seq);
	}
	//댓글조회
	public List<board_qaReplyDTO> readReply(int qa_seq) throws Exception{
		return sqlSession.selectList(namespace+".readReply", qa_seq);
	}
	//댓글작성
	public void writeReply(board_qaReplyDTO dto) {
		int i = sqlSession.insert(namespace+".writeReply", dto);
		System.out.println("댓글작성 insert결과값 : "+i);
	}
	//댓글 수정
	public void updateReply(board_qaReplyDTO dto) throws Exception {
		int i = sqlSession.update(namespace+".updateReply",dto);
		System.out.println("댓글수정 결과 값 : "+i);
		
	}
	//댓글 삭제
	public void deleteReply(board_qaReplyDTO dto) throws Exception	{
		 sqlSession.delete(namespace+".deleteReply",dto);
	}
	//선택된 댓글 조회
	public board_qaReplyDTO selectReply(int qa_reply_seq) throws Exception	{
		return sqlSession.selectOne(namespace+".selectReply", qa_reply_seq);
	}
}
