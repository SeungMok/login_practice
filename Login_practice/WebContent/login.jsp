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
		아이디 : <input type="text" name="id" value="<%if(session.getAttribute("id")!=null) out.println(session.getAttribute("id")); %>" size=10></br>
		비밀번호 : <input type="password" name="pw" size=10></br>
		<input type="submit" value="로그인"> &nbsp;&nbsp;	
		<iuput type="button" value="회원가입" onclick="javascript:window.location='join.jsp'">
		<input type="button" value="회원가입">
	</form>
</body>
</html>