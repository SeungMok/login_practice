<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script language="JavaScript" src="member.js"></script>
<body>
	<form action="joinOk.jsp" method="post" name="join_frame">
		���̵� : <input type="text" name="id" size=5></br>
		��й�ȣ : <input type="password" name="pw" size=5></br>
		��й�ȣȮ�� : <input type="password" name="pw_confirm" size=5></br>
		�̸� : <input type="text" name="name" size=5></br>
		��ȭ��ȣ : <input type="text" name="phone" size=20></br>
		<input type="button" value="ȸ������" onclick="infoConfirm()">&nbsp;&nbsp;
		<input type="reset" value="���" onclick="javascript:window.location='login.jsp'">
	</form>
</body>
</html>