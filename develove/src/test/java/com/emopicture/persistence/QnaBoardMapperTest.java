package com.emopicture.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.emopicture.domain.QnaBoardVO;
import com.emopicture.service.RefBoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class QnaBoardMapperTest {

	protected static final Logger logger = LoggerFactory.getLogger(QnaBoardMapperTest.class);

	@Autowired
	private RefBoardService service;

	@Autowired
	private QnaBoardMapper mapper;

//	@Test
//	public void listTest() throws Exception {
//		System.out.println(service.listAll());
//	}
//
//	@Test
//	public void createTest() throws Exception {
//		QnaBoardVO vo = new QnaBoardVO();
//			vo.setTitle("HELP");
//			vo.setMno(1);
//			vo.setNickname("june");
//			vo.setEmail("abc@abc.com");
//			vo.setContent("HELP ME PLEASE.....");
//			service.create(vo);
//	}

	@Test
	public void readTest() throws Exception {
		System.out.println(service.read(4621));
	}

//	@Test
//	public void updateTest() throws Exception {
//		QnaBoardVO vo = new QnaBoardVO();
//		vo.setBno(6);
//		vo.setTitle("aaa");
//		vo.setContent("bbb");
//		service.update(vo);
//	}
//
//	@Test
//	public void deleteTest() throws Exception{
//		service.delete(1310736);
//	}
//	
}
