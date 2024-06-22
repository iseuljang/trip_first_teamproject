<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dao.*" %>    
<%@ page import="trip.dto.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>  
<%
request.setCharacterEncoding("UTF-8");

//로그인 여부를 세션을 통해 검사한다
userVO login  = (userVO)session.getAttribute("login");

ArrayList<chatVO> cvo_List  = new ArrayList<chatVO>();
chatDTO cdto = new chatDTO();
userDTO udto = new userDTO();

//채팅방 전체내용을 가져온다
cvo_List = cdto.GetList_All();


//이전채팅내용 전체불러오기
for(chatVO cvo : cvo_List)
{
	//회원들의 프로필 아이콘 가져오기
	userVO uvo   = udto.ShowUser(cvo.getUnick());
	//DB아이콘 숫자변환작업
	String icon = "😄";
	switch (uvo.getUicon())
	{
	case "1": icon  = "😄"; break;     				  
	case "2": icon  = "😆"; break;  
	case "3": icon  = "😅"; break;  
	case "4": icon  = "😀"; break;  
	case "5": icon  = "😨"; break;  
	case "6": icon  = "👿"; break;  
	case "7": icon  = "😝"; break;  
	case "8": icon  = "😷"; break;  
	case "9": icon  = "😴"; break;  
	case "10": icon  = "😱"; break; 
	}
	
	//작성된 채팅 시간표현 부분
 	String day = "";
	int date = Integer.parseInt(cvo.getCwdate());
	if(date < 60)
	{
		day  = " 분전]";
	}
	if(date >= 60 && date < 1440)
	{
		date = date / 60;
		day  = " 시간전]";
	}
	if( date >= 1440 && date < 44640)
	{
		date = date / 31;
		day  = " 일전]";
	}
	if( date >= 44640 && date < 535680)
	{
		date = date / 12;
		day  = " 달전]";
	}
	%>
	<!-- 전체 채팅방 내용 -->
	<div><%= icon %><%= cvo.getUnick() %> : <%= cvo.getCnote() %>[<%= date %><%= day %> </div>
	<%
}
%>
