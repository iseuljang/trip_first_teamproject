<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
System.out.println((String)session.getAttribute("search_code"));
%>
<%= (String)session.getAttribute("search_code") %>