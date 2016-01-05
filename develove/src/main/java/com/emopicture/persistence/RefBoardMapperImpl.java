package com.emopicture.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.emopicture.domain.RefBoardVO;
import com.emopicture.domain.Criteria;

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





}
