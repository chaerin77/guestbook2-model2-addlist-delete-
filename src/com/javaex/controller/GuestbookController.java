package com.javaex.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javaex.dao.GuestbookDao;
import com.javaex.vo.GuestbookVo;

@WebServlet("/gbc")//()안이 주소명 model2 방식으로 만들기 위해 컨트롤러 만듬 
public class GuestbookController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GuestbookController");
		
		String act = request.getParameter("action");
		
		if("addList".equals(act)) {
			System.out.println("addList");
			
			GuestbookDao guestbookDao = new GuestbookDao();
			List<GuestbookVo> guestbookVo = guestbookDao.getList();
			
			request.setAttribute("gVo", guestbookVo);

			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/addList.jsp");
			rd.forward(request, response);
			
		}else if("add".equals(act)) {
			System.out.println("add");
		
			String name = request.getParameter("name");
			String pw = request.getParameter("pw");
			String content = request.getParameter("content");
			
			GuestbookVo gvo = new GuestbookVo(name, pw, content);
			
			GuestbookDao gDao = new GuestbookDao();
			gDao.addGuest(gvo);
			
			response.sendRedirect("/guestbook2/gbc?action=addList");
			
		}else if("deleteForm".equals(act)) {
			System.out.println("deleteForm");
			
			int no = Integer.parseInt(request.getParameter("no"));
		
			request.setAttribute("number", no);
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/deleteForm.jsp");
			rd.forward(request, response);
			
		}else if("delete".equals(act)) {
			System.out.println("delete");
			
			int no = Integer.parseInt(request.getParameter("no"));
			String pw = request.getParameter("pw");
			
			GuestbookVo gvo = new GuestbookVo();
			gvo.setNo(no);
			gvo.setPassword(pw);
			
			GuestbookDao gDao = new GuestbookDao();
			gDao.deleteGuest(gvo);
			
			response.sendRedirect("/guestbook2/gbc?action=addList");
		
		}else {
			System.out.println("파라미터 값 받음");
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GuestbookController");
		doGet(request, response);
	}

}
