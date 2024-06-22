<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/pwsearch2.css">
<%
request.setCharacterEncoding("UTF-8");
//아이디와 비밀번호의 이메일 인증번호값을 저장하는 session 객체를 초기화함
session.setAttribute("search_code", null);
%>
<%
// -------------------- 값 수령 --------------------
String uid  = request.getParameter("id");

// 값 유효성 확인
if( uid == null || uid.equals(""))
{
	response.sendRedirect("../idsearch/pwsearch1.jsp");
	return;
}

//------------------------ 계정 조회 ------------------------
userDTO udto = new userDTO();
// 수령한 uid의 값을 통해 id를 조회 
if(udto.CheckID(uid) == false)
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("해당 아이디는 존재하지 않습니다.");
		history.back();
		return;
	});
	</script>
	<%
	return;
}else
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("조회하신 아이디는 '<%= uid %>'입니다.");
		return;
	});
	</script>
	<%
}
%>
	<script>
	// 다음 페이지 조건을 위한 flag 설정
	var flag = false;
	
	$(document).ready(function()
	{
		$("#attach1-1").focus();
		
		$("#attach1-3").keyup(function(event){
			if(event.keyCode == 13)
			{
				search();	
			}
		});
		
		$("#attach2").click(function(event){
				search();	
		});
	});	
	
	// -------------- 해당 이메일주소로 인증번호 전송 버튼 -----------------
	function SendMail()
	{
		var email = $("#attach1-2").val();
		
		// 대소문자 영어, 숫자와 매치가 안될 시
		var pattern = /^[a-zA-Z0-9]*$/;
		if(email.match(pattern) == null)
		{
			alert("올바른 메일주소를 입력해주세요");
			$("#attach1-2").focus();
			return;
		}
		
		// 메일 주소는 5글자 이상
		if($("#attach1-2").val().length < 5)
		{
			alert("메일주소를 5자 이상 입력해주세요.");
			$("#attach1-2").focus();
			return;
		}
			
		// 메일 주소는 64글자 이하
		if($("#attach1-2").val().length > 64)
		{
			alert("메일주소는 64자 이하여야 합니다.");
			$("#attach1-2").focus();
			return;
		}
		
		//ajax로 sendmail(pw).jsp에 전송후, 결과 값을 alert함
		$.ajax({
			type : "get",
			//** 비밀번호 조회는 uid, uname, email 세 값을 통해 계정을 조회함 **  
			// -> 이전 페이지에서 입력한 아이디와 별개로, 현재 페이지에서 입력한 이름과 이메일로 조회가 될 수 있기 때문 
			url: "../idsearch/sendmail(pw).jsp?uid=<%= uid %>&email="+ email +"&rearEmail=" + $('#rearEmail').val() + "&name=" + $('#attach1-1').val(),
			dataType: "html",
			success : function(result) 
			{
				result = result.trim();
				switch(result)
				{
					case "00" :
						alert("메일을 발송에 실패했습니다.");
						break;
					
					case "01" :
						alert("메일을 발송하였습니다.");
						break;
						
					case "99" :
						alert("해당 아이디에 등록된 이름 혹은 이메일이 아닙니다.");
						if(confirm("아이디를 다시 입력하기 위해 이전 페이지로 돌아가시겠습니까?") == true)
						{
							history.back();	
						}
						break;	
				}
			}			
		});		
	}
	
	// --------------- 이메일 인증코드 확인 버튼 ----------------
	function DoEmail()
	{
		if($("#attach1-3").val() == "")
		{
			alert("인증코드를 입력하세요.");
			$("#attach1-3").focus();
			return;
		}		
		
		$.ajax({
			type : "get",
			url: "../idsearch/getcode.jsp",
			dataType: "html",
			success : function(result) 
			{
				result = result.trim();
				if($("#attach1-3").val() == result)
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
	
	// ------------ 다음 페이지 버튼 ----------------
	function next()
	{
		if($("#attach1-1").val() == "")
		{
			alert("아이디를 입력하세요.");
			$("#attach1-1").focus();
			return;
		}	
			
		if($("#attach1-2").val() == "")
		{
			alert("이메일을 입력하세요.");
			$("#attach1-2").focus();
			return;
		}	
			
		if($("#attach1-3").val() == "")
		{
			alert("인증번호를 입력해주세요.");
			$("##attach1-3").focus();
			return;
		}
		
		// 조건 불충족시
		if(flag == false)
		{
			alert("인증번호 확인을 먼저 해주십시오.");
			return;
		}

		if(confirm("비밀번호를 찾으시겠습니까?") == true)
		{
			$("#pwsearch").submit();
		}
			
	}
	</script>
	<style>
		.certifi
		{
			cursor:pointer; cursor:hand;
		}
		
	</style>
	</head>
	<body>
		<div id= "memberchange" name = "memberchange">
			<div class="intro_bg">
				<div class="header">
				</div>
			</div>
		</div>
		<div class="hline1"></div>		
		<div class="str">
			본인확인 이메일로 인증해주세요
		</div>
		<div class="str1">
			본인확인 이메일 주소와 입력한 이메일 주소가 같아야<br>
			인증번호를 받을 수 있습니다.
		</div>
		<div style="margin-bottom:10px"></div>
		<form id="pwsearch" name="pwsearch" method="post" action="pwsearch3.jsp">
		<input type="hidden" id="id" name="id" value="<%= uid %>">
			<table>
				<tr>
					<td class="attach" style="height : 50px">
						이 름
					</td>
					<td>
						<input type="text" id="attach1-1" class="attach1" name="name" placeholder="이름을 입력해주세요" style="margin-bottom : 10px">
					</td>
					<td>
						<div class="certifi1"></div>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="attach">
						이메일
					</td>
					<td>
						<input type="text" id="attach1-2" class="attach1" name="email" placeholder="이메일을 입력해주세요" style="width : 180px;">
						<select id="rearEmail" class="attach1" name="rearEmail" style="border-radius: 13px 13px 13px 13px; width : 220px;">
							<option value="naver">@naver.com</option>
							<option value="gmail">@gmail.com</option>
							<option value="daum">@daum.net</option>
							<option value="nate">@nate.com</option>
							<option value="hanmail">@hanmail.net</option>
						</select>
					</td>
					<td>
						<div class="certifi" onclick="SendMail();">인증번호 받기</div>
					</td>
				</tr>
			</table>
			<div style="margin-bottom:10px"></div>
			<table>
				<tr>
					<td class="attach">인증</td>
					<td>
						<input type="text" id="attach1-3" class="attach1" name="num" placeholder="인증번호를 입력해주세요">
					</td>
					<td>
						<div class="certifi" onclick="DoEmail();">인증번호 확인</div>
					</td>
				</tr>
			</table>
		</form>
		<div style="margin-bottom:10px"></div>
		<div id="attach2" class="attach2" onclick="next();">다 음</div>
		<p class="str1">
			이메일이 오지 않는다면?<br>
		</p>
		<p class="str2">
			여행추천가이드가 발송한 메일이 스팸 메일로 분류된 것은 아닌지 확인해 주세요<br>
			스팸 메일함에도 메일이 없다면, 다시 한 번 '인증번호 받기'를 눌러주세요
		</p>
	</body>
</html>