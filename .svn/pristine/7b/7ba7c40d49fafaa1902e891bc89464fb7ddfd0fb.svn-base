<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %> 
<% 
String bno     = request.getParameter("no");
if(bno == null || bno.equals(""))
{
	response.sendRedirect("index.jsp");
	return;	
}

boardDTO bdto= new boardDTO();
bdto.DBOpen();
String sql = "";

//추천수를 감소시킨다.
sql  = "update board set bhate = bhate + 1 ";
sql += "where bno = " + bno;
bdto.RunSQL(sql);

bdto.DBClose();
%>