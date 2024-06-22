<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %> 
<%

String unick = request.getParameter("unick");
if(unick == null || unick.equals(""))
{
	out.println("00");
	return;
}

userDTO dto = new userDTO();
if(dto.CheckUnick(unick) == true)
{	//등록된 ID
	out.println("01");
}else
{	//사용 가능한 ID
	out.println("02");
}
%>