package com.emopicture.persistence;

import java.util.List;

import com.emopicture.domain.RefBoardVO;
import com.emopicture.domain.Criteria;

public interface RefBoardMapper extends CRUDMapper<RefBoardVO, Integer> {

	public List<RefBoardVO> listpage(int page) throws Exception;
	
	public void viewcnt(Integer bno)throws Exception;
	
	public int totalcount() throws Exception;
	
	public List<RefBoardVO> search(Criteria cri) throws Exception;
	
	public void updatereply(Integer bno) throws Exception;
	
	public void attyn(Integer bno)throws Exception;
	
	public void addAttach(String fullName)throws Exception;
	
	public List<String> getAttach(Integer bno)throws Exception;
	
	public void deleteAttach(Integer bno) throws Exception;
	  
	public void replaceAttach(String fullName, Integer bno)throws Exception;
	
}
