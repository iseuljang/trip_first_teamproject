<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<%
String bno     = request.getParameter("no");
String rno   = request.getParameter("rno");
String rnote   = request.getParameter("rnote");
if(bno == null)
{
	out.println("게시물 번호 오류입니다");
	return;
}

//댓글수정 
replyDTO rdto = new replyDTO(); 
rdto.DBOpen();
String sql = ""; 
sql  = "update reply set rnote = '" + rnote +"' ";
sql += "where bno = '" + bno + "' and rno = '" + rno + "'";
rdto.RunSQL(sql);

rdto.DBClose();
%>
