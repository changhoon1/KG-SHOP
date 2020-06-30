package com.care.controller;

import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.care.service.KakaoAPI;

		
		/**
		 * Handles requests for the application home page.
		 */
		@Controller
		public class HomeController {
			
		@Autowired
		private KakaoAPI kakao;
		
		@RequestMapping("kakaologin")
		public String kakaologin() {
			
			return "kakaologin";
		}
		
		
		@RequestMapping(value = "/oauth")
		public String kakaoLogin(@RequestParam("code") String code, HttpSession session,Model model)throws Exception {
			try {
			  String access_Token = kakao.getAccessToken(code);
			  HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
			    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
			    if (userInfo.get("email") != null) {
			        session.setAttribute("useremail", userInfo.get("email"));
			        session.setAttribute("id", userInfo.get("nickname"));
			        session.setAttribute("access_Token", access_Token);    
			        model.addAttribute("msg","카카오 로그인 성공");
			        model.addAttribute("url","home");
			    }
			}catch (Exception e) {
				model.addAttribute("msg","카카오 로그인 실패");
			    model.addAttribute("url","bootlogin");
			}
			return "error/error";
		}
//		@RequestMapping(value = "kakaologout")
//		public String Logout(HttpSession session,Model model)throws Exception {
//			try {
//			kakao.kakaoLogout((String)session.getAttribute("access_Token"));
//		    session.removeAttribute("access_Token");
//		    session.removeAttribute("usernickname");
//		    session.removeAttribute("useremail");
//		    model.addAttribute("msg","카카오 로그아웃");
//	        model.addAttribute("url","home");
//			}catch (Exception e) {
//				model.addAttribute("msg","카카오 로그아웃 실패");
//			    model.addAttribute("url","bootlogin");
//			}
//			return "error/error";
//		}   
//		
		
		
		}