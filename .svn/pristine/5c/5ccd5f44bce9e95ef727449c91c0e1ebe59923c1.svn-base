<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %> 
<link rel="stylesheet" type="text/css" href="../css/masterwriteok.css">    
<%
//--------------------- 접근제어 ------------------
//비로그인시 접근제어
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

//관리자 권한 확인
adminboardDTO dto = new adminboardDTO();
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
%>
	<script>
	$(document).ready(function()
	{
		$("#adtitle").focus();
		
	});
	
	// ---------------- 글작성 버튼 -------------------
	function DoWrite()
	{
		 
		 if($("#adtitle").val() == "")
		 {
			 alert("제목을 입력하세요");
			 $("#adtitle").focus();
			 return;
		 }
		 if($("#fname").val() == "")
		 {
			 alert("파일을 업로드 해주세요");
			 return;
		 }
		 if($("#startday").val() == "")
		 {
			 alert("시작일을 입력해주세요");
			 return;
		 }
		 if($("#endday").val() == "")
		 {
			 alert("종료일을 입력해주세요");
			 return;
		 }
		if( confirm("게시물을 작성하시겠습니까?")==true)
		 {
			$("#masterwrite").submit();
		 }
	}
	</script>
	<body>
		<form id="masterwrite" name="masterwrite" method="post" action="masterwriteok.jsp" enctype="multipart/form-data">
		<input type="hidden" name="uno" id="uno" value="<%= login.getUno() %>">
			<div class="main">
				<table>
					<tr>
						<td>
							<div class="title12">제목</div>
						<td>
						<td>
							<div>
								<input type="text" id="adtitle" name="adtitle" class="title1" placeholder="제목을 입력해 주세요"
								 style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="hline2"></div>	
			<div class="guide"> 
				<p style="font-weight : bold;">권장 해상도 732px*98px 이미지 파일을 첨부해주세요</p>
				<p style="font-size : 15px; color : red;">(*하나만 첨부가능합니다)</p>
			</div>
			<div class="attach">첨부파일</div>
			<input type="file"  id="fname" name="fname" class="attach1" ><br>
			<label for="startday" class="attach2">시작일</label>	
			<input type="datetime-local" id="startday" name="startday"  class="attach2-1" max="2024.12.31" min="2024-04-19" ><br>
			<label for="endday" class="attach2">종료일</label>	
			<input type="datetime-local" id="endday" name="endday"  class="attach2-1" max="2024.12.31" min="2024-04-19" >
				
			<!--  하단 -->
			<table class="tail">
				<tr>
				<td>
					<div class="blank"></div>
				</td>
				<td>
					<div class="cancel">취소</div>
				</td>
				<td>
					<div class="blank1"></div>
				</td>
				<td>
					<div class="submit" onclick="DoWrite();">발행</div>
				</td>
				<td>
					<div class="blank1"></div>
				</td>
			</table>
		</form>
	</body>
</html>