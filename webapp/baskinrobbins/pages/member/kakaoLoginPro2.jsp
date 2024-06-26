<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
String nickname = request.getParameter("nickname");
System.out.println("nickname = " + nickname);

session.setAttribute("log", nickname); 

%>