<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Objects.User"%>
<%@page import="DataBase.DataBase"%>
 <%
	Object userName = session.getAttribute("userName");
	Object userPassword = session.getAttribute("userPassword");
	if (userName != null && userName != null){
		User curUser = DataBase.getUser((String)userName, (String)userPassword);
		if (curUser.userPermission.equals("admin")){
			response.sendRedirect("dashboard.jsp");
		}else{
			response.sendRedirect("panels.jsp");
		}
	}else{
	response.sendRedirect("login.jsp");
	}
%>