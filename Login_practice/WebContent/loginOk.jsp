<%@page import="com.java.loginEx.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
	int loginConfirm;
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		memberDao dao = memberDao.getInstance();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		loginConfirm = dao.loginConfirm(id, pw);
		
		
		System.out.println("loginConfirm �� : "+loginConfirm);
		
		if(loginConfirm == memberDao.MEMBER_LOGIN_PW_NO)
		{
	%>
		<script language="javascript">
			alert("��й�ȣ�� Ʋ���ϴ�.");
			history.go(-1);
		</script>
	<%
		}
		else if(loginConfirm == memberDao.MEMBER_LOGIN_IS_NOT)
		{
	%>
		<script language="javascript">
			alert("�������� �ʴ� ȸ���Դϴ�.");
			history.go(-1);
		</script>
	
	<%
		}
		else{
			memberDto dto = dao.getMember(id);
			String name = dto.getName();
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			session.setAttribute("name", name);
			session.setAttribute("ValidMember", "yes");
			response.sendRedirect("main.jsp");
		}
	%>	
</body>
</html>