<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%!
	String name;	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		name = session.getAttribute("name").toString();
	%>
	<%=name %>님 환영합니다.
	
	
	<a href="edit_info.html">정보수정</a>	
</body>
</html>