<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%!
	String id,pw;
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<body>
	<%
		id = session.getAttribute("id").toString();
	%>
	<form action="join" method="post">
		���̵� : <input type="text" name=<%=id %> size=5></br>
		��й�ȣ : <input type="text" name="pw" size=5></br>
		�̸� : <input type="text" name="name" size=5></br>
		��ȭ��ȣ : <input type="text" name="phone" size=20></br>
		<input type="submit" value="����">
		<input type="reset" value="���">
	</form>

</body>
</html>