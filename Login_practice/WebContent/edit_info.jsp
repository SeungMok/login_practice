<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%!
	String id,pw,name,phone;
	
	Connection conn;
	Statement stat;
	ResultSet rs;
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<body>
	<%
		id = (String)session.getAttribute("id");
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
		stat = conn.createStatement();
		rs = stat.executeQuery("select * from member where id ='"+id+"'");
			
		while(rs.next()) {
			id = rs.getString("id");
			pw = rs.getString("pw");
			name = rs.getString("name");
			phone = rs.getString("phone");
		}

		%>
	<form action="edit" method="post">
		아이디 : <%=id %></br>
		비밀번호 : <input type="text" name="pw" size=5></br>
		이름 : <input type="text" name="name" value=<%=name %> size=5></br>
		전화번호 : <input type="text" name="phone" value=<%=phone %> size=20></br>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
	</form>

</body>
</html>