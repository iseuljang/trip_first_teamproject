<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %> 
<%
userVO login  = (userVO)session.getAttribute("login");

request.setCharacterEncoding("UTF-8");

String bno   = request.getParameter("no");
if(bno == null)
{
	out.println("게시물번호 오류입니다");
	return;
}


boardDTO dto = new boardDTO(); 

if(dto.bookInsert(login.getUno(), bno) == true)
{
	out.println("OK");
}else
{
	out.println("ERROR");
}
%>
