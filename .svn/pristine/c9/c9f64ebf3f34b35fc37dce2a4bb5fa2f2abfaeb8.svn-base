<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/idsearchok.css">
<%
request.setCharacterEncoding("UTF-8");
// ---------------------- 값 수령 -------------------------
String uname  = request.getParameter("name");
// @ 이전의 이메일 주소와 @ 이후 .com / .net 을 제외한 rerearEmail 값을 받음
String email = request.getParameter("email");
String rearEmail = request.getParameter("rearEmail");

// ------------------------ 수령한 값의 유효성 확인 ------------------------
if( uname == null || uname.equals("") || email == null | email.equals("") || rearEmail == null | rearEmail.equals(""))
{
	%>
	<script>
	alert("올바르지 않은 값입니다.("" or null)");
	</script>
	<%
	response.sendRedirect("../idsearch/idsearch.jsp");
	return;
}
//  ------------------------ 계정 조회 ------------------------
userDTO udto = new userDTO();
userVO uvo = new userVO();

// 입력받은 값으로 DB에 계정 조회
//daum이나 hanmail일때, .net으로 조회 
if(rearEmail.equals("daum") || rearEmail.equals("hanmail"))
{
	uvo = udto.Search(uname, email + "@" + rearEmail + ".net");
}else
{
	uvo = udto.Search(uname, email + "@" + rearEmail + ".com");
}

// ------------------------ 조회한 계정이 유효성 확인 ------------------------
if( uvo == null )
{
	%>
	<script>
		alert("해당 계정에 등록된 이메일이 맞는지 확인해주십시오.");
		document.location = "../idsearch/idsearch.jsp"
		return;
	</script>
	<%
	return;
}
%>
	<script>
	// ------------ 로그인 페이지 버튼 -----------------
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
				<td style="text-align: center;">
					<img src="../image/logo.jpg" width="60%" height="60%" class="img" style="margin:60px 0px 15px 0px">
				</td>
			</tr>
			<tr>
				<td><hr></td>					
			</tr>
			<tr>
				<td>
					<% 
					if(uvo.getUid() == null)
					{
						%>
						<h1>
							조회하신 아아디는<br> 
							존재하지 않습니다.					
						</h1> 
						<%
					}else
					{
						%>
						<h1>조회하신 아아디는<br> 
						<span style="color: blueviolet; font-size: 50px;">
							"<%= uvo.getUid() %>"
						</span>
						입니다.</h1> 
						<%
					} 
					%>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" class="login_button" onclick="gotoLogin();">로&nbsp;&nbsp;그&nbsp;&nbsp;인</button>
				</td>
			</tr>
			<tr>
				<td style="font-size: 15px; font-weight: bold;">
					비밀번호가 기억나지 않는다면?
					<a href="./pwsearch1.jsp"><p style="color: blue;">비밀번호 찾기</p></a>
				</td>
			</tr>
		</table>
	</body>
</html>