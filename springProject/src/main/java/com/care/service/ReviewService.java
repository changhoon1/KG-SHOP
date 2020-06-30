package com.care.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.DAO.ReviewDAO;
import com.care.DTO.Board_qaSearchCriteria;
import com.care.DTO.ReviewDTO;

@Service
public class ReviewService {
	
	@Autowired
	ReviewDAO dao;


	public List<ReviewDTO> list(Board_qaSearchCriteria scri) {
		return dao.list(scri);
	}


	public int listCount(Board_qaSearchCriteria scri) {
		return dao.listCount(scri);
	}


	public int insert(ReviewDTO dto) {
		return dao.insert(dto);
	}


	public ReviewDTO read(int review_seq) {
		return dao.read(review_seq);
	}


	public void update(ReviewDTO dto) {
		dao.update(dto);
	}


	public void delete(int review_seq) {
		dao.delete(review_seq);
	}

}
