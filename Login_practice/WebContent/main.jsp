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
	<%=name %>�� ȯ���մϴ�.
	
	
	<a href="edit_info.html">��������</a>	
</body>
</html>