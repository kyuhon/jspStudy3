package com.kh.edu.buatan.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.edu.buatan.action.CommandAction;


public class ControlServlet extends HttpServlet {
	// key: ~~.do, value: 컨트롤객체, 서비스객체, DAO객체
	// 1. board/list.do=com.kh.edu.board.action.ListAction
	// 키값: "board/list.do" 객체: Class.Load(com.kh.edu.board.action.ListAction);
	private Map<String, Object> commandMap = new HashMap<String, Object>();
	// 다만들어놔서 actionfactory가 필요없다??

	// 2. CommandPro.properties key값과 value값을 가져와서 미리 객체를 만들고 commandMap 저장해놓는다(Pre
	// Loading)

	public void init(ServletConfig config) throws ServletException {
		// 2. props = "CommandPro.properties"
		// 프리로딩을 위한 명단을 가져오는 것
		// CommandPro.properties 파일을 가져오기위한 경로 찾기
		String props = config.getInitParameter("propertyConfig");
		Properties pr = new Properties();
		// Properties - map의 종류
		FileInputStream f = null;
		String path = config.getServletContext().getRealPath("/WEB-INF");
		try {
			f = new FileInputStream(new File(path, props));
			pr.load(f);
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (f != null)
				try {
					f.close();
				} catch (IOException ex) {
				}
		}
		// board/list.do=com.kh.edu.board.action.ListAction
		// 키값에 "board/list.do" Set 등록
		Iterator<Object> keyIter = pr.keySet().iterator();
		while (keyIter.hasNext()) {
			// key값 : "board/list.do"
			String command = (String) keyIter.next();
			// value값 : "com.kh.edu.board.action.ListAction"
			String className = pr.getProperty(command);
			try {
				// com.kh.edu.board.action.ListAction 해당 문자열을 클래스 가져온다..
				Class commandClass = Class.forName(className);
				Object commandInstance = commandClass.newInstance();// 해당클래스의 객체를 생성
				// Map객체인 commandMap에 객체 저장
				commandMap.put(command, commandInstance);
			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		ActionForward af = null;
		CommandAction com = null;
		try {
			//http://localhost:8080/jspStudy3/board/index.do?name=kdj
			// command = "/jspStudy3/board/index.do"
			String command = request.getRequestURI();
			//request.getContextPath() == "/jspStudy3"
			if (command.indexOf(request.getContextPath()) == 0) {
				// command = "/board/index.do"
				command = command.substring(request.getContextPath().length());
			}
			com = (CommandAction) commandMap.get(command);
			af = com.execute(request, response);
			
			if (af.isRedirect() == true) {
				response.sendRedirect(af.getUrl());
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(af.getUrl());
				rd.forward(request, response);
			}
		
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
