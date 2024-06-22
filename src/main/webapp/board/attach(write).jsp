<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>  
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %>     

<tr>
	<td><input type="file" id="attach" name="attach_<%=UUID.randomUUID().toString() %>"></td>
	<td align="center"><a href="javascript:;" onclick="remove_File(this);">삭제</a></td>
</tr>