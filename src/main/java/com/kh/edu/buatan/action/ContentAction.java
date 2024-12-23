package com.kh.edu.buatan.action;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.edu.buatan.control.ActionForward;
import com.kh.edu.buatan.model.BoardDAO;
import com.kh.edu.buatan.model.BoardVO;

public class ContentAction implements CommandAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
        //해당 페이지 번호
        String pageNum = request.getParameter("pageNum");
        BoardDAO dbPro = BoardDAO.getInstance();//DB처리
        BoardVO vo = new BoardVO();
        vo.setNum(num);
        BoardVO article =  dbPro.selectBoardDB(vo);
        //해당 글번호에 대한 해당 레코드
        //해당 뷰에서 사용할 속성
        request.setAttribute("num", num);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("article", article);
        return new ActionForward("/buatan/content.jsp", false);
	}

}
