<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ include file="../include/head.jsp" %>   
<%
request.setCharacterEncoding("UTF-8");

//업로드가 가능한 최대 파일 크기를 지정한다.
int size = 10 * 1024 * 1024;
MultipartRequest multi = 
	new MultipartRequest(request,uploadPath,size,
		"UTF-8",new DefaultFileRenamePolicy());

String btitle     = multi.getParameter("btitle"); 	
String season     = multi.getParameter("season"); 	
String local      = multi.getParameter("local"); 	
String human      = multi.getParameter("human"); 	
String move       = multi.getParameter("move");	
String schedule   = multi.getParameter("schedule");
String uinout     = multi.getParameter("uinout");
String bnote      = multi.getParameter("bnote");
String bno        = multi.getParameter("no");
String[] anos      = multi.getParameterValues("ano");

//업로드된 파일명을 얻는다.
Enumeration files = multi.getFileNames();
String filename = "";
String phyname  = "";

//선택한 기존첨부파일 삭제
if(anos != null)
{
	for(String ano : anos)
	{
		DBManager db = new DBManager();
		db.DBOpen();
		String sql = "";
		sql += "delete from attach where ano = '" + ano + "'";
		db.RunSQL(sql);
		db.DBClose();
	}
}


while(files.hasMoreElements()) 
{
	String name     = (String) files.nextElement();
	filename        = (String) multi.getFilesystemName(name);
	
	if(filename == null)
	{
		//업로드된 파일명이 null이 있으면
		continue;
	}
	
	phyname = UUID.randomUUID().toString();
	String srcName    = uploadPath + "/" + filename;
	String targetName = uploadPath + "/" + phyname;
	File srcFile    = new File(srcName);
	File targetFile = new File(targetName);
	srcFile.renameTo(targetFile);
	
	out.print("ID : " + name + "<br>");
	out.print("원래 파일명 : " + filename + "<br>");
	out.print("저장 파일명 : " + phyname + "<br><hr>");
	
	//여러개 첨부파일 객체배열에 담는작업 
	ArrayList<attachVO> avoes = new ArrayList<attachVO>(); 
	attachDTO adto = new attachDTO();
	attachVO avo   = new attachVO();
	avo.setBno(bno);
	avo.setFname(phyname);
	avo.setPname(filename);
	avoes.add(avo);
	//첨부파일 저장
	adto.Insert(avoes);
	
}


boardVO bvo = new boardVO();
boardDTO bdto = new boardDTO();

bvo.setBtitle(btitle);
bvo.setSeason(season);
bvo.setLocal(local);
bvo.setHuman(human);
bvo.setMove(move);
bvo.setSchedule(schedule);
bvo.setUinout(uinout);
bvo.setBnote(bnote);
bvo.setBno(bno);

//게시물 저장
bdto.Update(bvo);

%>
<script>
$(document).ready(function(){

	document.location = "../board/view.jsp?no=<%= bvo.getBno() %>";
	alert("글수정이 완료되었습니다.");
});
</script>