<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>  
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %>    
<%@ include file="../include/head.jsp" %> 
<%
String bno = request.getParameter("no");

// 공지글 조회
adminboardDTO dto = new adminboardDTO();
adminboardVO  vo   = dto.Read(bno);

response.setContentType("application/octet-stream");	 
response.setHeader("Content-Disposition","attachment; filename=" + vo.getFname() + "");
String fullname = uploadPath + "\\" + vo.getPname();
File file = new File(fullname);
FileInputStream fileIn = new FileInputStream(file);
ServletOutputStream ostream = response.getOutputStream();

byte[] outputByte = new byte[4096];
//copy binary contect to output stream
while(fileIn.read(outputByte, 0, 4096) != -1)
{
	ostream.write(outputByte, 0, 4096);
}
fileIn.close();
ostream.flush();
ostream.close();

%>






