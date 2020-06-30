package com.care.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.care.DAO.Board_qaDAO;
import com.care.DTO.Board_qaDTO;
import com.care.DTO.Board_qaSearchCriteria;
import com.care.DTO.board_qaReplyDTO;

@Service
public class Board_qaServiceimpl implements Board_qaService{
	
	@Autowired
	Board_qaDAO dao;
	
	@Override
	public int execute(Model model) {
		return 0;
	}
	//게시물 작성
	@Override
	public int Board_qaInsert(Board_qaDTO dto) {
		int i = dao.insert(dto);
		return i;
	}
	//게시물 목록 조회
	@Override
	public List<Board_qaDTO> list(Board_qaSearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	//게시물 총 개수
	@Override
	public int listCount(Board_qaSearchCriteria scri) throws Exception{
		return dao.listCount(scri);
	}
	
	// 게시물 조회
	@Override
	public Board_qaDTO read(int qa_seq) throws Exception {
			return dao.read(qa_seq);
	}
	//게시물 수정
	@Override
	public void update(Board_qaDTO dto) throws Exception {
		dao.update(dto);
	}
	//게시물 삭제
	@Override
	public void delete(int qa_seq) throws Exception {
		dao.delete(qa_seq);
	}
	
	//댓글조회
	@Override
	public List<board_qaReplyDTO> readReply(int qa_seq) throws Exception{
		return dao.readReply(qa_seq);
	}
	
	//댓글작성
	@Override
	public void writeReply(board_qaReplyDTO dto) throws Exception{
		dao.writeReply(dto);
	}
	//댓글수정
	@Override
	public void updateReply(board_qaReplyDTO dto) throws Exception {
		dao.updateReply(dto);
	}
	//댓글삭제
	@Override
	public void deleteReply(board_qaReplyDTO dto) throws Exception {
		dao.deleteReply(dto);
	}
	//선택된 댓글 조회
	@Override
	public board_qaReplyDTO selectReply(int qa_reply_seq) throws Exception {
		return dao.selectReply(qa_reply_seq);
	}
	
}
