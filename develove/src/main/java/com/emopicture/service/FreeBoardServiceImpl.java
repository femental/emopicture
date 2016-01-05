package com.emopicture.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.emopicture.domain.FreeBoardVO;
import com.emopicture.domain.Criteria;
import com.emopicture.persistence.FreeBoardMapper;

@Service
public class FreeBoardServiceImpl implements FreeBoardService<FreeBoardVO, Integer> {

	@Inject
	private FreeBoardMapper mapper;

	@Override
	public List<FreeBoardVO> listAll() throws Exception {
		return mapper.listAll();
	}

	@Override
	public List<FreeBoardVO> listpage(int page) throws Exception {
		return mapper.listpage(page);
	}

	@Override
	public void create(FreeBoardVO vo) throws Exception {
		mapper.create(vo);
	}

	@Override
	public FreeBoardVO read(Integer bno) throws Exception {
		return mapper.read(bno);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		mapper.delete(bno);
	}

	@Override
	public void update(FreeBoardVO vo) throws Exception {
		mapper.update(vo);
	}

	@Override
	public void hit(Integer bno) throws Exception {
			mapper.viewcnt(bno);
	}

	@Override
	public int totalcount() throws Exception {
		return mapper.totalcount();
		
	}
	

	@Override
	public List<FreeBoardVO> search(Criteria cri) throws Exception {
		return mapper.search(cri);
	}

	@Override
	public int listSearchCount(Criteria cri) throws Exception {
		
		return mapper.listSearchCount(cri);
	}




}