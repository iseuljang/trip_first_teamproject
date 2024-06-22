<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %> 
<script>
// 사용가능한 아이디를 입력확인
var idcheck = false;
// 사용가능한 비밀번호를 입력확인
var pwcheck = false;
// 비밀번호 재입력확인
var pwcheckagain = false;
// 사용가능한 이름 확인
var namecheck = false;
// 사용가능한 닉네임 확인
var nickcheck = false;
// 사용가능한 이메일 확인
var emailcheck = false;
// 이메일 인증번호 확인
var emailcode = false;
// 자동가입 방지 인증번호 확인
var signcode = false;

$(document).ready(function()
{
	$("#uid").focus();	
	
	// 유저가 id에 입력하는 값의 상태를 ajax로 파악하여 아이디 입력창 하단에 띄움 
	$("#uid").keyup(function(){
		IsDuplicate = false;
		
		userid = $(this).val();
		var pattern = /^[a-zA-Z0-9]*$/;
		if(userid.match(pattern) == null)
		{
			$("#btnmsg").html("특수문자나 한글을 사용할 수 없습니다.");
			$("#btnmsg").css("color","red");
			return;
			idcheck = false;
		}
		
		$.ajax({
			url : "idcheck.jsp?uid=" + userid,
			type : "get",
			dataType : "html",
			success : function(result)
			{
				result = result.trim();
				switch(result)
				{
				case "-1" : 
					$("#btnmsg").html("아이디를 입력해주세요");
					$("#btnmsg").css("color","blue");
					idcheck = false;
					break;
				case "00" : 
					$("#btnmsg").html("아이디 체크 오류입니다.");
					$("#btnmsg").css("color","red");
					idcheck = false;
					break;
				case "01" : 
					$("#btnmsg").html("중복된 아이디입니다.");
					$("#btnmsg").css("color","red");
					IsDuplicate = true;
					idcheck = false;
					break;
				case "02" : 
					$("#btnmsg").html("사용 가능한 아이디입니다.");
					$("#btnmsg").css("color","green");
					idcheck = true;
					break;
				case "03" : 
					$("#btnmsg").html("아이디는 4자리 이상이어야 합니다.");
					$("#btnmsg").css("color","red");
					idcheck = false;
					break;
				case "04" : 
					$("#btnmsg").html("아이디는 20자리 이하여야 합니다.");
					$("#btnmsg").css("color","red");
					idcheck = false;
					break;
				}
			}
		});
		
		// 사용 가능한 아이디가 입력이 되면 비밀번호 입력란 하단 태그에 문구를 띄움
		if(idcheck == true)
		{
			$("#btnmsg2").html("비밀번호를 입력해주세요");
			$("#btnmsg2").css("color","blue");
		}
	});
	
	// 유저가 pw에 입력하는 값의 상태를 ajax로 파악하여 비밀번호 입력창 하단에 띄움
	$("#upw").keyup(function(){
		userpw = $(this).val();
		
		var pattern =  /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		if(userpw.match(pattern) != null)
		{
			$("#btnmsg2").html("한글을 사용할 수 없습니다.");
			$("#btnmsg2").css("color","red");
			pwcheck = false;
			return;
		}
		
		// idcheck를 같이 전송하여, 아이디란에 사용가능한 아이디가 입력이 되어 있는지를 파악
		$.ajax({
			url : "pwcheck.jsp?upw=" + userpw + "&idcheck=" + idcheck,
			type : "get",
			dataType : "html",
			success : function(result)
			{
				result = result.trim();
				switch(result)
				{
				case "99" : 
					$("#btnmsg2").html("사용가능한 아이디를 먼저 입력해주세요.");
					$("#btnmsg2").css("color","red");
					pwcheck = false;
					break;
				case "-1" : 
					$("#btnmsg2").html("비밀번호를 입력해주세요");
					$("#btnmsg2").css("color","blue");
					pwcheck = false;
					break;
				case "00" : 
					$("#btnmsg2").html("아이디 체크 오류입니다.");
					$("#btnmsg2").css("color","red");
					pwcheck = false;
					break;
				case "01" : 
					$("#btnmsg2").html("사용 가능한 비밀번호입니다.");
					$("#btnmsg2").css("color","green");
					pwcheck = true;
					break;
				case "02" : 
					$("#btnmsg2").html("비밀번호는 4자리 이상이어야 합니다.");
					$("#btnmsg2").css("color","red");
					pwcheck = false;
					break;
				case "03" : 
					$("#btnmsg2").html("비밀번호는 20자리 이하여야 합니다.");
					$("#btnmsg2").css("color","red");
					pwcheck = false;
					break;
				}
			}
		});
		
		// 사용 가능한 비밀번호가 입력이 되면 비밀번호 재입력란 하단 태그에 문구를 띄움
		if(pwcheck == true)
		{
			$("#btnmsg3").html("비밀번호를 다시 입력해주세요.");
			$("#btnmsg3").css("color","blue");
		}
		
	});
	
	// 유저가 pwcheck에 입력하는 값의 상태를 ajax로 파악하여 비밀번호 재입력창 하단에 띄움
	$("#pwcheck").keyup(function(){
		userpw = $("#upw").val();
		userpw2 = $(this).val();
		
		// pwcheck를 같이 전송하여, 비밀번호 재입력란과 비밀번호 입력란의 값이 일치한지를 확인
		$.ajax({
			url : "pwagaincheck.jsp?userpw2=" + userpw2 + "&userpw=" + userpw + "&pwcheck=" + pwcheck,
			type : "get",
			dataType : "html",
			success : function(result)
			{
				result = result.trim();
				switch(result)
				{
				case "99" : 
					$("#btnmsg3").html("비밀번호가 사용가능한지 먼저 입력해주세요.");
					$("#btnmsg3").css("color","red");
					pwcheckagain = false;
					break;
				case "-1" : 
					$("#btnmsg3").html("비밀번호를 다시 입력해주세요.");
					$("#btnmsg3").css("color","blue");
					pwcheckagain = false;
					break;
				case "00" : 
					$("#btnmsg3").html("비밀번호 값 오류입니다.");
					$("#btnmsg3").css("color","red");
					pwcheckagain = false;
					break;
				case "01" : 
					$("#btnmsg3").html("비밀번호가 일치합니다.");
					$("#btnmsg3").css("color","green");
					pwcheckagain = true;
					break;
				case "02" : 
					$("#btnmsg3").html("비밀번호가 일치하지 않습니다.");
					$("#btnmsg3").css("color","red");
					pwcheckagain = false;
					break;	
				}
			}
		});
		
		// 입력한 비밀번호가 일치하면 이름 입력란 하단 태그에 문구를 띄움
		if(pwcheckagain == true)
		{
			$("#namecheck").html("이름을 입력해주세요");
			$("#namecheck").css("color","blue");
		}
	});
	
	// 유저가 uname에 입력하는 값의 상태를 ajax로 파악하여 이름 입력창 하단에 띄움
	$("#uname").keyup(function(){
		uname = $(this).val();
		var pattern =  /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		if(uname.match(pattern) == null)
		{
			$("#namecheck").html("이름은 한글만 입력이 가능합니다.");
			$("#namecheck").css("color","red");
			namecheck = false;
			return;
		}
		
		// pwcheckagain를 같이 전송하여, 비밀번호 재입력란의 값이 비밀번호 입력란의 값과 일치한지를 파악
		$.ajax({
			url : "namecheck.jsp?uname=" + uname + "&pwcheckagain=" + pwcheckagain,
			type : "get",
			dataType : "html",
			success : function(result)
			{
				result = result.trim();
				switch(result)
				{
				case "99" : 
					$("#namecheck").html("비밀번호 재확인을 먼저 해주세요.");
					$("#namecheck").css("color","red");
					pwcheckagain = false;
					break;
				case "-1" : 
					$("#namecheck").html("이름을 입력해주세요");
					$("#namecheck").css("color","blue");
					namecheck = false;
					break;
				case "00" : 
					$("#namecheck").html("이름 값 오류입니다.");
					$("#namecheck").css("color","red");
					namecheck = false;
					break;
				case "01" : 
					$("#namecheck").html("사용 가능한 이름입니다.(중복된 이름)");
					$("#namecheck").css("color","green");
					namecheck = true;
					break;
				case "02" : 
					$("#namecheck").html("사용 가능한 이름입니다.");
					$("#namecheck").css("color","green");
					namecheck = true;
					break;
				}
			}
		});
		
		// 사용 가능한 이름이 입력이 되면, 닉네임 입력란 하단 태그에 문구를 띄움
		if(namecheck == true)
		{
			$("#nickcheck").html("닉네임을 입력해주세요");
			$("#nickcheck").css("color","blue");
		}
		
	});
		
	// 유저가 unick에 입력하는 값의 상태를 ajax로 파악하여 이름 입력창 하단에 띄움
	$("#unick").keyup(function(){
		usernick = $(this).val();
		
		// namecheck를 같이 전송하여, 이름입력란의 값이 사용가능한 값인지를 파악
		$.ajax({
			url : "nickcheck.jsp?unick=" + usernick + "&namecheck=" + namecheck,
			type : "get",
			dataType : "html",
			success : function(result)
			{
				result = result.trim();
				switch(result)
				{
				case "99" : 
					$("#nickcheck").html("이름을 먼저 입력해주세요");
					$("#nickcheck").css("color","red");
					nickcheck = false;
					break;
				case "-1" : 
					$("#nickcheck").html("닉네임을 입력해주세요");
					$("#nickcheck").css("color","blue");
					nickcheck = false;
					break;
				case "00" : 
					$("#nickcheck").html("닉네임 체크 오류입니다.");
					$("#nickcheck").css("color","blue");
					nickcheck = false;
					break;
				case "01" : 
					$("#nickcheck").html("중복된 닉네임입니다.");
					$("#nickcheck").css("color","red");
					nickcheck = false;
					break;
				case "02" : 
					$("#nickcheck").html("사용 가능한 닉네임입니다.");
					$("#nickcheck").css("color","green");
					nickcheck = true;
					break;
				}
			}
		});
		
		// 사용 가능한 닉네임이 입력이 되면, 이메일 입력란 하단 태그에 문구를 띄움
		if(namecheck == true)
		{
			$("#emailcheck").html("이메일을 입력해주세요.");
			$("#emailcheck").css("color","blue");
		}
		
	});
	
	// 유저가 email에 입력하는 값의 상태를 ajax로 파악하여 이메일 입력창 하단에 띄움
	$("#email").keyup(function(){
		email = $(this).val();
		var pattern = /^[a-zA-Z0-9]*$/;
		
		// 이메일에는 한글과 특수문자 사용이 불가
		if(email.match(pattern) == null)
		{
			$("#emailcheck").html("올바른 메일주소를 입력해주세요.");
			$("#emailcheck").css("color","red");
			emailcheck = false;
			return;
		}
		
		// nickcheck를 같이 전송하여, 닉네임의 값이 사용가능한 값인지를 파악
		$.ajax({
			url : "emailcheck.jsp?email=" + email + "&nickcheck=" + nickcheck,
			type : "get",
			dataType : "html",
			success : function(result)
			{
				result = result.trim();
				switch(result)
				{
				case "99" : 
					$("#emailcheck").html("닉네임을 먼저 입력해주세요");
					$("#emailcheck").css("color","red");
					emailcheck = false;
					break;
				case "-1" : 
					$("#emailcheck").html("이메일을 입력해주세요");
					$("#emailcheck").css("color","blue");
					emailcheck = false;
					break;
				case "00" : 
					$("#emailcheck").html("이메일 체크 오류입니다.");
					$("#emailcheck").css("color","blue");
					emailcheck = false;
					break;
				case "01" : 
					$("#emailcheck").html("사용 가능한 이메일입니다.(중복)");
					$("#emailcheck").css("color","green");
					emailcheck = true;
					break;
				case "02" : 
					$("#emailcheck").html("사용 가능한 이메일입니다.");
					$("#emailcheck").css("color","green");
					emailcheck = true;
					break;
				}
			}
		});
		
	});
});

