<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="trip.dto.*" %>
<%
//-------------------- 값 수령 --------------------
String idcheck = request.getParameter("idcheck");
String upw = request.getParameter("upw");

//윗단계 입력란 사용가능 여부 확인
if(idcheck.equals("false"))
{
	out.println("99");
	return;
}

//수령한 값의 유효성 확인
if(upw == null)
{
	out.println("00");
	return;
}

//수령한 값의 유효성 확인
if(upw.equals(""))
{
	out.println("-1");
	return;
}

//비밀번호 길이가 4자 미만일시
if(upw.length() < 4)
{
	out.println("02");
	return;
}

//비밀번호 길이가 20자 초과일시
if(upw.length() > 20)
{
	out.println("03");
	return;
}

// 입력한 비밀번호가 사용가능할 경우 
out.println("01");
%>