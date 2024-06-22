<%@ page language="java" contentType="text/html; charset=UTF-8"
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

//작성한 채팅 메세지
String msg = request.getParameter("msg");
if(msg == null) msg = "";

//DB아이콘 숫자변환작업
String icon = "😄";
switch (login.getUicon())
{
case "1": icon  = "😄"; break;     				  
case "2": icon  = "😅"; break;  
case "3": icon  = "😆"; break;  
case "4": icon  = "😀"; break;  
case "5": icon  = "😨"; break;  
case "6": icon  = "👿"; break;  
case "7": icon  = "😝"; break;  
case "8": icon  = "😷"; break;  
case "9": icon  = "😴"; break;  
case "10": icon  = "😱"; break;  
}


//작성내용과 회원정보 객체에 담기
chatVO  cvo  = new chatVO();
cvo.setCnote(msg);
cvo.setUno(login.getUno());
cvo.setCnote(msg);
cvo.setUnick(login.getUnick());

//채팅내용저장
cvo.setUnick(login.getUnick());

chatDTO cdto = new chatDTO();
boolean ok = cdto.Insert(cvo);

//사용자가 작성하고 저장된거 바로 가져오기
cdto.DBOpen();
String sql = "";
sql += "select *, timestampdiff(minute,date_format(cwdate,'%Y-%m-%d %H:%i'),date_format(now(),'%Y-%m-%d %H:%i')) as time_diff FROM chat where uno = " + login.getUno() + " order by cno desc";
cdto.OpenQuery(sql);
if(cdto.GetNext() == true)
{
	cvo.setCno(cdto.GetValue("cno"));
	cvo.setCnote(cdto.GetValue("cnote"));
	cvo.setCwdate(cdto.GetValue("time_diff"));
	cvo.setUno(cdto.GetValue("uno"));
	cvo.setUnick(cdto.GetValue("unick"));
}

if(ok == true)
{
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
	//사용자가 작성한 내용
	out.print("<div>"+ icon + cvo.getUnick() + " : " + cvo.getCnote() + "[" + date + day + "</div>");
}else
{
	out.print("메세지 저장 실패");
}
%>