package com.emopicture.persistence;

import java.util.List;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.QnaBoardVO;

public interface QnaBoardMapper extends CRUDMapper<QnaBoardVO, Integer> {

	public List<QnaBoardVO> listpage(int page) throws Exception;
	
	public void hit(Integer bno)throws Exception;
	
	public int totalcount() throws Exception;
	
	public List<QnaBoardVO> search(Criteria cri) throws Exception;
	
	public void updatereplyanswer(Integer bno) throws Exception;
	
	public void updatereplycnt(Integer bno) throws Exception;
	
	public void addAttach(String fullName) throws Exception;

	public List<String> getAttach(Integer bno) throws Exception;

	public void deleteAttach(Integer bno) throws Exception;

	public void replaceAttach(Integer bno, String fullName) throws Exception;
}
