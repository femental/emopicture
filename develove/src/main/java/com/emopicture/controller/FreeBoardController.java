package com.emopicture.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.emopicture.domain.Criteria;
import com.emopicture.domain.FreeBoardVO;
import com.emopicture.domain.PageMaker;
import com.emopicture.service.FreeBoardService;

@Controller
@RequestMapping("/freeboard/*")
public class FreeBoardController {

	@Inject
	private FreeBoardService bService;
	

	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void searchlist(@ModelAttribute("cri") Criteria cri,  Model model) throws Exception {
		
		model.addAttribute("list", bService.search(cri));
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(bService.listSearchCount(cri));
		
		
		model.addAttribute("pageMaker",pageMaker);
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void view(@ModelAttribute("cri") Criteria cri, int bno, Model model) throws Exception {
		System.out.println(bno);
		bService.hit(bno);
		model.addAttribute("freeboard", bService.read(bno));
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create(FreeBoardVO vo,RedirectAttributes rttr) throws Exception {
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPost(FreeBoardVO vo,RedirectAttributes rttr) throws Exception {
		System.out.println(vo.getTitle());
		bService.create(vo);
		return "redirect:/freeboard/list";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modify(@RequestParam("bno") int bno,@ModelAttribute("cri") Criteria cri,Model model) throws Exception {
		System.out.println(bno);
		model.addAttribute("freeboard", bService.read(bno));
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(FreeBoardVO vo,Criteria cri,RedirectAttributes rttr) throws Exception {
		bService.update(vo);
		rttr.addAttribute("page",cri.getPageNo());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addAttribute("msg","SUCCESS");
	
		return "redirect:/freeboard/view?bno="+vo.getBno();
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("bno")int bno,Criteria cri,RedirectAttributes rttr) throws Exception {
		bService.delete(bno);
		rttr.addAttribute("page",cri.getPageNo());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/freeboard/list";
	}
	
	
	
	
	   @RequestMapping(value="/freeboard", method=RequestMethod.GET)
	   public String freeboard(){
		   return "/board/freeboard";
	   }

}
