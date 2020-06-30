package com.care.service;

import java.util.List;
import org.springframework.ui.Model;
import com.care.DTO.Board_qaDTO;
import com.care.DTO.Board_qaSearchCriteria;
import com.care.DTO.board_qaReplyDTO;

public interface Board_qaService {

	int execute(Model model);

	int Board_qaInsert(Board_qaDTO dto);

	void update(Board_qaDTO dto) throws Exception;

	void delete(int qa_seq) throws Exception;

	int listCount(Board_qaSearchCriteria scri) throws Exception;

	List<Board_qaDTO> list(Board_qaSearchCriteria scri) throws Exception;

	Board_qaDTO read(int qa_seq) throws Exception;

	List<board_qaReplyDTO> readReply(int qa_seq) throws Exception;

	void writeReply(board_qaReplyDTO dto) throws Exception;

	public void updateReply(board_qaReplyDTO dto) throws Exception;
	
	public void deleteReply(board_qaReplyDTO dto) throws Exception;
	
	public board_qaReplyDTO selectReply(int qa_reply_seq) throws Exception;
	
}