<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %> 
<link rel="stylesheet" type="text/css" href="../css/masterMembercheck.css">    
<script>
$(document).ready(function(){
		/* 닉네임 작성란 포커스로직 */
		$("#unick").focus();
		
		userCheckRun("");
	});
	
	
	function usercheck()
	{
		var unick = $("#unick").val();
		if(unick == "")
		{
			$("#unick").focus();
			alert("닉네임을 입력하세요");
			return;
		}
		if(confirm("조회하시겠습니까?") == false)
		{
			return;
		}
		userCheckRun(unick);
	}
	
	function userCheckRun(unick)
	{		
		$.ajax({
			type : "post",
			url : "masterMembercheckok.jsp",
			data : 
			{
				unick : unick
			},
			dataType : "html",
			success : function(result)
			{
				result = result.trim();
				$("#user_show").html(result);

				$("#unick").keyup(function(e){
					if( e.keyCode == 13 )
					{
						usercheck();
					}
				});				
			}
		});
		
	}
	
	
	function userstop(uno)
	{
		var ustop = $("#ustop").val();
		if(confirm("정지하시겠습니까?") == false)
		{
			return;
		}
		
		$.ajax({
			type : "post",
			url : "masterMembercheckok.jsp",
			data : 
			{
				ustop : ustop,
				uno : uno
			},
			dataType : "html",
			success : function(result)
			{
				result = result.trim();
				alert("정지되었습니다.");
				window.location.reload();
			}
		});
	}
	
	
	
</script>
	
<body>
	<form method="get" name="masterMembercheck" id="masterMembercheck" action="masterMembercheckok.jsp"
	onsubmit="return false">
	<div style="margin-top:80px"></div>
	<table border="0" width="90%" align="center" style="vertical-align: top; margin-top:0px">
		<tr>
			<td id="td1">
				<a href="masterMembercheck.jsp" id="href1"><b style="color:#1ABC9C">회원조회</b></a>
				<hr>
				<a href="masterGonggiwrite.jsp" id="href2"><b>공지사항</b></a>
				<hr>
				<br>
				<hr>
			</td>
			<td style="background-color:gray;"></td>
			<td id="td2">
				<h1>조회할 회원닉네임을 입력해주세요</h1>
				<br>
				<div id="user_show">
				이곳에 조회된 닉네임이 표시됩니다.				
				</div>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>