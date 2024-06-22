<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %>     
<%
String unick = request.getParameter("unick");
if(unick == null)
{
	//닉네임 정보가 올바르게 전송되지 않음
	unick = "";
}

String ustop = request.getParameter("ustop");
String uno = request.getParameter("uno");
if(ustop == null)
{
	ustop = "";
}

userDTO dto = new userDTO();

userVO user = dto.ShowUser(unick);


if( user == null)
{
	//조회가 안되었을 경우 빈 가짜 정보를 만든다.
	user = new userVO(); 
	user.SetBlank();
	user.setUid("조회된 닉네임이 없습니다.");
}
dto.Stop(ustop,uno);
%>
<style>
#stopbtn
{
	width:60px;
	height:35px;
	background-color: rightgray;
	font-size:20px;
	margin:5px;
	border:0;
	cursor:pointer; cursor:hand;
	border-radius: 5px;
}
#check
{
	width:60px;
	height:35px;
	background-color: rightgray;
	color:white;
	font-size:20px;
	margin:5px;
	border:0;
	cursor:pointer; cursor:hand;
	border-radius: 5px;
}

input[type=text] {
	width: 200px;
	height: 40px;;
	font-size: 25px;
	border:none;
	border-bottom: solid #aaaaaa 1px;
	padding-left: 10px;
	outline: none;
	text-align:center;
}

</style>
<table border="0" width="1280px" align="left" id="user_show" style="font-size:25px;">
	<tr>
		<td id="nick_w"><b>닉네임</b></td>
		<td>
			<input type="text" name="unick" id="unick" value="<%= user.getUnick() %>" placeholder="조회할 닉네임 입력">
			<button type="button" id="check" onclick="usercheck();"><b>조회</b></button>
		</td>
	</tr>
	<tr>
		<td colspan="2">아이디 : <%= user.getUid() %></td>
	</tr>
	<tr>
		<td colspan="2">이름 : <%= user.getUname() %></td>
	</tr>
	<tr>
		<td colspan="2">닉네임 : <%= user.getUnick() %></td>
	</tr>
	<tr>
		<td colspan="2">이메일 : <%= user.getEmail() %></td>
	</tr>
	<tr>
		<td colspan="2">탈퇴여부 : 
		<%
		if(user.getUretire() == null || user.getUretire().equals("N"))
		{
			%> 활동회원 <%
		}else if(user.getUretire().equals(""))
		{
			%> <%
		}
		else
		{
			%> 탈퇴회원 <%
		}
		%>
		</td>
	</tr>
	<tr>
		<td colspan="2">회원이용정지 : 
			<select name="ustop" id="ustop" style="font-size:22px;">
				<option value="7" selected>1주일</option>
				<option value="14">2주일</option>
				<option value="30">한달</option>
				<option value="0">영구</option>
			</select>
			&nbsp;&nbsp;
			<button type="button" name="stopbtn" id="stopbtn" onclick="userstop(<%= user.getUno() %>);">
				<b>정지</b>
			</button>
		</td>
	</tr>
	<tr>
		<td colspan="2">정지여부 : 
		<%
		if(user.getUstop() == null || user.getUstop().equals("N"))
		{
			%> 해당없음 <%
		}else if(user.getUstop().equals(""))
		{
			%> <%
		}else
		{
			%>정지회원<%
		}
		%>
		</td>
	</tr>
	<tr>
		<td>정지종료일 : </td>
		<td>
		<%
		if(user.getUstopend() == null || user.getUstopend().equals(""))
		{
			%> <%
		}else
		{
			%><%= user.getUstopend() %><%
		}
		%>
		</td>
	</tr>
</table>
	
