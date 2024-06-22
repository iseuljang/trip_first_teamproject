<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %> 
<%
//-------------------- 값 수령 --------------------
String unick = request.getParameter("unick");
String namecheck = request.getParameter("namecheck");

// 윗단계 입력란 사용가능 여부 확인
if(namecheck.equals("false"))
{
	out.println("99");
	return;
}

// 수령한 값의 유효성 확인
if(unick == null )
{
	out.println("00");
	return;
}

//수령한 값의 유효성 확인
if(unick.equals(""))
{
	out.println("-1");
	return;
}

// ----------------- 닉네임 중복여부 확인 ---------------------
userDTO dto = new userDTO();
if(dto.CheckUnick(unick) == true)
{	
	// 중복일시 
	out.println("01");
}else
{	
	// 사용가능일시
	out.println("02");
}
%>