package com.care.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.DTO.Board_qaDTO;
import com.care.DTO.Board_qaPageMaker;
import com.care.DTO.Board_qaSearchCriteria;
import com.care.DTO.board_qaReplyDTO;
import com.care.service.Board_qaServiceimpl;


@Controller
public class Board_qaController {
	
	@Autowired
	Board_qaServiceimpl service;
	
	
	
	@RequestMapping("QnA")
	public String QnA(Model model, @ModelAttribute("scri") Board_qaSearchCriteria scri) throws Exception {
		
		model.addAttribute("list",service.list(scri));
		Board_qaPageMaker pageMaker = new Board_qaPageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);
		
		return "cs/QnA";
		
	}
	@RequestMapping("QnAwrite")
	public String QnAwrite(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if(id == null) {
			model.addAttribute("msg","로그인후 이용 가능 합니다.");
			model.addAttribute("url","bootlogin");
			return "error/error";
		}
		return "cs/QnAwrite";
	}
	@RequestMapping("savedata")
	public String savedata(Board_qaDTO dto,Model model,HttpServletRequest request)throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if(id == null) {
			model.addAttribute("msg","로그인후 이용 가능 합니다.");
			model.addAttribute("url","bootlogin");
			return "error/error";
		}
		try {
		 service.Board_qaInsert(dto);
		 model.addAttribute("msg","게시글이 작성되었습니다");
	     model.addAttribute("url","QnA");
		 
		}catch (Exception e) {
			 model.addAttribute("msg","게시글 작성 실패");
		     model.addAttribute("url","QnA");
		}
		return "error/error";
	}
	//게시물 조회 & 게시물 댓글 조회
	@RequestMapping("QnAreadView")
	public String read(Board_qaDTO dto, @ModelAttribute("scri") Board_qaSearchCriteria scri, Model model, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			System.out.println(session.getAttribute("id"));
			
			int Qa_state = service.read(dto.getQa_seq()).getQa_state();
			String id = (String) session.getAttribute("id");
			
			
			//게시물 조회
			model.addAttribute("read", service.read(dto.getQa_seq()));
			model.addAttribute("scri", scri);
			
			//게시물 댓글 조회
			List<board_qaReplyDTO> replyList = service.readReply(dto.getQa_seq());
			model.addAttribute("replyList", replyList);
			
			//관리자일 경우 또는 비밀번호 설정여부 0일 시 바로 게시판 그 외 패스워드 입력
			if(Qa_state==0||id.equals("system")) {
				return "cs/QnAreadView";
			}else {
				return "cs/QnApassWord";
				}
	}
 	
	//비밀번호 입력 후 게시물 조회
	@RequestMapping("QnApassWord")
	public String QnApassWord(Board_qaDTO dto, @ModelAttribute("scri") Board_qaSearchCriteria scri, Model model) throws Exception {
		model.addAttribute("read", service.read(dto.getQa_seq()));
		model.addAttribute("scri", scri);
		model.addAttribute("replyList", service.readReply(dto.getQa_seq()));
		return "cs/QnAreadView";
	}
	
	// 게시판 수정뷰
	@RequestMapping("updateView")
	public String updateView(Board_qaDTO dto, @ModelAttribute("scri") Board_qaSearchCriteria scri,Model model,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if(id == null) {
			model.addAttribute("msg","로그인후 이용 가능 합니다.");
			model.addAttribute("url","bootlogin");
			return "error/error";
		}
		
		model.addAttribute("update", service.read(dto.getQa_seq()));
		model.addAttribute("scri", scri);
		return "cs/QnAupdateView";
	}
	
	// 게시판 수정
	@RequestMapping("update")
	public String update(Board_qaDTO dto, @ModelAttribute("scri") Board_qaSearchCriteria scri, RedirectAttributes rttr,Model model) throws Exception{
		try {
		service.update(dto);
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		model.addAttribute("msg","게시글이 수정 되었습니다");
	    model.addAttribute("url","QnA?page="+scri.getPage()+"&perPageNum="+scri.getPerPageNum()
	    +"&searchType="+scri.getSearchType()+"&keyword="+scri.getKeyword());
	    
		}
		catch (Exception e) {
			model.addAttribute("msg","게시글 수정 실패");
		    model.addAttribute("url","QnA");
		}
		
		return "error/error";
	}
	
	// 게시판 삭제
	@RequestMapping("delete")
	public String delete(Board_qaDTO dto, @ModelAttribute("scri") Board_qaSearchCriteria scri, RedirectAttributes rttr,Model model,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if(id == null) {
			model.addAttribute("msg","로그인후 이용 가능 합니다.");
			model.addAttribute("url","bootlogin");
			return "error/error";
		}
		
		try {
		service.delete(dto.getQa_seq());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
	
		model.addAttribute("msg","게시글이 삭제 되었습니다");
	    model.addAttribute("url","QnA?page="+scri.getPage()+"&perPageNum="+scri.getPerPageNum()
	    +"&searchType="+scri.getSearchType()+"&keyword="+scri.getKeyword());
		}catch (Exception e) {
		
		model.addAttribute("msg","게시글 삭제 실패");
		model.addAttribute("url","QnA");
		}
		return "error/error";
	}
	
	// 댓글 작성
	@RequestMapping("replyWrite")
	public String replyWrite(board_qaReplyDTO dto, Board_qaSearchCriteria scri, RedirectAttributes rttr,Model model,HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String system = "system";
		if(!id.equals(system)) {
			model.addAttribute("msg","관리자만 이용 가능 합니다.");
			model.addAttribute("url","home");
			return "error/error";
		}
		
		try {
		service.writeReply(dto);
		
		rttr.addAttribute("qa_seq", dto.getQa_seq());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		model.addAttribute("msg","댓글이 작성 되었습니다 ");
	    model.addAttribute("url",
	    "QnAreadView?qa_seq="+dto.getQa_seq()+"&page="+scri.getPage()+"&perPageNum="+scri.getPerPageNum()
	    +"&searchType="+scri.getSearchType()+"&keyword="+scri.getKeyword());
	    
		}catch (Exception e) {
			model.addAttribute("msg","댓글 작성 실패 ");
		    model.addAttribute("url","QnA");
		}
		return "error/error";
	}
	
	//댓글 수정 페이지에 접근하기 위한 컨트롤러와 수정한 값을 전송할 수 있는 컨트롤러를 작성
	//댓글 수정 GET
	@RequestMapping(value = "/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(board_qaReplyDTO dto, Board_qaSearchCriteria scri, Model model,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if(id == null) {
			model.addAttribute("msg","로그인후 이용 가능 합니다.");
			model.addAttribute("url","bootlogin");
			return "error/error";
		}
		model.addAttribute("replyUpdate", service.selectReply(dto.getQa_reply_seq()));
		model.addAttribute("scri", scri);
		
		return "cs/QnAreplyUpdateView";
	}
	//댓글 수정 POST
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(board_qaReplyDTO dto, Board_qaSearchCriteria scri, RedirectAttributes rttr,Model model) throws Exception {
		try {
		service.updateReply(dto);
		
		rttr.addAttribute("qa_seq", dto.getQa_seq());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		model.addAttribute("msg","댓글이 수정  되었습니다");
	    model.addAttribute("url",
	    "QnAreadView?qa_seq="+dto.getQa_seq()+"&page="+scri.getPage()+"&perPageNum="+scri.getPerPageNum()
	    +"&searchType="+scri.getSearchType()+"&keyword="+scri.getKeyword());
		
		}catch (Exception e) {
			model.addAttribute("msg","댓글 수정 실패 ");
		    model.addAttribute("url","QnA");
		}
		return "error/error";
	}
	
	//댓글 삭제 페이지에 들어가기 위한 컨트롤러와 삭제 컨트롤러를 작성
	//댓글 삭제 GET
		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(board_qaReplyDTO dto, Board_qaSearchCriteria scri, Model model,HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			if(id == null) {
				model.addAttribute("msg","로그인후 이용 가능 합니다.");
				model.addAttribute("url","bootlogin");
				return "error/error";
			}
			model.addAttribute("replyDelete", service.selectReply(dto.getQa_reply_seq()));
			model.addAttribute("scri", scri);
			

			return "cs/QnAreplyDeleteView";
		}
		
		//댓글 삭제
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(board_qaReplyDTO dto, Board_qaSearchCriteria scri, RedirectAttributes rttr,Model model) throws Exception {
			try {
			service.deleteReply(dto);
			
			rttr.addAttribute("qa_seq", dto.getQa_seq());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			model.addAttribute("msg","댓글이 삭제 되었습니다");
		    model.addAttribute("url",
		    "QnAreadView?qa_seq="+dto.getQa_seq()+"&page="+scri.getPage()+"&perPageNum="+scri.getPerPageNum()
		    +"&searchType="+scri.getSearchType()+"&keyword="+scri.getKeyword());
		    
			}catch (Exception e) {
				model.addAttribute("msg","댓글 삭제 실패 ");
			    model.addAttribute("url","QnA");
			}

			return "error/error";
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}