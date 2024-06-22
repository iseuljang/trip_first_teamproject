<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %> 
<%
request.setCharacterEncoding("UTF-8");

//-------------------- 값 수령 --------------------
// 체크가 된 모든 adno를 문자열로 받아옴
String checkedValueTotal = request.getParameter("checkedValueTotal");

// , 를 기준으로 값들을 쪼개 배열로 저장
String adnoList[] = checkedValueTotal.split(",");

//-------------------- 해당 공지글 삭제 --------------------

adminboardDTO dto = new adminboardDTO();

// 반복문을 통해 원소를 하나씩 Delete 함
for(String adno : adnoList)
{
	
	if( dto.Delete(adno) == false )
	{
		out.println("0");
	}else
	{
		out.println("1");
	} 
}
%>