// ------------------ 인증번호 발송 버튼 -------------------
function SendMail()
{
	var email = $("#email").val();
	var pattern = /^[a-zA-Z0-9]*$/;
	if( idcheck == false )
	{
		alert("사용가능한 아이디를 먼저 입력해주세요.");	
	}
	
	if(pwcheck == false )
	{
		alert("사용가능한 비밀번호를 먼저 입력해주세요.");	
	}	
	
	if(pwcheckagain == false)
	{
		alert("비밀번호 재확인을 먼저 입력해주세요.");
	} 
	
	if(nickcheck == false)
	{
		alert("사용가능한 닉네임을 먼저 입력해주세요.");	
	}
	
	if(email.match(pattern) == null)
	{
		alert("올바른 메일주소를 입력해주세요");
		$("#email").focus();
		return;
	}
	
	if($("#email").val().length < 5)
	{
		alert("메일주소를 5자 이상 입력해주세요.");
		$("#email").focus();
		return;
	}
	
	if($("#email").val().length > 64)
	{
		alert("메일주소는 64자 이하여야 합니다.");
		$("#email").focus();
		return;
	}
	
	// 위 조건을 충족하면 이메일을 전송함
	$.ajax({
		type : "get",
		url: "sendmail.jsp?email="+ email +"&rearEmail=" + $('#rearEmail').val(),
		dataType: "html",
		success : function(result) 
		{
			result = result.trim();
			alert(result);
		}			
	});		
}
// ----------- 이메일 코드인증 확인 버튼 --------------
function DoEmail()
{
	if($("#code").val() == "")
	{
		alert("인증코드를 입력하세요.");
		$("#code").focus();
		return;
		emailcode = false;
	}		
	
	// 받아온 코드값과 입력한 코드값을 비교
	$.ajax({
		type : "get",
		url: "../user/getcode.jsp",
		dataType: "html",
		success : function(result) 
		{
			result = result.trim();
			if($("#code").val() == result)
			{
				console.log(result);				
				alert("인증이 완료되었습니다.");
				emailcode = true;
			}else
			{
				console.log(result);	
				alert("인증코드가 일치하지 않습니다.");
				$("#code").focus();
				emailcode = false;
			}
		}			
	});		
}

