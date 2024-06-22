<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trip.util.*" %>
<%@ include file="../include/head.jsp" %> 
<% 
request.setCharacterEncoding("UTF-8");

String pageno     = request.getParameter("page");
String type       = request.getParameter("type");
String bno        = request.getParameter("no");
String[] season   = request.getParameterValues("season"  );
String[] local    = request.getParameterValues("local"   );
String[] human    = request.getParameterValues("human"   );
String[] move     = request.getParameterValues("move"    );
String[] schedule = request.getParameterValues("schedule");
String[] uinout   = request.getParameterValues("uinout"  );
String[] keyword   = request.getParameterValues("keyword"  );
if(pageno  == null) pageno  = "1";
if(type    == null) type    = "T";
if(keyword == null) keyword = new String[] {""};
if(bno == null || bno.equals(""))
{
	response.sendRedirect("lobby.jsp");
	return;	
}

//파라메터를 생성한다.
String search_param = "";
search_param += Param.getParam(season,"season");
search_param += "&";
search_param += Param.getParam(local,"local");
search_param += "&";
search_param += Param.getParam(human,"human");
search_param += "&";
search_param += Param.getParam(move,"move");
search_param += "&";
search_param += Param.getParam(schedule,"schedule");
search_param += "&";
search_param += Param.getParam(uinout,"uinout");

String param = "";
param += "type=" + type;
param += "&";
param += "pageno=" + pageno;
param += "&";
param += "no=" + bno;
param += "&";
param += Param.getParam(keyword,"keyword");
param += "&";
param += search_param;

//본인 게시글이 맞는지 확인
boardDTO bdto = new boardDTO();
boardVO  bvo   = bdto.Read(bno, false);
if(!login.getUno().equals(bvo.getUno()))
{
	response.sendRedirect("index.jsp");
	return;	
}

//게시글 삭제
bdto.Delete(bno);

response.sendRedirect("index.jsp?type=" + type + "&keyword=" +  keyword);
%>