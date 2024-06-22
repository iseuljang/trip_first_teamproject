<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %> 
<%
request.setCharacterEncoding("UTF-8");
userVO login  = (userVO)session.getAttribute("login");

String rno = request.getParameter("rno");

replyDTO dto = new replyDTO(); 

dto.Delete(rno);

out.println("댓글 삭제되었습니다.");
%>
