package com.java.loginEx;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class join
 */
@WebServlet("/join")
public class join extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Connection conn;
	private Statement stat;
	private ResultSet rs;
	
	private String id;
	private String pw;
	private String name;
	private String phone;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public join() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		phone = request.getParameter("phone");
		
		try {
			String query = "insert into member (id, pw, name, phone) values('"+id+"', '"+pw+"', '"+name+"', '"+phone+"')";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
			stat = conn.createStatement();
			int i = stat.executeUpdate(query);
			if(i == 1) {
				System.out.println("가입성공");
				response.sendRedirect("login.html");
			}
			else {
				System.out.println("가입실패");
				response.sendRedirect("join.html");
			}				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(stat != null) stat.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
