<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="trip.dto.*" %>
<%
//-------------------- 값 수령 --------------------
String userpw2 = request.getParameter("userpw2");
String userpw = request.getParameter("userpw");
String pwcheck = request.getParameter("pwcheck");

//윗단계 입력란 사용가능 여부 확인
if(pwcheck.equals("false"))
{
	out.println("99");
	return;
}

//수령한 값의 유효성 확인
if(userpw2 == null)
{
	out.println("00");
	return;
}

//수령한 값의 유효성 확인
if(userpw2.equals(""))
{
	out.println("-1");
	return;
}


if(userpw2.equals(userpw))
{
	// 비밀번호 재입력란과 윗단계에서 입력한 비밀번호의 값이 일치할 경우
	out.println("01");
	return;
}else
{
	// 일치하지 않을 경우
	out.println("02");
	return;
}
%>