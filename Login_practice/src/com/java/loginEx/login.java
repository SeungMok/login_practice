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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
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
    public login() {
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
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
			stat = conn.createStatement();
			rs = stat.executeQuery("select * from member where id ='"+id+"' and pw = '"+pw+"'");
			while(rs.next()) {
				if(id.equals(rs.getObject("id")) && pw.equals(rs.getObject("pw"))) {
					id = rs.getString("id");
					pw = rs.getString("pw");
					name = rs.getString("name");
					phone = rs.getString("phone");
					
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("id", id);
					httpSession.setAttribute("pw", pw);
					httpSession.setAttribute("name", name);
					
					response.sendRedirect("main.jsp");
				}
				else
					response.sendRedirect("login.html");
			}
						
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(stat != null) stat.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
