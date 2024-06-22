<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="../include/head.jsp" %> 
<link rel="stylesheet" type="text/css" href="../css/user_info.css">   
<script>
var IsDuplicate = false;
	$(document).ready(function(){
		
		/* 닉네임 포커스 로직 */
		$("#unick").focus();
		
		/* 닉네임 & 비번 엔터시 저장로직 */
		$("#unick,#upw").keyup(function(event){
			if(event.keyCode == 13)
			{
				change();
				return;
			}
		});
		//아이콘 클릭시 변경 가능한 아이콘 리스트 보여주고 다시 클릭시 안보이게 함
		$("#iconchange")
		.click(function()
		{
			if($("#icon_show").is(":visible"))
			{
				$("#icon_show").css("display","none");
			}else
			{
				$("#icon_show").toggle();
			}
			
		});
		//변경하려는 닉네임 중복여부 검증
		$("#unick").keyup(function(){
			IsDuplicate = false;
			usernick = $(this).val();
			
			$.ajax({
				url : "nickcheck.jsp?unick=" + usernick,
				type : "get",
				dataType : "html",
				success : function(result)
				{
					result = result.trim();
					switch(result)
					{
					case "00" : 
						$("#btnmsg").html("닉네임 체크 오류입니다.");
						$("#btnmsg").css("color","blue");
						break;
					case "01" : 
						$("#btnmsg").html("중복된 닉네임입니다.");
						$("#btnmsg").css("color","red");
						IsDuplicate = true;
						break;
					case "02" : 
						$("#btnmsg").html("사용 가능한 닉네임입니다.");
						$("#btnmsg").css("color","green");
						break;
					}
				}
			});
		});
		
		
	});
		
	//회원정보변경로직 
	function change()
	{
		console.log($("input[name='uicon']:checked").val());
		if($("#upw").val() == "")
		{
			$("#upw").focus();
			alert("비밀번호를 입력하세요");
			return;
		}
		
		if(confirm("저장하시겠습니까?") == false)
		{
			return;
		}
		
		if($("#unick").val() == "<%= login.getUnick() %>")
		{
			$("#unick").focus();
			alert("닉네임 변경사항이 없습니다.");
			return;
		}
		
		if(IsDuplicate == true)
		{
			alert("중복된 닉네임입니다. 새로운 닉네임 입력하세요.");
			$("#unick").focus();
			return;
		}
		
		$.ajax({
			type : "post",
			url : "user_infocheck.jsp",
			data : 
			{
				upw : $("#upw").val(),
				unick : $("#unick").val(),
				season : $("#season").val(),
				local : $("#local").val(),
				human : $("#human").val(),
				move : $("#move").val(),
				schedule : $("#schedule").val(),
				uinout : $("#uinout").val(),
				uicon : $("input[name='uicon']:checked").val()
			},
			dataType : "html",
			success : function(result)
			{
				result = result.trim();
				switch(result)
				{
				case "ERROR" :
					alert("비밀번호가 일치하지 않습니다.");
					$("#upw").focus();
					break;
				case "OK" :
					alert("변경되었습니다.");
					document.location = "user_info.jsp";
					break;
				}
			}
		});
		
	}
	
	/* 취소로직 */
	function cancel()
	{
		window.location = "../firstmain/lobby.jsp";
	}
	
	/* 회원탈퇴로직 */
	function gotoRetire()
	{
		window.location = "../user/retire.jsp";			
	}
