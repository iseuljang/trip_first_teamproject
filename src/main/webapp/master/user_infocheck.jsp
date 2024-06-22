<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %> 
<%--   <%@ include file="../include/head.jsp" %> --%> 
<%
userVO login  = (userVO)session.getAttribute("login");

String upw = request.getParameter("upw");
String unick = request.getParameter("unick");
String season = request.getParameter("season");
String local = request.getParameter("local");
String human = request.getParameter("human");
String move = request.getParameter("move");
String schedule = request.getParameter("schedule");
String uinout = request.getParameter("uinout");
String uicon    = request.getParameter("uicon");
if(upw == null)
{	//로그인 정보가 올바르게 전송되지 않음
	out.println("ERROR");
	return;
}

userDTO dto = new userDTO();
userVO vo = new userVO();
vo.setUno(login.getUno());
if(unick == null)
{
	vo.setUnick(login.getUnick());
}else
{
	vo.setUnick(unick);
}
vo.setUid(login.getUid());
vo.setUpw(upw);
vo.setSeason(season);
vo.setLocal(local);
vo.setHuman(human);
vo.setMove(move);
vo.setSchedule(schedule);
vo.setUinout(uinout);
vo.setUicon(uicon);
if(dto.MyChange(vo) == false)
{	//회원정보 변경안됨
	out.println("ERROR");
}else
{	//회원정보변경됨
	vo = dto.Login(login.getUid(), vo.getUpw());
	session.setAttribute("login", vo);
	out.println("OK");
}
%>