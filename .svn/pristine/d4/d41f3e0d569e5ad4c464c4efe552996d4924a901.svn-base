<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<%
String rno     = request.getParameter("rno");
if(rno == null)
{
	out.println("잘못된 댓글번호입니다");
	return;
}
//댓글삭제
replyDTO rdto = new replyDTO(); 
rdto.Delete(rno);

%>
