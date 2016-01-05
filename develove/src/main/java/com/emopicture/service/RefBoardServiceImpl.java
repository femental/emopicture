package com.emopicture.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.RefBoardVO;
import com.emopicture.persistence.RefBoardMapper;

@Service
public class RefBoardServiceImpl implements RefBoardService<RefBoardVO, Integer> {

	@Inject
	private RefBoardMapper mapper;

	@Override
	public List<RefBoardVO> listAll() throws Exception {
		return mapper.listAll();
	}

	@Override
	public List<RefBoardVO> listpage(int page) throws Exception {
		return mapper.listpage(page);
	}


	@Override
	public RefBoardVO read(Integer bno) throws Exception {
		return mapper.read(bno);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		mapper.delete(bno);
	}

	@Override
	public void update(RefBoardVO vo) throws Exception {
		mapper.update(vo);
	}

	@Override
	public void viewcnt(Integer bno) throws Exception {
			mapper.viewcnt(bno);
	}

	@Override
	public int totalcount() throws Exception {
		return mapper.totalcount();
		
	}
	

	@Override
	public List<RefBoardVO> search(Criteria cri) throws Exception {
		return mapper.search(cri);
	}

	
	@Override
	public void attyn(Integer bno) throws Exception {
		 mapper.attyn(bno);
		
	}

	@Transactional
	@Override
	public void create(RefBoardVO vo) throws Exception {
		mapper.create(vo);
		String[] files=vo.getFiles();
		
		if(files == null) {return;}
		for(String fileName : files){
			mapper.addAttach(fileName);
		}
		
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {

		return mapper.getAttach(bno);
	}




}