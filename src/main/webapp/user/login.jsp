<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>    
<%@ page import="trip.dto.*" %>    
<%@ include file="../include/head.jsp" %>
<%
// 쿠키가 있다면 받아옴 --> (탈퇴시 쿠키 제거 기능은 보류상태)
Cookie[] cookie = request.getCookies();
Cookie getcookie = new Cookie( "uid", "");
// 쿠키 유뮤 판단용 flag 생성
boolean remember = false;
String remID = "";
if( cookie != null)
{
	for(Cookie c : cookie)
	{
		System.out.println(c.getName());
		if(c.getName().equals("uid"))
		{
			remID = c.getValue();
			remember = true;
		}
	}
}

%>
<script>
	$(document).ready(function()
	{
		$("#uid").focus();
		
		$("#btnLogin").click(function(){
			DoLogin();
		});
		
		$("#uid,#upw").keyup(function(event){
			if(event.keyCode == 13)
			{	//Enter문자가 눌려짐. keyCode 아스키코드. 13이 enter 
				DoLogin();
			}
		});
		
	});
	
	
	// ------------------- 로그인 버튼 ---------------------
	function DoLogin()
	{
		console.log($("input[id='loginRemember']:checked"));
		
		if($("#uid").val() == "")
		{
			alert("아이디를 입력하세요.");
			$("#uid").focus();
			return;
		}
		if($("#upw").val() == "")
		{
			alert("비밀번호를 입력하세요.");
			$("#upw").focus();
			return;
		}
		
		// loginok.jsp를 통해 ajax로 DB 계정을 조회하여 사용자에게 알림
		$.ajax({
			type : "post",
			url : "./loginok.jsp",
			data : 
			{
				uid : $("#uid").val(),
				upw : $("#upw").val(),
				remember_id : $("input[id='loginRemember']:checked").length
			},
			dataType : "html",
			success : function(result)
			{
				result = result.trim();
				switch(result)
				{
				case "ERROR" :
					alert("아이디 또는 비밀번호가 일치하지 않습니다.");
					$("#uid").focus();
					break;
				case "OK" :
					alert("로그인이 되었습니다.");
					document.location = "../firstmain/lobby.jsp";
					break;
				case "RETIRE" :
					alert("탈퇴 처리된 계정입니다.");
					location.reload();
					break;
				case "STOP" :
					alert("정지된 계정입니다.");
					location.reload();
					break;	
				}
			}
		}); 
	}
</script>
		<table border="0" width="100%">
			<tr>
				<td colspan="3">&nbsp;</td>
				<td height="60px">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3"></td>
				<td align="center" style="font-size:50px;" ><img src="../image/logo.jpg" width="500px" height="150px" class=img> </td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3"></td>
				<td align="center">
					<form id="login" name="login" method="post" action="loginok.jsp">
						<input type="text" name="uid" id="uid" size="33" style="height:60px; font-size:24px;"
						 value="<%= (!remID.equals("")) ? remID : ""%>"><br>
						<input type="password" name="upw" id="upw" size="33" style="height:60px; font-size:24px;"><br>
						<input type="checkbox" name="remember_id" id="loginRemember" value="remember_id"
						<%= (remember == true) ? "checked" : ""  %>>아이디 기억하기
						&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
						<input type="button" class="lbtn" id="btnLogin" value="로그인"><br>
					</form>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3"></td>
				<td align="center">
					<a href="../idsearch/idsearch.jsp"><input type="button" class="whitebtn" value="아이디 찾기"></a>
					<a href="../idsearch/pwsearch1.jsp"><input type="button" class="whitebtn" value="비밀번호 찾기"></a>
					<a href="join.jsp"><input type="button" class="whitebtn" value="회원가입"></a>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3"></td>
				<td align="center"><a href="../firstmain/lobby.jsp"><input type="button" value="비회원으로 계속 이용하기" class="bbtn"></a></td>
				<td></td>
			</tr>
		</table>
	</body>
</html>