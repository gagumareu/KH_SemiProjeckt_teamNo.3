package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;
import com.apc.model.ProductDAO;

public class CartUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		int cart_no = Integer.parseInt(request.getParameter("num"));

		CartDAO cdao = CartDAO.getInstance();
		CartDTO cdto = cdao.getCartContent(cart_no);

		String pname = cdto.getCart_pname();
		System.out.println(pname);
		
		ProductDAO pdao = ProductDAO.getInstance();
		List<String> pColor = pdao.getProductColor(pname);
		List<String> pSize = pdao.getProductSize(pname);
		
		request.setAttribute("cartDTO", cdto);
		request.setAttribute("colorList", pColor);
		request.setAttribute("sizeList", pSize);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("cart/cart_update.jsp");
				
		return forward;
	}

}
