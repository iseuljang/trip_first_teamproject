<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %> 
<link rel="stylesheet" type="text/css" href="../css/masterGonggiwrite.css">    
<%
//-------------------- 값 수령 --------------------
String pageno  = request.getParameter("page");
String adno  = request.getParameter("adno");

// 페이징 기본값 설정
if(pageno  == null || pageno.equals("")) 
{
	pageno  = "1";
}

//--------------------- 접근제어 ------------------

// 비로그인시
if(login == null)
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("로그인이 필요합니다.");
		if(confirm("로그인 페이지로 이동하시겠습니까?") == true)
		{
			document.location = "../user/login.jsp";
			return;
		}else
		{
			document.location = "../firstmain/lobby.jsp";
			return;
		}
	});
	</script>
	<% 
	return;
}
adminboardDTO dto = new adminboardDTO();
adminboardVO vo = new adminboardVO();

// 관리자 권한이 없을시
if(dto.CheckAdmin(login.getUid()) == false)
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("해당 회원은 관리자 권한이 없습니다.");
		history.back();
		return;
	});
	</script>
	<% 
	return;
}

//게시물 번호 유효성 확인
if(adno == null || adno.equals(""))
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("유효하지 않은 공지글입니다.");
		history.back();
		return;
	});
	</script>
	<% 
	return;
}

//--------------------- 공지게시글 목록 조회 ------------------- 
vo = dto.Read(adno);
if(vo == null || vo.equals(""))
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("해당 공지글을 조회할 수 없습니다.");
		history.back();
		return;
	});
	</script>
	<% 
	return;
}
%>
<style>
.btn
{
	border: 0px; 
	font-size: 25px;
	border-radius: 0.2em;
	cursor: pointer;
	width: 100px;
	height: 50px;
	color: white; 
	margin-bottom : 20px;
}
</style>
<script>
	// 글목록 버튼
	function gotoList(obj)
	{
			document.location = "masterGonggiwrite.jsp?page=" + obj;
	}
	
	// 글수정 버튼
	function modifyBoard(obj)
	{
		if(confirm("해당 게시글을 수정하시겠습니까?") == true)
		{
			document.location = "mastermodify.jsp?" + obj;
		}
	}
	
	// 글 삭제 버튼
	function deleteBoard(obj)
	{
		if(confirm("해당 게시글을 삭제하시겠습니까?") == true)
		{
			document.location = "masterdelete.jsp?" + obj;
		}
	}
</script>
<body>
	<form method="post" name="masterGonggiwrite" id="masterGonggiwrite" action="masterwrite.jsp">
	
	<!-- 중간부분입니다 -->
	<div style="margin-top:100px"></div>
	<table border="1" width="90%" align="center">
		<tr>
			<td id="td1">
				<a href="masterMembercheck.jsp" ><b>회원조회</b></a>
				<hr>
				<a href="masterGonggiwrite.jsp" ><b style="color:#1ABC9C">공지사항</b></a>
				<hr>
				<br>
				<hr>
			</td>
			<td style="background-color:gray;"></td>
			<td id="td2">
				<table border="0" width="100%" style="border-collapse: collapse;">
					<tr>
						<td colspan="5" align="right">
							<% 
							String link_str = "";
							link_str += "adno=" + adno; 
							link_str += "&page=" + pageno; 
							%>
							<button type="button" class ="btn" id="list_btn" style="background-color : green; margin-right : 20px;" 
							onclick="gotoList('<%= page %>')">공지목록</button>
							<button type="button" class ="btn" id="modify_btn" style="background-color : royalblue; margin-right : 20px;" 
							onclick="modifyBoard('<%= link_str %>')">수정</button>
							<button type="button" class ="btn" id="delete_btn" style="background-color : deeppink;"
							 onclick="deleteBoard('<%= link_str %>');">삭제</button>
						</td>
					</tr>
					<tr>
						<td>작성자 닉네임 :</td>
						<td><%= vo.getUnick() %></td>
						<td>공지 시작일 :</td>
						<td><%= vo.getStartday() %></td>
						<td>공지 종료일 :</td>
						<td><%= vo.getEndday() %></td>
					</tr>
					<tr>
						<td>제목 :</td>
						<td><%= vo.getAdtitle() %></td>
					</tr>
					<tr>
						<td>내용:</td>
						<td>
							<img src=" ../upload/<%= vo.getPname() %> " style="width:200px;">
						</td>
						
					</tr>
				</table>
			</td>
		</tr>
		<tr>
		</tr>
	</table>
	</form>
</body>
</html>