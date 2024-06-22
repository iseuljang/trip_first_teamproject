<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %> 
<link rel="stylesheet" type="text/css" href="../css/retireok.css">
<%
//-------------------- 값 수령 --------------------
String upw  = request.getParameter("upw");
String ureason = request.getParameter("ureason");

//--------------------- 접근제어 ------------------
// 비로그인 상태일시
if( login == null)
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("로그인을 먼저 하십시오.");
		document.location = "../user/login.jsp"
		return;
	});
	</script>
	<%
	return;
}

// 입력한 pw 값 유효성 확인
if( upw ==  null || upw.equals("") )
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("잘못된 입력값입니다.");
		document.location = "../user/retire.jsp"
		return;
	});
	</script>
	<%
	return;
}

// --------------------- 회원탈퇴 -------------------------
userDTO dto = new userDTO();
//System.out.println("파메타로 받은 비번 : " + upw);
//System.out.println("로그인 객체에 저장된 비번 : " + login_vo.getUpw());
//System.out.println("새로만든 객체에 저장된 비번 : " + uvo.getUpw());

// 사용자가 입력한 비밀번호로 계정을 조회하여 계정 유무 판단
if( dto.Login(login.getUid(), upw) == null )
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("비밀번호가 일치하지 않습니다.");
		document.location = "../user/retire.jsp"
		return;
	});
	</script>
	<%
	return;
}
// 탈퇴 사유
String reason[] = {"",""};
// 임시로 일단 하나만 받음
if(ureason!=null)
{
	reason = ureason.split(":");
}

// 회원탈퇴 실행 --> false 일시 upw값 틀린 것
if( dto.Retire(login.getUid(), reason[0], upw) == false)
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("계정삭제에 실패하였습니다.");
		document.location = "../user/retire.jsp"
		return;
	});
	</script>
	<%
	return;
}
%>
<script>
// ------------ 로그인 페이지 이동 버튼 ----------------
function gotoLogin()
{
	document.location = "../user/login.jsp";
}
</script>
<table border="0" align="center" style="width: 60%;">
	<tr>
		<td style="text-align: center;"><img src="../image/logo.jpg" width="60%" height="60%" class="img"></td>
	</tr>
	<tr>
		<td><hr></td>					
	</tr>
	<tr>
		<td>
			<br> <h1><span style="color:rgb(192, 57, 43); font-size: 50px;"><%= login.getUname() %></span>님 회원탈퇴가<br>
			정상적으로 완료되었습니다.<br> 지금까지 여행추천가이드를 이용해 주셔서 감사합니다.</h1><br><br><br>
		</td>
	</tr>
	<tr>
		<td><button type="button" class="login_button" onclick="gotoLogin();">로&nbsp;&nbsp;그&nbsp;&nbsp;인</button></td>
	</tr>
	<tr>
		<td style="font-size: 15px; font-weight: bold;">
			비밀번호가 기억나지 않는다면?
			<a href="../idsearch/pwsearch1.jsp">비밀번호 찾기</a>
		</td>
	</tr>
</table>
</body>
</html>
<%
session.setAttribute("login", null);
%>