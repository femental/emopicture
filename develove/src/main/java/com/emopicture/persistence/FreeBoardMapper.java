package com.emopicture.persistence;

import java.util.List;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.FreeBoardVO;

public interface FreeBoardMapper extends CRUDMapper<FreeBoardVO, Integer> {

	public List<FreeBoardVO> listpage(int page) throws Exception;
	
	public void viewcnt(Integer bno)throws Exception;
	
	public int totalcount() throws Exception;
	
	public List<FreeBoardVO> search(Criteria cri) throws Exception;
	
	public void updatereply(Integer bno) throws Exception;
	
	public int listSearchCount(Criteria cri)throws Exception;
	


}
