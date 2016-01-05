package com.emopicture.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.QnaBoardVO;

@Repository
public class QnaBoardMapperImpl extends AbstractCRUDMapper<QnaBoardVO, Integer> implements QnaBoardMapper {

	@Override
	public List<QnaBoardVO> listpage(int page) throws Exception {

		return session.selectList(namespace+".listpage",page);
	}

	@Override
	public void hit(Integer bno) throws Exception {
		
		session.update(namespace+".hit",bno);
		
	}

	@Override
	public int totalcount() throws Exception {
		return session.selectOne(namespace+".totalcount");
		
	}

	@Override
	public List<QnaBoardVO> search(Criteria cri) throws Exception {
		return session.selectList(namespace+".search",cri);
	}

	@Override
	public void updatereplyanswer(Integer bno) throws Exception {
		session.update(namespace+".updateansweryn", bno);
		
	}
	@Override
	public void updatereplycnt(Integer bno) throws Exception{
		session.update(namespace+".updatereplycnt", bno);
	}

	@Override
	public void addAttach(String fullName) throws Exception {
		session.insert(namespace+".addAttach", fullName);	
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		return session.selectList(namespace+".getAttach", bno);	
	}

	@Override
	public void deleteAttach(Integer bno) throws Exception {
		session.delete(namespace+".deleteAttach", bno);	
	}

	@Override
	public void replaceAttach(Integer bno, String fullName) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bno", bno);
		paramMap.put("fullName", fullName);
		
		session.insert(namespace+".replaceAttach", bno);	
	}

}
