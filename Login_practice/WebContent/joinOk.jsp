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
			alert("아이디가 존재합니다.");
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
			alert("회원가입을 축하 합니다.");
			document.location.href="login.jsp";
		</script>
	<%
			} else {
	%>
		<script language="javascript">
			alert("회원가입에 실패했습니다.");
		//	document.location.href="join.jsp";
		</script>
	<%
			}
		}
	%>
</body>
</html>