package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class VerifyCertificationAction extends AbstractController {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
            
      String email = request.getParameter("email");
      String name = request.getParameter("name");

      
      String userCertificationCode = request.getParameter("userCertificationCode");
      
      HttpSession session = request.getSession(); // 세션불러오기
      String certificationCode = (String) session.getAttribute("certificationCode");  // 세션에 저장된 인증코드 가져오기
      
      
      String message = "";
      String loc = "";
      
      if( certificationCode.equals(userCertificationCode) ) {
         session.setAttribute("email", email);
         message = "인증성공 되었습니다. 변경할 비밀번호를 바꿔주세요";
         loc = request.getContextPath()+"/member/updatePassword2.com";
      }
      else {
         message = "발급된 인증코드가 아닙니다.";
         loc = request.getContextPath()+"/main.com";
      }
      
      request.setAttribute("message", message);
      request.setAttribute("loc", loc);
      
   //   super.setRedirect(false);
      super.setViewPage("/WEB-INF/msg.jsp");
      
      // !!! 중요 !!! //
      // !!!! 세션에 저장된 인증코드 삭제하기 !!!! //
      session.removeAttribute("certificationCode");
      
   }

}