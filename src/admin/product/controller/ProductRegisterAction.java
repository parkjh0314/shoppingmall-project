package admin.product.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;

public class ProductRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

		// if(loginuser != null && "0".equals(loginuser.getUserno())) {

		super.getKindList(request);
		super.getCategoryList(request);
		super.getProductList(request);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/productRegister.jsp");
		// }
	}

}
