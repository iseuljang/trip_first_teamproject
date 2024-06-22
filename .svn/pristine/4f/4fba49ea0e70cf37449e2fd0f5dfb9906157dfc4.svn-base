<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %> 
<%
//-------------------- 값 수령 --------------------
String uname = request.getParameter("uname");
String pwcheckagain = request.getParameter("pwcheckagain");

//윗단계 입력란 사용가능 여부 확인
if(pwcheckagain.equals("false"))
{
	out.println("99");
	return;
}

//수령한 값의 유효성 확인
if(uname == null)
{
	out.println("00");
	return;
}

//수령한 값의 유효성 확인
if(uname.equals("") )
{
	out.println("-1");
	return;
}

// --------------- 이름 중복여부 확인 -------------------
userDTO dto = new userDTO();
if(dto.CheckUname(uname) == true)
{	
	//중복일 경우
	out.println("01");
}else
{	
	// 사용가능한 경우
	out.println("02");
}
%>