<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %> 
<%
//-------------------- 값 수령 --------------------
String email = request.getParameter("email");
String nickcheck = request.getParameter("nickcheck");

//윗단계 입력란 사용가능 여부 확인
if(nickcheck.equals("false") )
{
	out.println("99");
	return;
}

//수령한 값의 유효성 확인
if(email == null )
{
	out.println("00");
	return;
}

//수령한 값의 유효성 확인
if(email.equals("") )
{
	out.println("-1");
	return;
}

//----------------- 이메일 중복여부 확인 ---------------------
userDTO dto = new userDTO();
if(dto.CheckEmail(email) == true)
{	
	// 중복일시
	out.println("01");
}else
{	
	// 사용가능일시
	out.println("02");
}
%>