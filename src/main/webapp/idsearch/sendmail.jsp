<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="trip.mail.*" %>
<%@ page import="trip.dto.*" %>
<%
request.setCharacterEncoding("UTF-8");

//-------------------- 값 수령 --------------------
// @ 이전의 이메일 주소와 @ 이후 .com / .net 을 제외한 rerearEmail 값을 받음
String email = request.getParameter("email");
String rearEmail = request.getParameter("rearEmail");

// 수령한 값의 유효성 확인
if(email == null || rearEmail == null)
{
	out.print("올바른 메일주소가 아닙니다.");
	return;
}
// -------------------- 이메일 주소로 인증번호 전송 ----------------------- 
// 이메일 객체 생성
Sendmail sender = new Sendmail();
//인증코드를 얻는다.
String code = sender.AuthCode(6);

sender.setFrom(email + "@" + rearEmail + ".com");
sender.setTo(email + "@" + rearEmail + ".com");
sender.setAccount("gyr0204", "zxcv1234!!");

sender.setMail("아이디 찾기 인증코드입니다.", "인증코드 : " + code);
if( sender.sendMail() == true )
{
	// 해당 주소로 메일 전송이 성공했을 경우
	session.setAttribute("search_code", code);
	out.println("메일을 발송하였습니다.");
}else
{
	// 실패했을 경우
	out.println("메일 발송에 실패하였습니다.");
}
%>