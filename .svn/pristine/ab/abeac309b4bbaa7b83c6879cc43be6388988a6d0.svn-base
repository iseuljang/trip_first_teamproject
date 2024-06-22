<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<%
//아이디와 비밀번호의 이메일 인증번호값을 저장하는 session 객체를 초기화함
session.setAttribute("search_code", null);
%>
	<script>
	// 다음 페이지 조건을 위한 flag 설정
	var flag = false;
	
	$(document).ready(function()
	{
		$("#name").focus();
	});
	
	// ------------------------ 작성한 이메일주소로 인증번호 전송 버튼 ------------------------
	function SendMail()
	{
		var email = $("#email").val();
		
		// 대소문자 영어, 숫자와 매치가 안될 시
		var pattern = /^[a-zA-Z0-9]*$/;
		if(email.match(pattern) == null)
		{
			alert("올바른 메일주소를 입력해주세요");
			$("#email").focus();
			return;
		}
		
		// 메일 주소는 5글자 이상
		if($("#email").val().length < 5)
		{
			alert("메일주소를 5자 이상 입력해주세요.");
			$("#code").focus();
			return;
		}
		
		// 메일 주소는 64글자 이하
		if($("#email").val().length > 64)
		{
			alert("메일주소는 64자 이하여야 합니다.");
			$("#code").focus();
			return;
		}
		
		//ajax로 sendmail(id).jsp에 전송후, 결과 값을 alert함
		$.ajax({
			type : "get",
			url: "../idsearch/sendmail(id).jsp?email=" + email + "&rearEmail=" + $('#rearEmail').val() + "&name=" + $('#name').val(),
			dataType: "html",
			success : function(result) 
			{
				result = result.trim();
				alert(result);
			}			
		});		
	}
	
	// ------------------------ 이메일 인증코드 일치 확인 버튼 ------------------------ 
	function DoEmail()
	{
		if($("#code").val() == "")
		{
			alert("인증코드를 입력하세요.");
			$("#code").focus();
			return;
		}	
		
		//ajax로 getcode.jsp의 결과값과 비교
		$.ajax({
			type : "get",
			url: "../idsearch/getcode.jsp",
			dataType: "html",
			success : function(result) 
			{
				result = result.trim();
				if($("#code").val() == result)
				{
					alert("인증완료되었습니다.");	
					flag = true;
				}else
				{
					alert("인증번호가 일치하지 않습니다.");
					$("#code").focus();
				}
			}			
		});		
	}

	// ------------------------ 다음 페이지 버튼 ------------------------
	function Next()
	{
		if($("#name").val() == "")
		{
			alert("이름을 입력하세요.");
			$("#name").focus();
			return;
		}
		if($("#email").val() == "")
		{
			alert("이메일을 입력하세요.");
			$("email").focus();
			return;
		}
		if($("#code").val() == "")
		{
			alert("인증번호를 입력하세요.");
			$("#num").focus();
			return;
		}
		// 조건 불충족시
		if(flag == false)
		{
			alert("인증번호 확인을 먼저 해주십시오.");
			return;
		}
		
		if(confirm("아이디를 찾으시겠습니까?") == true)
		{
			$("#idsearch").submit();
		}
				
	}
	</script>
	<style>
		input
		{
			width: 400px;
			height: 40px;
			font-size: 20px;
			border-radius: 0.3em;
			border-collapse: collapse;
		}
		
		td
		{
			text-align: center;
			font-size: 20px;
			font-weight: bolder;
		}
		
		.num_button
		{
			border: 1px solid #d9d9d9;
	    	cursor:pointer; cursor:hand;
		  	background-color: skyblue;
		  	color: white;
		  	border-radius: 0.5em;
		  	width: 150px;
		  	height: 2em;
  			line-height: -3em;
  			font-size: 20px;
  			font-weight: ;
		}
		
		#rearEmail
		{
			width: 140px;
			height: 43px;
			font-size: 15px;
			border-radius: 0.3em;
			border-collapse: collapse;
			border-style : solid;
			
		}
		
		.ok_button
		{
			border: 1px solid #d9d9d9;
	    	cursor:pointer; cursor:hand;
		  	background-color: skyblue;
		  	color: black;
		  	border-radius: 0.2em;
		  	width: 450px;
		  	height: 80px;
  			font-size: 50px;
  			font-weight: bolder;
  			color: white;
		}
	</style>
	<body>
		<table border="0" width="100%">
			<tr>
				<td colspan="5">
				</td>
			</tr>
		</table>
		<form id="idsearch" name="idsearch" method="post" action="idsearchok.jsp">
			<table border="0" align="center" style="width: 60%;">
				<tr>
					<td style="text-align: center;"><img src="../image/logo.jpg" width="60%" height="60%" class="img" style="margin:40px 0px 20px 0px;" ></td>
				</tr>
				<tr>
					<td>
						<hr>
					</td>					
				</tr>
				<tr>
					<td>
						<h1 style="margin-bottom : 100px">아이디를 찾으시려면,<br> 회원정보에 등록된 이메일로 인증해주세요.</h1>
					</td>					
				</tr>
				<tr>
					<td style="padding-left: 10px;">
						이름 &nbsp;&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;
						<input type="text" id="name" name="name" placeholder="이름을 입력해주세요." style="margin-left : 10px;">
					</td>
				</tr>
				<tr>	
					<td style="padding-left: 150px;">
						이메일 &nbsp;&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;
						<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요." maxlength= 20;  style="height : 40px; width : 250px;">
						<select id="rearEmail" name="rearEmail">
							<option value="naver">@naver.com</option>
							<option value="gmail">@gmail.com</option>
							<option value="daum">@daum.net</option>
							<option value="nate">@nate.com</option>
							<option value="hanmail">@hanmail.net</option>
						</select>
						<button type="button" class="num_button" onclick="SendMail();">인증번호 발송</button>
					</td>
				</tr>
				<tr>
					<td width="100" style="padding-left: 135px;">
						인증번호 &nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;
						<input type="text" id="code" name="code" placeholder="인증번호를 입력해주세요.">
						<button type="button" class="num_button" onclick="DoEmail();">인증번호 확인</button>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="ok_button" onclick="Next();" style="margin-top : 50px; margin-left : 100px">다&nbsp;&nbsp;음</button>
					</td>
				</tr>
				<tr>
					<td>
						<h2 style=" margin-left : 100px; margin-top :50px;"> 이메일이 오지 않는다면?</h2>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<i style=" margin-left : 100px; color: royalblue; font-size: 15px;">
							여행추천가이드가 발송한 메일이 스팸 메일로 분류된 것은 아닌지 확인해 주세요.<br>
							스팸 메일함에도 메일이 없다면, 다시 한 번 '인증번호 받기'를 눌러주세요.
						</i>
					</td>
				</tr>
			</table>
		</form> 
	</body>
</html>