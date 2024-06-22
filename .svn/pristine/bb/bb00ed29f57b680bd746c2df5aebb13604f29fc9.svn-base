<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %> 
<%
request.setCharacterEncoding("UTF-8");

//-------------------- 값 수령 --------------------
String uid      = request.getParameter("uid");
String upw      = request.getParameter("upw");
String uname    = request.getParameter("uname");
String unick    = request.getParameter("unick");
String email    = request.getParameter("email");
String rearEmail    = request.getParameter("rearEmail");
String uicon    = request.getParameter("uicon");
String season   = request.getParameter("season");
String local    = request.getParameter("local");
String human    = request.getParameter("human");
String move     = request.getParameter("move");
String schedule = request.getParameter("schedule");
String uinout   = request.getParameter("uinout");

//받아온 값의 유효성 확인
if( uid == null || upw == null )
{
	response.sendRedirect("join.jsp");
	return;
}

//------------------------ 회원가입 ------------------------
// 객체 생성 후, 값 넣음
userVO vo = new userVO();
vo.setUid(uid);
vo.setUpw(upw);
vo.setUname(uname);
vo.setUnick(unick);

// eamil이 daum이나 hanmail일시, .net으로 넣음
if(rearEmail.equals("daum") || rearEmail.equals("hanmail"))
{
	vo.setEmail(email + "@" + rearEmail +".net");	
}else
{
	vo.setEmail(email + "@" + rearEmail +".com");	
}
vo.setUicon(uicon);
vo.setSeason(season);
vo.setLocal(local);
vo.setHuman(human);
vo.setMove(move);
vo.setSchedule(schedule);
vo.setUinout(uinout);

// 회원가입
userDTO dto = new userDTO();
if(dto.Join(vo) == true)
{
	response.sendRedirect("login.jsp");
}else
{
	response.sendRedirect("join.jsp");
}
%>