package com.emopicture.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.RefBoardVO;

@Repository
public class RefBoardMapperImpl extends AbstractCRUDMapper<RefBoardVO, Integer> implements RefBoardMapper {

	@Override
	public List<RefBoardVO> listpage(int page) throws Exception {

		return session.selectList(namespace+".listpage",page);
	}

	@Override
	public void viewcnt(Integer bno) throws Exception {
		
		session.update(namespace+".viewcnt",bno);
		
	}

	@Override
	public int totalcount() throws Exception {
		return session.selectOne(namespace+".totalcount");
		
	}

	@Override
	public List<RefBoardVO> search(Criteria cri) throws Exception {
		return session.selectList(namespace+".search",cri);
	}

	@Override
	public void updatereply(Integer bno) throws Exception {
		session.update(namespace+".updatereply", bno);
		
	}

	@Override
	public void attyn(Integer bno) throws Exception {
		session.update(namespace+ ".attyn", bno);
		
	}

	@Override
	public void addAttach(String fullName) throws Exception {
		session.insert(namespace+ ".addAttach", fullName);
		
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
	public void replaceAttach(String fullName, Integer bno) throws Exception {
		 Map<String, Object> paramMap = new HashMap<String, Object>();
		    
		    paramMap.put("bno", bno);
		    paramMap.put("fullName", fullName);
		    
		    session.insert(namespace+".replaceAttach", paramMap);
		
	}





}
