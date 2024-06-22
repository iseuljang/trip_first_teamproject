<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/pwsearchok.css"> 
<%
request.setCharacterEncoding("UTF-8");
//-------------------- 값 수령 --------------------
// 전 페이지에서 입력받은 pw값
String upw  = request.getParameter("pw");
String uid  = request.getParameter("id");
String uname  = request.getParameter("name");
//@ 이전의 이메일 주소값 -> email
String email  = request.getParameter("email");
//@ 이후 .com / .net 을 제외한 이메일 주소값 -> rerearEmail
String rearEmail = request.getParameter("rearEmail");

//받아온 값의 유효성 확인
if(  upw == null || upw.equals("") || uid == null || uid.equals("") || uname == null || uname.equals("") ||  email == null | email.equals("") || rearEmail == null || rearEmail.equals(""))
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("올바르지 않은 값입니다.( null or 공백) ");
		history.back();
		return;
	});
	</script>
	<%
	return;
}

//------------------------ 계정 조회 ------------------------

userDTO udto = new userDTO();
userVO uvo = new userVO();

//입력한 이름과 이메일 hidden으로 받아온 값을 통해 계정 조회
//daum이나 hanmail일때, .net으로 조회 
if(rearEmail.equals("daum") || rearEmail.equals("hanmail"))
{
	uvo = udto.Search(uid, uname, email + "@" + rearEmail + ".net");
}else
{
	uvo = udto.Search(uid, uname, email + "@" + rearEmail + ".com");
}

// 조회한 계정이 유효한지 확인
if(uvo == null)
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("조회할 수 없는 계정입니다.");
		history.back();
		return;
	});
	</script>
	<%
	return;
}

//변경할 비밀번호를 set
uvo.setUpw(upw);

//변경할 비밀번호가 기존 비밀번호와 같은 경우 
// -> **보안상 DB에 저장된 비밀번호를 꺼내올 수 없기 때문에 
//    DuplicateCheck 이라는 메소드를 추가함** 
if( udto.DuplicateCheck(uvo) == true )
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("기존의 비밀번호로는 변경할 수 없습니다.");
		history.back();
		return;
	});
	</script>
	<%
	return;
}

//변경 실패시
if(udto.Change(uvo) == false)
{	
	%>
	<script>
	$(document).ready(function(){
		
		alert("비밀번호 변경 오류입니다.");
		history.back();
		return;
	});
	</script>
	<%
	return;
}
%>
	<script>
		// ------------ 로그인 화면 버튼 ----------------
		function gotoLogin()
		{
			document.location = "../user/login.jsp";
		}
	</script>
	<body>
		<table border="0" width="100%">
			<tr>
				<td colspan="5">
				</td>
			</tr>
		</table>
		<table border="0" align="center" style="width: 60%;">
			<tr>
				<td style="text-align: center;"><img src="../image/logo.jpg" width="60%" height="60%" class="img" style="margin:180px 0px 20px 0px"></td>
			</tr>
			<tr>
				<td><hr></td>					
			</tr>
			<tr>
				<td>
					<h1>
						<%= uvo.getUname() %>님 !
						<span style="color: blue; font-size: 38px;">비밀번호가 정상적으로 변경되었습니다.</span>
					</h1><br>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" class="login_button" onclick="gotoLogin();">로&nbsp;&nbsp;그&nbsp;&nbsp;인</button>
				</td>
			</tr>
		</table>
	</body>
</html>