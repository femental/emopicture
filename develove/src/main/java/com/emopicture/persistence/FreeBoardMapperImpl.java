package com.emopicture.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.emopicture.domain.FreeBoardVO;
import com.emopicture.domain.Criteria;

@Repository
public class FreeBoardMapperImpl extends AbstractCRUDMapper<FreeBoardVO, Integer> implements FreeBoardMapper {

	@Override
	public List<FreeBoardVO> listpage(int page) throws Exception {

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
	public List<FreeBoardVO> search(Criteria cri) throws Exception {
		return session.selectList(namespace+".search",cri);
	}

	@Override
	public void updatereply(Integer bno) throws Exception {
		session.update(namespace+".updatereply", bno);
		
	}

	@Override
	public int listSearchCount(Criteria cri) throws Exception {
		
		return session.selectOne(namespace+".listSearchCount",cri);
	}
	
	


}
