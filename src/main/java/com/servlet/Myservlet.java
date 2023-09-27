package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.UserDao;
import com.Model.Note;
import com.Model.User;

@WebServlet("/")
public class Myservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/delete":
			deleteNote(request, response);
			break;
		case "/updateNote":
			updateNote(request, response);
			break;
		case "/logout":
			logoutUser(request, response);
			break;
		case "/addNote":
			addNotes(request, response);
			break;
		case "/login":
			loginUser(request, response);
			break;
		case "/register":
			registerUser(request, response);
			break;
		default:
			index(request, response);
			break;
		}
	}

	private void deleteNote(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Integer noteid = Integer.parseInt(request.getParameter("id"));
		boolean f = UserDao.deleteNote(noteid);
		HttpSession session = request.getSession();
		if (f) {
			session.setAttribute("updateMsg", "Notes Deleted Succesfully");
			response.sendRedirect("showNotes.jsp");
		} else {
			session.setAttribute("notdeleteMsg", "Something wrong on server");
			response.sendRedirect("showNotes.jsp");
		}

	}

	private void updateNote(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Integer noteid = Integer.parseInt(request.getParameter("noteid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		boolean f = UserDao.updateNote(noteid, title, content);
		HttpSession session = request.getSession();
		if (f) {
			session.setAttribute("updateMsg", "Notes Updated Succesfully");
			response.sendRedirect("showNotes.jsp");
		} else {
			System.out.println("Notes Not updated ");
		}
	}

	private void logoutUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("userD");
		HttpSession session2 = request.getSession();
		session.setAttribute("logoutmsg", "Logout Succesfully");
		response.sendRedirect("login.jsp");

	}

	private void addNotes(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		boolean f = UserDao.addNote(title, content, uid);
		if (f) {
			response.sendRedirect("showNotes.jsp");
		} else {
			System.out.println("data Not Inserted");
		}
	}

	private void index(HttpServletRequest request, HttpServletResponse response) {
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void loginUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User u = new User(email, password);
		User user = UserDao.loginUser(u);
		HttpSession session = request.getSession();
		if (user != null) {
			session.setAttribute("userD", user);
			response.sendRedirect("home.jsp");
		} else {
			session.setAttribute("loginFailed", "Invalid UserName and Password");
			response.sendRedirect("login.jsp");
		}

	}

	private void registerUser(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User u = new User(name, email, password);
		HttpSession session = request.getSession();
		boolean f = UserDao.userRegister(u);
		if (f) {
			session.setAttribute("SuccessMsg", "User Register Successfully");
			try {
				response.sendRedirect("register.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			session.setAttribute("ErrorMsg", "Something Went Wrong on Server");
			try {
				response.sendRedirect("register.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
