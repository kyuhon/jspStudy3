package com.kh.edu.buatan.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.edu.buatan.control.ActionForward;
import com.kh.edu.buatan.model.BoardDAO;
import com.kh.edu.buatan.model.BoardVO;



public class DeleteProcAction implements CommandAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 	request.setCharacterEncoding("UTF-8");
	        int num = Integer.parseInt(request.getParameter("num"));
	        String pageNum = request.getParameter("pageNum");
	        String pass = request.getParameter("pass");
	        BoardDAO dbPro = BoardDAO.getInstance();
	        BoardVO vo = new BoardVO();
	        vo.setNum(num);
	        vo.setPass(pass);
	        boolean flag = dbPro.deleteDB(vo);
	        request.setAttribute("pageNum", pageNum);
	        request.setAttribute("flag", flag);
	        System.out.println("deleteProc");
	        return new ActionForward("/buatan/sign/deleteProcB.jsp", false);
	}

}
