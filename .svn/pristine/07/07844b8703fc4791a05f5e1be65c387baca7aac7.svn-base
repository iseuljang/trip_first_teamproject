<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>  
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %>     
<%
request.setCharacterEncoding("UTF-8");

String bno     = request.getParameter("no");

attachDTO adto = new attachDTO();
//게시물의 기존첨부파일 불러오기
ArrayList<attachVO> avos = adto.Read(bno);

//기존파일이 존재하면
if( avos.isEmpty() != true)
{	
	for(attachVO avo : avos)
	{
		%>
		<tr>
			<td><input type="checkbox" name="ano" value="<%= avo.getAno() %>"></td>
			<td><a href="download.jsp?no=<%= bno %>"><%= avo.getPname() %></a></td>
			<td align="center"><a href="javascript:;" onclick="RemoveAttach(this);">삭제</a></td>
		</tr>
		<%
	}
}
%>
<!-- 첨부파일추가 부분 -->
<tr>
	<td><input type="checkbox" name="ano"></td>
	<td><input type="file" id="attach" name="attach_<%=UUID.randomUUID().toString() %>"></td>
	<td align="center"><a href="javascript:;" onclick="RemoveAttach(this);">삭제</a></td>
</tr>