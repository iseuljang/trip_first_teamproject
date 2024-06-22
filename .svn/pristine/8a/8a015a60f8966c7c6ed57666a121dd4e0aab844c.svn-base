<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>  
<%@ include file="../include/head.jsp" %>   
<%
int size = 100 * 1024 * 1024;

String encType= "UTF-8";

MultipartRequest multi; 

try{ 
 		multi = new MultipartRequest( 
 				request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy()
 				);

		Enumeration files = multi.getFileNames(); 
		String fileid     = (String) files.nextElement();
		String filename   = (String) multi.getFilesystemName("fname"); 
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		
		while(files.hasMoreElements())
		{
			String file = (String)files.nextElement();
			String file_name = multi.getFilesystemName(file);
			String org_file_name = multi.getOriginalFileName(file);
			
			map.put(file_name, org_file_name);
		}
		
		request.setAttribute("map", map);
		
}catch(Exception e)
{
 	e.printStackTrace();
 	return;
}

RequestDispatcher dispatcher = request.getRequestDispatcher("../upload");
dispatcher.forward(request, response);


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

bdto.Insert(bvo);



/* //첨부파일 저장
attachVO  avo  = new attachVO();
attachDTO adto = new attachDTO();
avo.setBno(bno);
avo.setFname(fname);
avo.setPname(pname);
adto.Insert(list); */




//response.sendRedirect("../board/index.jsp");

%>
<script>
$(document).ready(function(){

	document.location = "../board/index.jsp";
	alert("글등록이 완료되었습니다.");
	
});
</script>




