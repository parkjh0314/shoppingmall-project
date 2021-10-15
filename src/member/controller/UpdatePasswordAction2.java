package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class UpdatePasswordAction2 extends AbstractController{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      HttpSession session = request.getSession(); // 세션불러오기

      String email = (String) session.getAttribute("email");  // 세션에 저장된 인증코드 가져오기

      request.setAttribute("email", email);
      
      super.setViewPage("/WEB-INF/login/changePW_modal.jsp");

   }

}