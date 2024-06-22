<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trip.dto.*" %>
<%
//-------------------- 값 수령 --------------------
String uid = request.getParameter("uid");

//수령한 값의 유효성 확인
if(uid == null)
{
	out.println("00");
	return;
}

//수령한 값의 유효성 확인
if(uid.equals(""))
{
	out.println("-1");
	return;
}

//아이디 길이가 4자 미만일시
if(uid.length() < 4)
{
	out.println("03");
	return;
}

//아이디 길이가 20자 초과일시
if(uid.length() > 20)
{
	out.println("04");
	return;
}

//----------------- 아이디 중복여부 확인 ---------------------
userDTO dto = new userDTO();
if(dto.CheckID(uid) == true)
{	
	// 이미 등록된 아이디일 경우
	out.println("01");

}else
{	
	// 사용가능한 아이디일 경우
	out.println("02");
}
%>