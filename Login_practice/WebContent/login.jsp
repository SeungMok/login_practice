<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% if(session.getAttribute("ValidMember") != null) {%>
	<jsp:forward page="main.jsp"></jsp:forward>
<% }%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="loginOk.jsp" method="post">
		���̵� : <input type="text" name="id" value="<%if(session.getAttribute("id")!=null) out.println(session.getAttribute("id")); %>" size=10></br>
		��й�ȣ : <input type="password" name="pw" size=10></br>
		<input type="submit" value="�α���"> &nbsp;&nbsp;	
		<iuput type="button" value="ȸ������" onclick="javascript:window.location='join.jsp'">
		<input type="button" value="ȸ������">
	</form>
</body>
</html>