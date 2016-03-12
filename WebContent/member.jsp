<%@page import="DataBase.DataBase"%>
<%@page import="Objects.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object userName = request.getParameter("userName");
	Object userPassword = request.getParameter("userPassword");
	if (userName != null && userPassword != null){
		User curUser = DataBase.getUser((String)userName, (String)userPassword);
		if (curUser != null){
			session.setAttribute("userName", (String)userName);
			session.setAttribute("userPassword", (String)userPassword);
			response.sendRedirect("dashboard.jsp");
		}else{
			%>
			<script type="text/javascript">
    			var msg = "릴리즈의 멤버가 아닙니다";
   				alert(msg);
			</script>
<%
			response.sendRedirect("login.jsp");
		}
	}else{
		%>
		<script type="text/javascript">
			var msg = "릴리즈의 멤버가 아닙니다";
				alert(msg);
		</script>
<%
		response.sendRedirect("login.jsp");
	}
%>