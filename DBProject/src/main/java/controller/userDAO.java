package controller;


import controller.user;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class userDAO {

	private Connection conn;



	private HttpServletRequest request;
	
		

	    HttpSession session = request.getSession();
	    RequestDispatcher dispatcher = null;

	public userDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public List<user> getUserProfile(String name){
		List<user> list = new ArrayList<user>();
		user a = null;

		try {
			String sql = "select * from users where uname like ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, "%" + session.getAttribute("name") + "%");

			ResultSet rse = ps.executeQuery();
			while (rse.next()) {
				a = new user();
				a.getName();
				a.getPassword();
				a.getEmail();
				a.getMobile();
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}