<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<%
String bno     = request.getParameter("no");
String rnote   = request.getParameter("rnote");
String btitle   = request.getParameter("btitle");
if(bno == null)
{
	out.println("게시물 번호 오류입니다");
	return;
}

replyVO rvo = new replyVO();
rvo.setBno(bno);
rvo.setUno(login.getUno());
rvo.setRnote(rnote);
rvo.setBtitle(btitle);
rvo.setUicon(login.getUicon());

//댓글등록
replyDTO rdto = new replyDTO(); 
rdto.Insert(rvo);
%>
