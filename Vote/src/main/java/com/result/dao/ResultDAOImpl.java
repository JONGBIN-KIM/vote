package com.result.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.result.domain.ResultVO;

@Repository
public class ResultDAOImpl implements ResultDAO{
	
	final String namespace = "com.result.mapper.resultMapper";
	
	@Autowired
	SqlSession sqlSession;
	
	public List<ResultVO> readResult(int vIdx){
		return sqlSession.selectList(namespace+".readResultList");
	}
}
