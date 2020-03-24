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

import org.omg.CORBA.Request;

/**
 * Servlet implementation class edit
 */
@WebServlet("/edit")
public class edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	HttpSession httpSession;
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
    public edit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		httpSession = request.getSession();
		
		id = httpSession.getAttribute("id").toString();
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		phone = request.getParameter("phone");
		
		
		
		if(CheckPw()) {
			String query = "update member set name = '"+name+"', phone = '"+phone+"' where id = '"+id+"'";
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
				stat = conn.createStatement();
				int i = stat.executeUpdate(query);
				if(i == 1) {
					System.out.println("update success");
					response.sendRedirect("edit_success.jsp");
				}
				else
					System.out.println("update fail");
				
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
		else
			response.sendRedirect("edit_fail.jsp");	
	}
	
	private boolean CheckPw() {
		boolean result = false;
		String sPw = (String)httpSession.getAttribute("pw");
		if(pw.equals(sPw))
			result = true;
		else
			result = false;
		return result;		
	}

}
