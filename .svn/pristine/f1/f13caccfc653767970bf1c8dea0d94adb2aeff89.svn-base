<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.net.URLEncoder" %> 
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ include file="../include/head.jsp" %> 
<%
//-------------------- 값 수령 --------------------
// 첨부파일 값을 설정 후 받아옴 -> 실패시 이전 페이지로 돌아감
int size = 10 * 1024 * 1024; 
MultipartRequest multi; 
try{
		multi =  
			new MultipartRequest(
					request,
					uploadPath,
					size, 
					"utf-8",
					new DefaultFileRenamePolicy()
				);
}catch(Exception e)
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("공지 게시글 저장에 실패했습니다.");
		history.back();
		return;
	});
	</script>
	<%
	e.printStackTrace();
	return;
}
//multi를 통해 값을 받아옴
String uno = multi.getParameter("uno");
String adtitle = multi.getParameter("adtitle");
String startday = multi.getParameter("startday");
String endday = multi.getParameter("endday");

// 받아온 값의 유효성 확인
if(uno == null || adtitle == null
|| startday == null|| endday == null
|| uno.equals("") || startday.equals("") 
|| uno.equals("") || endday.equals("") )
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("유효하지 않은 값입니다.");
		history.back();
		return;
	});
	</script>
	<%
}

// Enumeration 파일 객체 생성
Enumeration files = multi.getFileNames();
String fileid = (String) files.nextElement();
String filename = (String) multi.getFilesystemName("fname");				

//물리명을 설정 후, 원본파일, 물리파일의 업로드 경로 설정
String phyname = null;
if(filename != null) 
{
	phyname = UUID.randomUUID().toString();  
	String srcName    = uploadPath + "/" + filename;  
	String targetName = uploadPath + "/" + phyname;   
	File srcFile    = new File(srcName);
	File targetFile = new File(targetName);
	srcFile.renameTo(targetFile);
}

//dto, vo 설정 
adminboardDTO dto = new adminboardDTO();
adminboardVO  vo  = new adminboardVO();

//vo에 받아온 값을 넣음
vo.setUno(uno);
vo.setAdtitle(adtitle);
vo.setEndday(endday);
vo.setStartday(startday);
vo.setFname(filename);
vo.setPname(phyname);

// DB에 insert함
if(dto.Insert(vo) == false)
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("유효하지 않은 값입니다.");
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
		
		alert("공지 게시물이 등록되었습니다.");
		document.location = "masterGonggiwrite.jsp";
	});
	</script>
	<%
}
%>