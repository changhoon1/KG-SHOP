package com.care.DAO;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import com.care.DTO.MemberDTO;
import com.care.DTO.ProductnameDTO;


@Repository
public class MemberDAO {

	private static final String namespace = "com.care.mybatis.Mapper";
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	public MemberDAO() {
		
	}
	
	
	public void updatedata(MemberDTO dto) throws SQLException {
		 sqlSession.update(namespace+".updatedata",dto);
	
	}


	public void savedata(MemberDTO dto) {
		sqlSession.insert(namespace+".input",dto);
	}

	public MemberDTO logincheck(MemberDTO dto) throws Exception{
		return sqlSession.selectOne(namespace+".logincheck",dto);
	}

	public int idChk(MemberDTO dto)throws Exception{
		return sqlSession.selectOne(namespace+".idChk",dto);
	}


	public MemberDTO list(String id) throws Exception{
		return sqlSession.selectOne(namespace+".memberlist",id);
	}

	public List<ProductnameDTO> bestView(){
		return sqlSession.selectList(namespace+".bestView");
		
	}


	
	
	
}
