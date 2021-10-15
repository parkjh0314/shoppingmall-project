package board.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.*;
import common.controller.AbstractController;
import member.model.MemberVO;
import my.util.MyUtil;

public class QnaDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.header(request);
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");

		if (loginuser == null) { // 로그인 하지 않은 회원이라면
			
			String message = "로그인하셔야 합니다.";
			String loc = "javascript:history.back();";
			
			String currentURL = MyUtil.getCurrentURL(request);
			session.setAttribute("currentURL", currentURL);
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
		}else { 
			// 로그인한 회원이라면
			String userno = loginuser.getUserno();
			int status = loginuser.getStatus();

			String selectNo = request.getParameter("selectNo");
			InterBoardDAO bdao = new BoardDAO();
			QnaQuestionVO qqvo = bdao.selectQnaDetail(selectNo);
			
			if ( !(qqvo.getqUserno().equals(userno)) && status != 3) { 
				// 만일 열람하는 회원이 해당 게시물을 올린 회원이 아니면서 관리자도 아니라면
				String message = "본인의 문의만 열람할 수 있습니다.";
				String loc = "javascript:history.back();";
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			}else{
				// 만일 열람하는 회원이 게시물을 올린 회원이라면
				List<String> cateList = bdao.selectQnaCategory();
				request.setAttribute("cateList", cateList);
				request.setAttribute("qqvo", qqvo);
				
				// 해당 작성번호로 답변을 조회한다.
				QnaAnswerVO qavo = bdao.selectAnswer(selectNo); 
				request.setAttribute("qavo", qavo);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/board/qnaDetail.jsp");
				
			}
		}

		
		
		
		
		
	}	
		
}
