<%@page import="com.java.loginEx.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dto" class="com.java.loginEx.memberDto"></jsp:useBean>
<jsp:setProperty name="dto" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		memberDao dao = memberDao.getInstance();
			if(dao.idConfirm(dto.getId()) == memberDao.MEMBER_EXIST)
			{
	%>
		<script language="javascript">
			alert("���̵� �����մϴ�.");
			history.back();
		</script>
	<%
		}
			else{
		int ri = dao.memberInsert(dto);
		if(ri == memberDao.MEMBER_JOIN_SUCCESS){
			session.setAttribute("id", dto.getId());
	%>
		<script language="javascript">
			alert("ȸ�������� ���� �մϴ�.");
			document.location.href="login.jsp";
		</script>
	<%
			} else {
	%>
		<script language="javascript">
			alert("ȸ�����Կ� �����߽��ϴ�.");
		//	document.location.href="join.jsp";
		</script>
	<%
			}
		}
	%>
</body>
</html>