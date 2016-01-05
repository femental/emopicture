package com.emopicture.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.PageMaker;
import com.emopicture.domain.ReplyVO;
import com.emopicture.service.QnaReplyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class QnaReplyMapperTest {

	
	protected static final Logger logger = LoggerFactory.getLogger(QnaBoardMapperTest.class);

	@Autowired
	private QnaReplyService service;
	
	private ReplyVO vo;
	

	@Test
	public void createTest() throws Exception{
		vo = new ReplyVO();
		vo.setReplytext("Test");
		vo.setReplyer("Test");
		vo.setBno(314);
		service.create(vo);
	}
	
	@Test
	public void listTest() throws Exception{
		service.list(314);
	}
	
	@Test
	public void updateTest() throws Exception{
		vo = new ReplyVO();
		vo.setReplytext("업데이트 테스트");
		vo.setReplyer("JUNE");
		vo.setRno(33);
		service.update(vo);
	}
	
	@Test
	public void deleteTest() throws Exception{
		service.delete(2);
	}
	
	@Test
	public void countTest() throws Exception{
		service.count(114);
	}
	
	@Test
	public void pageTest() throws Exception{
		PageMaker pageMaker = new PageMaker();
		Criteria cri = new Criteria();	
		service.listPage(114, cri);
	}
}
