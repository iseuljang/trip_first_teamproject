<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>    
<%@ page import="trip.dto.*" %>
<%
//-------------------- 값 수령 --------------------
String uid = request.getParameter("uid");
String upw = request.getParameter("upw");
//아이디 기억하기 체크여부 판단
String remember_id = request.getParameter("remember_id");

//--------------------- 접근제어 ------------------
if(uid == null || upw == null)
{	//로그인 정보가 올바르게 전송되지 않음
	out.println("ERROR");
	return; 
}


//쿠키 설정
Cookie cookieID = new Cookie("uid", null);
if(remember_id.equals("0"))
{
	//체크 안되어 있을 시, 삭제
	Cookie[] cookie = request.getCookies();
	for(Cookie c : cookie)
	{
		c.setMaxAge(0);
		response.addCookie(c); 
	}
	
	
	
}else if(remember_id.equals("1"))
{
	//체크되어 있을 시, 굽기 
	cookieID.setValue(uid);
	cookieID.setMaxAge(60 * 60); 
	response.addCookie(cookieID);
}



//------------------------ 계정 조회 ------------------------
userDTO dto = new userDTO();
//회원정지여부 체크
dto.Stopend(uid);
userVO vo = dto.CheckState(uid, upw);

if(vo != null)
{
	if(vo.getUretire() != null && vo.getUretire().equals("Y"))
	{
		// 회원탈퇴가 되어있을시
		out.println("RETIRE");
		System.out.println("RETIRE");
		return;
		
	}else if(vo.getUstop() != null && vo.getUstop().equals("Y" ))
	{
		// 계정정지가 되어있을시
		out.println("STOP");
		System.out.println("STOP");
		return;
		
	}
}else
{
	// 계정 조회중에 에러가 났을시
	out.println("ERROR");
	System.out.println("ERROR");
	return;
	
}

//로그인 체크
vo = dto.Login(uid, upw);
if(vo == null)
{	//로그인 안됨
	out.println("ERROR");
	System.out.println("ERROR");
	return;
}else
{	//로그인 됨
	session.setAttribute("login", vo);
	out.println("OK");
	System.out.println("OK");
	return;
}
%>