<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>      
<%@ include file="../include/head.jsp" %>   
<%
request.setCharacterEncoding("UTF-8");

//첨부파일 번호 값
String ano = request.getParameter("no");

//첨부파일 정보를 조회한다.
attachDTO adto = new attachDTO();
attachVO  avo  = adto.Read_1(ano);

//첨부파일을 브라우저로 전송한다
response.setContentType("application/octet-stream");   
response.setHeader("Content-Disposition","attachment; filename=" + avo.getPname() + "");   
String fullname = uploadPath + "\\" + avo.getFname();
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