</script>
<body>
	<form method="post" name="user_info" id="user_info" action="user_infook.jsp">
		<table border="0" width="80%" align="center" >
			<tr>
				<td style="width: 20%; vertical-align: top;">
					<table border="0" align="center" width="80%" height="550px">
						<tr>
							<td align="center">
							<br><br><br>
							<%
							String icon = "";
							switch (login.getUicon())
							{
		                		case "1": icon  = "😄"; break;     				  
		                		case "2": icon  = "😆"; break;  
		                		case "3": icon  = "😅"; break;  
		                		case "4": icon  = "😀"; break;  
		                		case "5": icon  = "😨"; break;  
		                		case "6": icon  = "👿"; break;  
		                		case "7": icon  = "😝"; break;  
		                		case "8": icon  = "😷"; break;  
		                		case "9": icon  = "😴"; break;  
		                		case "10": icon  = "😱"; break;  
			                }
							%>
							<div style="font-size:140px; margin:0px;"><%= icon %></div><br>
							<h1><%= login.getUnick() %></h1>
							<a style="font-size:20px;"> 아이디 : <%= login.getUid() %> </a><br>
							<a style="font-size:20px;"> 이메일 : <%= login.getEmail() %></a><br>
							</td>
						</tr>
						<tr>
							<td align="center">
								<button id="retire" type="button" onclick="gotoRetire();" style="border-radius:0.5em; border:0px; width:120px; height:30px; font-size:20px;">
								<b>회원탈퇴</b>
								</button>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<div class="vertical_line"></div>
				</td>
				<td>
					<table border="0" width="80%" align="center">
						<tr style="word-break:break-all; height:100px;">
							<td colspan="4">
							<section id="icon_show">
								<input type="radio" name="uicon" value="1" <%= login.getUicon().equals("1") ? "checked" : "" %> style="width:20px;height:20px;"><span style="font-size:40px">😄</span>
								<input type="radio" name="uicon" value="2" <%= login.getUicon().equals("2") ? "checked" : "" %> style="width:20px;height:20px;"><span style="font-size:40px">😆</span>
								<input type="radio" name="uicon" value="3" <%= login.getUicon().equals("3") ? "checked" : "" %> style="width:20px;height:20px;"><span style="font-size:40px">😅</span>
								<input type="radio" name="uicon" value="4" <%= login.getUicon().equals("4") ? "checked" : "" %> style="width:20px;height:20px;"><span style="font-size:40px">😀</span>
								<input type="radio" name="uicon" value="5" <%= login.getUicon().equals("5") ? "checked" : "" %> style="width:20px;height:20px;"><span style="font-size:40px">😨</span>
								<input type="radio" name="uicon" value="6" <%= login.getUicon().equals("6") ? "checked" : "" %> style="width:20px;height:20px;"><span style="font-size:40px">👿</span>
								<input type="radio" name="uicon" value="7" <%= login.getUicon().equals("7") ? "checked" : "" %> style="width:20px;height:20px;"><span style="font-size:40px">😝</span>
								<input type="radio" name="uicon" value="8" <%= login.getUicon().equals("8") ? "checked" : "" %> style="width:20px;height:20px;"><span style="font-size:40px">😷</span>
								<input type="radio" name="uicon" value="9" <%= login.getUicon().equals("9") ? "checked" : "" %> style="width:20px;height:20px;"><span style="font-size:40px">😴</span>
								<input type="radio" name="uicon" value="10" <%= login.getUicon().equals("10") ? "checked" : "" %> style="width:20px;height:20px;"><span style="font-size:40px">😱</span>
							</section>
							</td>
						</tr>
						<tr style="height:100px;">
							<td id="iconbtn" style="font-size:90px; width:80px; padding-bottom:15px; vertical-align:bottom;">
							<%= icon %>
							</td>
							<td>
								<p style="font-weight:bold; font-size:25px;"><%= login.getUnick() %></p>
								<a style="font-size:22px;"><%= login.getEmail() %></a>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" id="iconchange" style="border-radius:0.5em; border:0px; width:120px; height:30px; font-size:20px; font-weight:bold; cursor:pointer; cursor:hand;">아이콘변경</button>
							</td>
						</tr>
					</table>
					<hr style="margin-left:8%; margin-right:8%; border:2px solid lightgray;">
					<table border="0" height="5px" align="center">
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
					<table border="0" width="80%" align="center" >
						<tr>
							<td align="left" style="font-size:20px;">
								&nbsp;&nbsp;&nbsp;&nbsp;<b>&nbsp;닉네임 &nbsp;:</b> 
								<input type="text" name="unick" id="unick" placeholder="변경하실 닉네임을 입력하세요">
								<span id="btnmsg" style="margin-top:0px; width: 70pt; height: 25pt; font-size:18px; font-weight:bold; margin-left:5px"></span>
							</td>
						</tr>
						<tr>	
							<td align="left" style="font-size:20px;">
								&nbsp;&nbsp;<b>비밀번호 :</b> 
								<input type="password" name="upw" id="upw" style="height:40px;" placeholder="비밀번호를 입력하셔야 변경됩니다">
							</td>
						</tr>
					</table>
					<table border="0" height="5px" align="center">
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
					<table border="0" align="center" width="80%">
						<tr>
							<td colspan="3" style="text-align:left;"><h2>관심분야</h2></td>
						</tr>
						<tr>
							<td>
								<select name="season" id="season" style="width: 200px;">
									<option value="" <%= login.getSeason().equals("") ? "selected" : "" %> >계절</option>
									<option value="봄" <%= login.getSeason().equals("봄") ? "selected" : "" %>>봄</option>
									<option value="여름" <%= login.getSeason().equals("여름") ? "selected" : "" %>>여름</option>
									<option value="가을" <%= login.getSeason().equals("가을") ? "selected" : "" %>>가을</option>
									<option value="겨울" <%= login.getSeason().equals("겨울") ? "selected" : "" %>>겨울</option>
								</select>
							</td>
							<td>
								<select name="local" id="local" style="width: 200px;">
									<option value="" <%= login.getLocal().equals("") ? "selected" : "" %>>지역</option>
									<option value="서울경기도" <%= login.getLocal().equals("서울경기도") ? "selected" : "" %>>서울,경기도</option>
									<option value="강원도" <%= login.getLocal().equals("강원도") ? "selected" : "" %>>강원도</option>
									<option value="충청도" <%= login.getLocal().equals("충청도") ? "selected" : "" %>>충청도</option>
									<option value="전북" <%= login.getLocal().equals("전북") ? "selected" : "" %>>전라북도</option>
									<option value="전남" <%= login.getLocal().equals("전남") ? "selected" : "" %>>전라남도</option>
									<option value="경북" <%= login.getLocal().equals("경북") ? "selected" : "" %>>경상북도</option>
									<option value="경남" <%= login.getLocal().equals("경남") ? "selected" : "" %>>경상남도</option>
									<option value="제주" <%= login.getLocal().equals("제주") ? "selected" : "" %>>제주도</option>
								</select>
							</td>
							<td>
								<select name="human" id="human" style="width: 200px;">
									<option value="" <%= login.getHuman().equals("") ? "selected" : "" %>>동행</option>
									<option value="가족" <%= login.getHuman().equals("가족") ? "selected" : "" %>>가족</option>
									<option value="연인" <%= login.getHuman().equals("연인") ? "selected" : "" %>>연인</option>
									<option value="친구" <%= login.getHuman().equals("친구") ? "selected" : "" %>>친구</option>
									<option value="반려견" <%= login.getHuman().equals("반려견") ? "selected" : "" %>>반려견</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<select name="move" id="move" style="width: 200px;">
									<option value="" <%= login.getMove().equals("") ? "selected" : "" %>>이동</option>
									<option value="버스" <%= login.getMove().equals("버스") ? "selected" : "" %>>버스</option>
									<option value="기차" <%= login.getMove().equals("기차") ? "selected" : "" %>>기차</option>
									<option value="자가용" <%= login.getMove().equals("자가용") ? "selected" : "" %>>자가용</option>
									<option value="자전거" <%= login.getMove().equals("자전거") ? "selected" : "" %>>자전거</option>
								</select>
							</td>
							<td>
								<select name="schedule" id="schedule" style="width: 200px;">
									<option value="" <%= login.getSchedule().equals("") ? "selected" : "" %>>일정</option>
									<option value="당일" <%= login.getSchedule().equals("당일") ? "selected" : "" %>>당일</option>
									<option value="숙박" <%= login.getSchedule().equals("숙박") ? "selected" : "" %>>숙박</option>
								</select>
							</td>
							<td>
								<select name="uinout" id="uinout" style="width: 200px;">
									<option value="" <%= login.getUinout().equals("") ? "selected" : "" %>>장소</option>
									<option value="실내" <%= login.getUinout().equals("실내") ? "selected" : "" %>>실내</option>
									<option value="실외" <%= login.getUinout().equals("실외") ? "selected" : "" %>>실외</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: right;"></td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: right;">
								<button type="button" class="modify"  style="background-color: orangered;" onclick="cancel();">취소</button>&nbsp;&nbsp;
								<button type="button" class="modify" id="save" style="background-color: dodgerblue;" onclick="change();">저장</button>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>