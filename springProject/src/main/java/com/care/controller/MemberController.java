package com.care.controller;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.simple.parser.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.DTO.BannerDTO;
import com.care.DTO.MemberDTO;

import com.care.service.MemberService;
import com.care.service.SaveProductService;

@Controller
public class MemberController {
	
	@Autowired
	SaveProductService productservice;
	@Autowired
	private MemberService member;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<BannerDTO> view = productservice.viewbanner();
		model.addAttribute("banner",view);
		
		model.addAttribute("bestView",member.bestView());
		
		
		return "home";
	}
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String goHome(Model model) {
		return "redirect:/";
	}
	
	//로그인
		@RequestMapping(value="chkUser", method=RequestMethod.POST)
		public String chkUser(MemberDTO dto,HttpServletRequest request, Model model) throws Exception {
			HttpSession session = request.getSession();
			String id =  request.getParameter("id");
			System.out.println(id);
			String pw = request.getParameter("pw");
	 		MemberDTO dto1 = null;
			dto1 = member.logincheck(dto);
			System.out.println(dto.getPw());
				if(dto1.getId().equals(id) && pwdEncoder.matches(pw, dto1.getPw())) {	
					session.setAttribute("id", request.getParameter("id"));
					model.addAttribute("msg","로그인 성공");
			        model.addAttribute("url","home");
				}else {
				model.addAttribute("msg","로그인 실패");
			    model.addAttribute("url","bootlogin");
				}
			return "error/error";
		}

		//회원 가입 (비밀번호 암호화)
		@RequestMapping(value="chkRegister", method=RequestMethod.POST)
		public String chkRegister(MemberDTO dto, HttpServletRequest request,Model model) throws Exception {
			try {
				
					String encoder = pwdEncoder.encode(dto.getPw());
					dto.setPw(encoder);
					member.savedata(dto);
					model.addAttribute("msg","회원가입 성공하셨습니다");
					model.addAttribute("url","bootlogin");	
				
			} catch (Exception e) {
				model.addAttribute("msg","회원가입 실패입니다");
				model.addAttribute("url","bootMember");	
			}	
			return "error/error";	
			
		}
		
		//아이디 중복체크 페이지
		@ResponseBody
		@RequestMapping(value = "idChk", method =RequestMethod.POST)
		public int idChk(MemberDTO dto) throws Exception {
			int result = member.idChk(dto);
			return result;
		}


		//회원수정
		@RequestMapping("updatedata")
		public String updatedata(MemberDTO dto,HttpServletRequest request,Model model) throws SQLException {		
			try {
					HttpSession session = request.getSession();		
					String id = (String) session.getAttribute("id");
					dto.setId(id);
					String encoder = pwdEncoder.encode(dto.getPw());
					dto.setPw(encoder);
					member.execute(dto);
					model.addAttribute("msg","회원수정 성공");
					model.addAttribute("url","home");
	
			} catch (Exception e) {
				model.addAttribute("msg","회원수정 실패");
				model.addAttribute("url","bootMemberModify");
			}		
			return "error/error";
		
		}
		@RequestMapping("logout")
		public String logout(HttpSession session,Model model)throws SQLException {
			try {
			session.invalidate();
			model.addAttribute("msg","로그아웃 되셨습니다");
			model.addAttribute("url","home");
			}catch (Exception e) {
				model.addAttribute("msg","로그아웃 실패");
				model.addAttribute("url","home");
			}
			return "error/error";
		}

		
		@RequestMapping("bootlogin")
		public String bootlogin() {
			return "member/bootlogin";
		}
		@RequestMapping("bootMember")
		public String bootMember() {
			return "member/bootMember";
		}
		
		
		@RequestMapping("bootMemberModify")
		public String bootMemberModify(MemberDTO dto,HttpServletRequest request,Model model) throws Exception {		
			HttpSession session = request.getSession();		
			String id = (String) session.getAttribute("id");
		
			model.addAttribute("list",member.list(id));
			
			return "member/bootMemberModify";
		}
		@RequestMapping("myPage")
		public String myPage(HttpServletRequest request,Model model) {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			if(id == null) {
				model.addAttribute("msg","로그인후 이용 가능 합니다.");
				model.addAttribute("url","bootlogin");
				return "error/error";
			}
			return "member/myPage";
		}

		@RequestMapping("chklogin")
		public String login() {
			return "member/chklogin";
		}
		@RequestMapping("chkcallback" )
		public String callback() throws IOException, ParseException {
		
			return "member/chkcallback";
		}
				
	}
