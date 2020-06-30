package com.care.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.care.DTO.Board_qaDTO;
import com.care.DTO.Board_qaSearchCriteria;
import com.care.DTO.ReviewDTO;

@Component
public class ReviewDAO {
	private static final String namespace ="com.care.mybatis.Mapper";
	
	@Autowired
	private SqlSession sqlSession;

	public List<ReviewDTO> list(Board_qaSearchCriteria scri) {
		return sqlSession.selectList(namespace+".reviewList",scri);
	}

	public int listCount(Board_qaSearchCriteria scri) {
		
		return sqlSession.selectOne(namespace+".reviewListCount", scri);
	}

	public int insert(ReviewDTO dto) {
		System.out.println("dao");
		System.out.println(dto.getReview_content());
		System.out.println(dto.getReview_image()); 
		System.out.println(dto.getReview_product_image());
		System.out.println(dto.getReview_product_title());
		System.out.println(dto.getReview_score());
		System.out.println(dto.getReview_seq());
		System.out.println(dto.getReview_subject());
		System.out.println(dto.getReview_user_id());
		System.out.println(dto.getClass());
		System.out.println(dto.getReview_logtime());
		return sqlSession.insert(namespace+".reviewSavedata",dto);
	}

	public ReviewDTO read(int review_seq) {
		return sqlSession.selectOne(namespace+".reviewReadView",review_seq);
	}

	public void update(ReviewDTO dto) {
		int i = sqlSession.update(namespace+".reviewUpdate", dto);
	}
	
	public void delete(int review_seq) {
		int i = sqlSession.delete(namespace+".reviewDelete",review_seq);
		System.out.println("리뷰 삭제 결과 값 : "+i);
		System.out.println(review_seq);
	}
	
}
