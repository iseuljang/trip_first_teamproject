<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/pwsearch3.css">
<%
request.setCharacterEncoding("UTF-8");
//-------------------- 값 수령 --------------------
String uid  = request.getParameter("id");
String uname  = request.getParameter("name");
//@ 이전의 이메일 주소값 -> email
String email = request.getParameter("email");
//@ 이후 .com / .net 을 제외한 이메일 주소값 -> rerearEmail
String rearEmail = request.getParameter("rearEmail");

//받아온 값의 유효성 확인
if( uname == null || uname.equals("") || email == null | email.equals("") || rearEmail == null | rearEmail.equals(""))
{
	%>
	<script>
	alert("올바르지 않은 값입니다.("" or null)");
	history.back();
	return;
	</script>
	<%
	
}
// ------------------------ 계정 조회 ------------------------
userDTO udto = new userDTO();
userVO uvo = new userVO();

// 수령한 이름과 이메일로 계정 조회 
//daum이나 hanmail일때, .net으로 조회 
if(rearEmail.equals("daum") || rearEmail.equals("hanmail"))
{
	uvo = udto.Search(uname, email + "@" + rearEmail + ".net");
}else
{
	uvo = udto.Search(uname, email + "@" + rearEmail + ".com");
}

//조회한 계정이 유효성 확인
if(uvo == null)
{
	%>
	<script>
	$(document).ready(function()
	{
		alert("해당 계정에 등록된 이름 혹은 이메일이 맞는지 확인해주십시오.");
		history.back();
		return;
	});
	</script>
	<%
	return;
}
%>
	<script>
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
	
	// ------------------ 다음 페이지 전송 버튼 --------------------
	function next()
	{
		if($("#attach1-1").val() == "")
		{
			alert("새로운 비밀번호를 입력해주세요.");
			$("#attach1-1").focus();
			return;
		}
		
		if($("#attach1-1").val().length < 4)
		{
			alert("비밀번호는 4자리 이상이어야 합니다.");
			$("#attach1-1").focus();
			return;
		}	
			
		if($("#attach1-2").val().length > 20)
		{
			alert("비밀번호는 20자리 이하여야 합니다.");
			$("#attach1-2").focus();
			return;
		}	
		
		if($("#attach1-1").val() != $("#attach1-2").val())
		{
			alert("비밀번호가 일치하지 않습니다.");
			$("#attach1-1").focus();
			return;
		}	
		else
		{
			$("#pwsearch").submit();
			return;
		}
	}
	</script>
	</head>
	<body>
		<div id= "memberchange" name = "memberchange">
			<div class="intro_bg">
				<div class="header"></div>
			</div>
		</div>
		<div class="hline1"></div>		
		<div class="str">
			이메일 인증이 완료되었습니다.
		</div>
		<div class="str1">
			새로운 비밀번호를 입력해주세요
		</div>
		<form id="pwsearch" name="pwsearch" method="post" action="pwsearchok.jsp">
		<input type="hidden" id="id" name="id" value="<%= uid %>">
		<input type="hidden" id="name" name="name" value="<%= uname %>">
		<input type="hidden" id="email" name="email" value="<%= email %>">
		<input type="hidden" id="rearEmail" name="rearEmail" value="<%= rearEmail %>">
		<table>
			<tr>
				<td class="attach">
					비밀번호
				</td>
				<td>
					<input type="password" id="attach1-1" class="attach1" name="pw" placeholder="비밀번호를 입력해주세요">
				</td>
			</tr>
		</table>
		<div style="margin-bottom:10px"></div>
		<table>
			<tr>
				<td class="attach">
					비밀번호 확인
				</td>
				<td>
					<input type="password" id="attach1-2" class="attach1" name="re_pw" placeholder="비밀번호를 다시 입력해주세요">
				</td>
			</tr>
		</table>
		</form>
		<div style="margin-bottom:60px"></div>
		<div id="attach2" class="attach2" onclick="next();">
			다 음
		</div>
	</body>
</html>