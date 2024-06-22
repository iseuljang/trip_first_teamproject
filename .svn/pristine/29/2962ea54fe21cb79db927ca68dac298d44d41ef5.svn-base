<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %> 
<link rel="stylesheet" type="text/css" href="../css/masterwriteok.css">    
<%
//-------------------- 값 수령 --------------------
String pageno  = request.getParameter("page");
String adno  = request.getParameter("adno");

// 페이징 기본값 설정
if(pageno  == null || pageno.equals("")) 
{
	pageno  = "1";
}
// ------------------ 공지글 조회 ------------------
adminboardDTO dto = new adminboardDTO();
adminboardVO vo = new adminboardVO();

vo = dto.Read(adno);
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

// 관리자 권한 확인
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
		
	// ------------------- 공지글 수정 버튼 ----------------------
	function DoModify()
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
		if( confirm("게시물을 수정하시겠습니까?")==true)
		 {
			$("#mastermodify").submit();
		 }
	}
	</script>
	<body>
		<form id="mastermodify" name="mastermodify" method="post" action="mastermodifyok.jsp" enctype="multipart/form-data">
		<input type="hidden" name="uno" id="uno" value="<%= login.getUno() %>">
		<input type="hidden" name="adno" id="adno" value="<%= vo.getAdno() %>">
		<input type="hidden" name="page" id="page" value="<%= pageno %>">
		<div><%= vo.getAdno() %></div>
			<div class="main">
				<table>
					<tr>
						<td>
							<div class="title12">제목</div>
						<td>
						<td>
							<div>
								<input type="text" id="adtitle" name="adtitle" class="title1" placeholder="제목을 입력해 주세요" value="<%= vo.getAdtitle() %>"
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
			<div class="attach" style="font-size : 18px;">업데이트할 첨부파일</div>
			<input type="file"  id="fname" name="fname" class="attach1">
			<% 
			if(vo.getFname() != null)  
			{ 
				%>
				<div class="attach" style="font-size : 20px; bottom : 100px">기존 첨부파일</div>
				<a href="down.jsp" id="org_file" class="attach1" style="font-size : 20px;">
					<%= vo.getFname() %>
				</a><br>
				<% 
			}else
			{
				%> 기존 첨부파일 없음 <% 
			}
			%>
			<label for="startday" class="attach2">시작일</label>	
			<input type="datetime-local" id="startday" name="startday" value="<%= vo.getStartday() %>" class="attach2-1" max="2024.12.31" min="2024-04-19" ><br>
			<label for="endday" class="attach2">종료일</label>	
			<input type="datetime-local" id="endday" name="endday" value="<%= vo.getEndday() %>" class="attach2-1" max="2024.12.31" min="2024-04-19" >
				
			<!--  하단 -->
			<table class="tail">
				<tr>
				<td>
					<div class="blank"></div>
				</td>
				<td>
					<div class="cancel">초기화</div>
				</td>
				<td>
					<div class="blank1"></div>
				</td>
				<td>
					<div class="submit" onclick="DoModify();">수정</div>
				</td>
				<td>
					<div class="blank1"></div>
				</td>
			</table>
		</form>
	</body>
</html>