package com.emopicture.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.QnaBoardVO;
import com.emopicture.persistence.QnaBoardMapper;

@Service
public class QnaBoardServiceImpl implements QnaBoardService<QnaBoardVO, Integer> {

	@Inject
	private QnaBoardMapper mapper;

	@Override
	public List<QnaBoardVO> listAll() throws Exception {
		return mapper.listAll();
	}

	@Override
	public List<QnaBoardVO> listpage(int page) throws Exception {
		return mapper.listpage(page);
	}

	
	@Transactional
	@Override
	public void create(QnaBoardVO vo) throws Exception {
		mapper.create(vo);
		
		String [] files = vo.getFiles();
	
		if(files == null){
			return;
		}
		
		for(String fileName : files){
			mapper.addAttach(fileName);
		}
	}

	@Override
	public QnaBoardVO read(Integer bno) throws Exception {
		return mapper.read(bno);
	}

	@Transactional
	@Override
	public void delete(Integer bno) throws Exception {
		mapper.deleteAttach(bno);
		mapper.delete(bno);
	}

	@Transactional
	@Override
	public void update(QnaBoardVO vo) throws Exception {
		mapper.update(vo);
		
		Integer bno = vo.getBno();
		mapper.deleteAttach(bno);
		String[] files = vo.getFiles();
		if(files == null){
			return;
		}
		for(String fileName : files){
			mapper.replaceAttach(bno, fileName);
		}
	}

	@Override
	public void hit(Integer bno) throws Exception {
			mapper.hit(bno);
	}

	@Override
	public int totalcount() throws Exception {
		return mapper.totalcount();
		
	}
	

	@Override
	public List<QnaBoardVO> search(Criteria cri) throws Exception {
		return mapper.search(cri);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		return mapper.getAttach(bno);
	}




}