package com.kh.edu.buatan.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.edu.buatan.control.ActionForward;


public interface CommandAction {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
