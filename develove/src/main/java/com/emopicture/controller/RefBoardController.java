package com.emopicture.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.emopicture.domain.BoardVO;
import com.emopicture.domain.Criteria;
import com.emopicture.domain.RefBoardVO;
import com.emopicture.service.RefBoardService;

@Controller
@RequestMapping("/refboard/*")
public class RefBoardController {

	@Inject
	private RefBoardService bService;
	

	private static final Logger logger = LoggerFactory.getLogger(RefBoardController.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void searchlist(@ModelAttribute("cri") Criteria cri,  Model model) throws Exception {
		cri.setTotalCount(bService.totalcount());	
		System.out.println(bService.totalcount());
		model.addAttribute("list", bService.search(cri));
	}

	@Transactional
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void view(@ModelAttribute("cri") Criteria cri, int bno, Model model) throws Exception {
		System.out.println(bno);
		bService.viewcnt(bno);
		model.addAttribute("board", bService.read(bno));
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create() throws Exception {
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPost(RefBoardVO vo) throws Exception {
		System.out.println(vo.getTitle());
		System.out.println(vo.getFiles());
		bService.create(vo);
		return "redirect:/refboard/list";
	}

	/*@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modify(int bno, Model model) throws Exception {
		System.out.println(bno);
		model.addAttribute("board", bService.read(bno));
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(RefBoardVO vo) throws Exception {
		bService.update(vo);
		
		return "redirect:/refboard/list";
	}*/
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	   public void modifyPage(int bno, @ModelAttribute("cri") Criteria cri, Model model ) throws Exception {
		   System.out.println(bno);

	      model.addAttribute("board", bService.read(bno));
	   }
	   
	   
	   @RequestMapping(value = "/modify", method = RequestMethod.POST)
	   public String modifyPOSTPage(RefBoardVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {
		   		   
		   bService.update(vo);
		   rttr.addAttribute("pageNo", cri.getPageNo());
		   rttr.addAttribute("perPageNum", cri.getPerPageNum());
		   rttr.addAttribute("searchType", cri.getSearchType());
		   rttr.addAttribute("keyword", cri.getKeyword());
		   rttr.addFlashAttribute("msg","SUCCESS");
		   
		   
		   return "redirect:/refboard/list";
	   }
	

	@RequestMapping(value = "/deletePage", method = RequestMethod.POST)
	public String deletePage(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
		
		try{
		bService.delete(bno);
		rttr.addFlashAttribute("msg","delete complete");
		
	} catch(Exception e){
		e.printStackTrace();
	}

		return "redirect:/refboard/list";
	}
	
	@RequestMapping("/getAttach/{bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("bno") Integer bno) throws Exception{
		return bService.getAttach(bno);
	}
}
