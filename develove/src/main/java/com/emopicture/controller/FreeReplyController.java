package com.emopicture.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.ReplyVO;
import com.emopicture.domain.PageMaker;
import com.emopicture.service.FreeBoardReplyService;

@RestController
@RequestMapping("/replies/*")
public class FreeReplyController {
	
	@Inject
	private FreeBoardReplyService service;
	
	private static final Logger logger = LoggerFactory.getLogger(FreeReplyController.class);

	
	@RequestMapping(value="", method= RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		
		logger.info(vo.toString());
		ResponseEntity<String> entity =null;
		try {
			service.create(vo);
			entity= new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity =new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{bno}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> listPage(@PathVariable("bno")Integer bno,@PathVariable("page")Integer page){
		
		ResponseEntity<Map<String,Object>> entity=null; 
		try {
			Criteria cri=new Criteria();
			cri.setPageNo(page);
			
			PageMaker pageMaker=new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String,Object> map=new HashMap<String,Object>();
			List<ReplyVO> list=service.listPage(bno, cri);
			
			map.put("list", list);
			
			int replyCount=service.count(bno);
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
			
			entity=new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
 	
	@RequestMapping(value="/all/{bno}",method =RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno){
		
		ResponseEntity<List<ReplyVO>> entity=null;
		try {
			entity=new ResponseEntity<>(service.list(bno),HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	@RequestMapping(value="/{rno}",method={RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno,@RequestBody ReplyVO vo){
		
		ResponseEntity<String> entity=null;
		try {
			System.out.println("rno"+rno);
			vo.setRno(rno);
			service.update(vo);
			
			entity= new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{rno}",method={RequestMethod.POST,RequestMethod.DELETE})
	public ResponseEntity<String> remove(@PathVariable("rno")Integer rno){
		
		ResponseEntity<String> entity=null;
		try {
			service.delete(rno);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.getMessage();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
				
	}

}
