<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %> 
<%@ include file="../include/head.jsp" %> 
<%
request.setCharacterEncoding("UTF-8");

//-------------------- 값 수령 --------------------
String adno = request.getParameter("adno");
String pageno = request.getParameter("page");

adminboardDTO dto = new adminboardDTO();

// -------------------- 해당 공지글 삭제 --------------------
if( dto.Delete(adno) == false )
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("삭제 오류입니다.");
		history.back();
		return;
	});
	</script>
	<% 
}else
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("삭제가 완료되었습니다.");
		document.location = "../master/masterGonggiwrite.jsp?page=" + <%= pageno %>;
		return;
	});
	</script>
	<% 
}
%>
