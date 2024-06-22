<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %> 
<%
request.setCharacterEncoding("UTF-8");
userVO login  = (userVO)session.getAttribute("login");

String bno = request.getParameter("bno");

boardDTO dto = new boardDTO(); 

dto.bookDelete(login.getUno(), bno);

out.println("북마크 삭제되었습니다.");
%>
