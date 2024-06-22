<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %> 
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
userVO login  = (userVO)session.getAttribute("login");
request.setCharacterEncoding("UTF-8");

//첨부파일 저장경로
String uploadPath = "D:\\BTEAM\\trip\\src\\main\\webapp\\upload";

int size = 10 * 1024 * 1024;
MultipartRequest multi = 
	new MultipartRequest(request,uploadPath,size,
		"UTF-8",new DefaultFileRenamePolicy());

String btitle   = multi.getParameter("btitle"); 	
String season   = multi.getParameter("season"); 	
String local    = multi.getParameter("local"); 	
String human    = multi.getParameter("human"); 	
String move     = multi.getParameter("move");	
String schedule = multi.getParameter("schedule");
String uinout   = multi.getParameter("uinout");
String bnote    = multi.getParameter("bnote");

//게시물 저장
boardVO bvo = new boardVO();
boardDTO bdto = new boardDTO();

bvo.setUno(login.getUno());
bvo.setBtitle(btitle);
bvo.setSeason(season);
bvo.setLocal(local);
bvo.setHuman(human);
bvo.setMove(move);
bvo.setSchedule(schedule);
bvo.setUinout(uinout);
bvo.setBnote(bnote);
bvo.setUnick(login.getUnick());
bdto.Insert(bvo);

//------------------------- 첨부파일 -------------------------- 
Enumeration files = multi.getFileNames();
String filename = "";
String phyname  = "";

ArrayList<attachVO> avoes = new ArrayList<attachVO>(); 

while(files.hasMoreElements()) 
{
	String name     = (String) files.nextElement();
	filename        = (String) multi.getFilesystemName(name);
	
	if(filename == null)
	{
		continue;
	}
	
	phyname = UUID.randomUUID().toString();
	String srcName    = uploadPath + "/" + filename;
	String targetName = uploadPath + "/" + phyname;
	File srcFile    = new File(srcName);
	File targetFile = new File(targetName);
	srcFile.renameTo(targetFile);
	
	attachVO avo = new attachVO();
	avo.setBno(bvo.getBno());
	avo.setFname(phyname);
	avo.setPname(filename);
	avoes.add(avo);
	attachDTO adto = new attachDTO();
	adto.Insert(avoes);
}


response.sendRedirect("../board/view.jsp?no=" + bvo.getBno());
%>

	




