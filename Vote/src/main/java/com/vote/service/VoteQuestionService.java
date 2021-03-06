package com.vote.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.result.domain.ResultVO;
import com.vote.domain.VoteQuestionVO;

public interface VoteQuestionService {
	
	public void createQuestion(HttpServletRequest request, String uploadPath, int idx) throws Exception;
	  
	public List<VoteQuestionVO> readQuestion(Integer v_idx) throws Exception;
	
	public void updateQuestion(HttpServletRequest request, String uploadPath, int idx) throws Exception;
	  
	public void deleteQuestion(Integer v_idx) throws Exception;
	  
	public void deleteChoice(VoteQuestionVO vo) throws Exception;
	
	public String uploadFile(String originalName, byte[] fileData, String uploadPath) throws Exception; 
	
}