// -------------- 자동가입 방지 코드인증 확인 버튼 -----------------
function ConfirmSign()
{
	if($("#sign").val() == "")
	{
		alert("가입방지 코드를 입력하세요.");
		$("#sign").focus();
		return;
		signcode = false;
	}		
	
	// 받아온 사인값과 입력한 사인값을 비교
	$.ajax({
		url : "getsign.jsp",
		type : "get",
		dataType : "html",
		success : function(result)
		{
			result = result.trim();
			if($("#sign").val() == result)
			{
				alert("가입방지 코드인증이 완료되었습니다.");
				signcode = true;
			}else
			{
				alert("가입방지코드가 일치하지 않습니다. 다시한번 확인해주세요.");
				$("#sign").focus();
				signcode = false;
			}
		}
	});		
}
// ----------------- 회원가입처리 ----------------
function DoJoin()
{
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
	
	if($("#uname").val() == "")
	{
		alert("이름을 입력하세요.");
		$("#uname").focus();
		return;
	}
	
	if($("#unick").val() == "")
	{
		alert("닉네임을 입력하세요.");
		$("#unick").focus();
		return;
	}
	
	if($("#season").val() == "")
	{
		alert("계절을 선택하세요.");
		$("#season").focus();
		return;
	}
	
	if($("#local").val() == "")
	{
		alert("지역을 선택하세요.");
		$("#local").focus();
		return;
	}
	
	if($("#sign").val() == "")
	{
		alert("가입방지코드를 입력하세요.");
		$("#sign").focus();
		return;
	}
	
	if(idcheck == false)
	{
		alert("사용가능한 아이디를 먼저 입력해주세요.");
		$("#uid").focus();
		return;
	}	
	
	if(pwcheck == false)
	{
		alert("사용가능한 아이디를 먼저 입력해주세요.");
		$("#upw").focus();
		return;
	}	
	
	if(pwcheckagain == false)
	{
		alert("비밀번호 재확인을 먼저 해주세요.");
		$("#pwcheck").focus();
		return;
	}
	
	if(namecheck == false)
	{
		alert("사용가능한 이름을 먼저 입력해주세요.");
		$("#uname").focus();
		return;
	}
	
	if(nickcheck == false)
	{
		alert("사용가능한 닉네임을 먼저 입력해주세요.");
		$("#unick").focus();
		return;
	}
	
	if(emailcheck == false)
	{
		alert("사용가능한 이메일을 먼저 입력해주세요.");
		$("#code").focus();
		return;
	}
	
	if(emailcode == false)
	{
		alert("이메일 인증을 먼저 해주세요.");
		$("#code").focus();
		return;
	}
	
	if(signcode == false)
	{
		alert("가입방지 코드인증을 먼저 해주세요.");
		$("#code").focus();
		return;
	}
	
	// 빈칸이 없고, 각 단계의 flag가 모두 true가 되었을시 실행
	if(confirm("회원가입을 완료하시겠습니까?") == true)
	{
		$("#join").submit();
		alert("회원가입이 완료되었습니다. 로그인을 진행해주세요.")
		return;
	}
}
</script>
	<form method="post" action="joinok.jsp" id="join" name="join">
		<table border="0" width="100%">
			<tr>
				<td colspan="4" align="center" style="font-size:60px; height:90px;" ><strong>회원가입</strong></td>
			</tr>
			<tr>
				<td width="25%">
				<td width="450px" align="left" style="vertical-align:top;">
					<h2 style="margin: 0px 0px 0px 0px">아이디</h2>
					<input type="text" id="uid" name="uid" placeholder="아이디를 입력하세요." style="width:80%; font-size:18px; "><br>
					<span id="btnmsg" style="margin-top:0px; width: 70pt; height: 25pt; font-size:18px; font-weight:bold; margin-left:5px"></span><br>
					<h2 style="margin: 15px 0px 0px 0px">비밀번호</h2>
					<input type="password" placeholder="비밀번호를 입력하세요." id="upw" name="upw" style="width:80%; font-size:18px;"><br>
					<span id="btnmsg2" style="margin-top:0px; width: 70pt; height: 25pt; font-size:18px; font-weight:bold; margin-left:5px"></span><br>
					<h2 style="margin: 15px 0px 0px 0px">비밀번호 확인</h2>
					<input type="password" name="pwcheck" id="pwcheck" style="width:80%; font-size:18px;"><br>
					<span id="btnmsg3" style="margin-top:0px; width: 70pt; height: 25pt; font-size:18px; font-weight:bold; margin-left:5px"></span><br>
					<h2 style="margin: 15px 0px 0px 0px">이름</h2>
					<input type="text"  name="uname" id="uname"  style="width:80%; font-size:18px;"><br>
					<span id="namecheck" style="margin-top:0px; width: 70pt; height: 25pt; font-size:18px; font-weight:bold; margin-left:5px"></span>
					<h2 style="margin: 15px 0px 0px 0px">닉네임</h2>
					<input type="text"  name="unick" id="unick"  style="width:80%; font-size:18px; height:60px;"><br>
					<span id="nickcheck" style="margin-top:0px; width: 70pt; height: 25pt; font-size:18px; font-weight:bold; margin-left:5px"></span>
				</td>
				<td style="vertical-align:top;" colspan="2">
				<h2 style="margin: 0px 0px 15px 0px">추천목록(검색목록에서 추천항목을 소개해 드립니다. )</h2>
					✔️<select id="season" name="season" style="width:200px; font-size:17px;">
						<option value="">계절</option>
						<option value="봄">봄</option>
						<option value="여름">여름</option>
						<option value="가을">가을</option>
						<option value="겨울">겨울</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="move" name="move" style="width:200px; font-size:17px;">
						<option value="">이동</option>
						<option value="버스">버스</option>
						<option value="기차">기차</option>
						<option value="자가용">자가용</option>
						<option value="자전거">자전거</option>
					</select>
					<br>	
					✔️<select id="local" name="local" style="width:200px; font-size:17px;">
						<option value="">지역</option>
						<option value="서울경기도">서울,경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청도">충청도</option>
						<option value="전북">전라북도</option>
						<option value="전남">전라남도</option>
						<option value="경북">경상북도</option>
						<option value="경남">경상남도</option>
						<option value="제주">제주도</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="schedule" name="schedule" style="width:200px; font-size:17px;">
						<option value="">일정</option>
						<option value="당일">당일</option>
						<option value="숙박">숙박</option>
					</select>
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="human" name="human" style="width:200px; font-size:17px;">
						<option value="">동행</option>
						<option value="가족">가족</option>
						<option value="연인">연인</option>
						<option value="친구">친구</option>
						<option value="반려견">반려견</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="uinout" name="uinout" style="width:200px; font-size:17px;">
						<option value="">장소</option>
						<option value="실내">실내</option>
						<option value="실외">실외</option>
					</select>
					<br>
					<br>
					<h2 style="margin: 15px 0px 0px 0px">이모티콘</h2>
					<input type="radio" id="uicon" name="uicon" value="1" checked style="width:20px;height:20px;"><span style="font-size:50px">😄</span>&nbsp;
					<input type="radio" id="uicon" name="uicon" value="2" style="width:20px;height:20px;"><span style="font-size:50px">😆</span>&nbsp;
					<input type="radio" id="uicon" name="uicon" value="3" style="width:20px;height:20px;"><span style="font-size:50px">😅</span>&nbsp;
					<input type="radio" id="uicon" name="uicon" value="4" style="width:20px;height:20px;"><span style="font-size:50px">😀</span>&nbsp;
					<input type="radio" id="uicon" name="uicon" value="5" style="width:20px;height:20px;"><span style="font-size:50px">😨</span>
					<br>
					<input type="radio" id="uicon" name="uicon" value="6" style="width:20px;height:20px;"><span style="font-size:50px">👿</span>&nbsp;
					<input type="radio" id="uicon" name="uicon" value="7" style="width:20px;height:20px;"><span style="font-size:50px">😝</span>&nbsp;
					<input type="radio" id="uicon" name="uicon" value="8" style="width:20px;height:20px;"><span style="font-size:50px">😷</span>&nbsp;
					<input type="radio" id="uicon" name="uicon" value="9" style="width:20px;height:20px;"><span style="font-size:50px">😴</span>&nbsp;
					<input type="radio" id="uicon" name="uicon" value="10" style="width:20px;height:20px;"><span style="font-size:50px">😱</span>&nbsp;
					<br>
					<br>
					<h2 style="margin: 15px 0px 15px 0px">가입방지코드</h2>
					<img src="./img.jsp" width="180px" height="60px" class="jcheck">&nbsp;&nbsp;
					<input type="text" id="sign" name="sign">
					<input type="button" onclick="ConfirmSign();" id="sign_btn" name="sign_btn" value="방지코드 확인" style="width: 70pt; height: 33pt; font-size:14px; font-weight:bold">
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<h2 style="margin: 15px 0px 0px 0px">e-mail</h2>
					<input type="email" id="email" name="email" style="width:40%; font-size:17px;"> 
					<select id="rearEmail" style="width:150px; height:55px; font-size:17px;" name="rearEmail" style="border-radius: 13px 13px 13px 13px; width : 220px;">
							<option value="naver">@naver.com</option>
							<option value="gmail">@gmail.com</option>
							<option value="daum">@daum.net</option>
							<option value="nate">@nate.com</option>
							<option value="hanmail">@hanmail.net</option>
					</select>
					<input type="button" onclick="SendMail();" id="sendmail" name="sendmail" value="인증코드 전송" style="width: 70pt; height: 33pt; font-size:14px; font-weight:bold">
					<span id="emailcheck" style="margin-top:0px; width: 70pt; height: 25pt; font-size:18px; font-weight:bold; margin-left:5px"></span>
					<h2 style="margin: 15px 0px 0px 0px"><br>인증번호 확인</h2>
					<input type="text" id="code" name="code" style="width:30%; font-size:17px; height:50px;">
					<input type="button" onclick="DoEmail();" id="code" name="code" value="인증코드 확인" style="width: 70pt; height: 33pt; font-size:14px; font-weight:bold; margin-bottom : 30px;">
				</td>
				<td colspan="2">
					<br><!-- 회원가입 완료버튼 -->
					<input type="button" class="jbtn" onclick="DoJoin();" value="회원가입 완료" style="width:250pt; height:50pt; font-size:28px; margin-left:200px">
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>