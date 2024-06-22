<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="trip.mail.*" %>
<%@ page import="trip.dto.*" %>
<%@ page import="trip.vo.*" %>
<%
request.setCharacterEncoding("UTF-8");

//-------------------- 값 수령 --------------------
String uid = request.getParameter("uid");
String uname = request.getParameter("name");

//@ 이전의 이메일 주소와 @ 이후 .com / .net 을 제외한 rerearEmail 값을 받음
String email = request.getParameter("email");
String rearEmail = request.getParameter("rearEmail");

if(email == null || rearEmail == null)
{
	out.print("올바른 메일주소가 아닙니다.");
	return;
}

//----------------------- 계정 조회 ---------------------------

//받은 name, email 값을 토대로 계정 조회 
userDTO dto = new userDTO();
userVO uvo = new userVO();

uvo = dto.Search(uid, uname, email + "@" + rearEmail + ".com");
if(  uvo == null )
{
	//out.println("해당 아이디에 등록된 이름 혹은 이메일이 아닙니다.");
	out.println("99");
	return;
}

//-------------------- 이메일 주소로 인증번호 전송 -----------------------

Sendmail sender = new Sendmail();

//인증코드를 얻는다.
String code = sender.AuthCode(6);
//보내는 이 설정
sender.setFrom("gyr0204@naver.com");
sender.setAccount("gyr0204", "zxcv1234!!");

//받는이를 유저가 입력한 이메일 주소로 설정
//daum이나 hanmail일때, .net으로 주소 설정 
if(rearEmail.equals("daum") || rearEmail.equals("hanmail"))
{
	sender.setTo(email + "@" + rearEmail + ".net");
}else
{
	sender.setTo(email + "@" + rearEmail + ".com");
}

sender.setMail("비밀번호 찾기 인증코드입니다.", "인증코드 : " + code);
if( sender.sendMail() == true )
{
	// 해당 주소로 메일 전송이 성공했을 경우
	session.setAttribute("search_code", code);
	//out.println("메일을 발송하였습니다.");
	out.println("01");
}else
{
	// 실패했을 경우
	//out.println("메일 발송에 실패하였습니다.");
	out.println("00");
}
%>