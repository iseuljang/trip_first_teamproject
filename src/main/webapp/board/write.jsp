<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<%
//로그인 세션으로 접근제어
if(login == null)
{
	response.sendRedirect("../firstmain/lobby.jsp");
}

String pageno      = request.getParameter("page");
String type        = request.getParameter("type");
String bno         = request.getParameter("no");
String[] season    = request.getParameterValues("season");
String[] local     = request.getParameterValues("local");
String[] human     = request.getParameterValues("human");
String[] move      = request.getParameterValues("move");
String[] schedule  = request.getParameterValues("schedule");
String[] uinout    = request.getParameterValues("uinout");
String[] keyword   = request.getParameterValues("keyword");
if(pageno  == null) pageno  = "1";
if(type    == null) type    = "T";
if(keyword == null) keyword = new String[] {""};
			
%>
<script>
$(document).ready(function(){
	//첨부파일 추가 버튼 이벤트 리스너
	$("#add_btn").click(function(){
		add_file();
	});
	
	add_file();
	
	$("#btitle").focus();
});


//첨부파일 추가
function add_file()
{
	$.ajax({
		url : "attach(write).jsp",
		type : "get",
		dataType : "html",
		success : function(response){
			response = response.trim();
			$("#attach_table").append(response);
		}
	});				
}

//첨부파일 삭제 
function remove_File(obj)
{
	var tr = $(obj).parent().parent();
	tr.remove();
}

// 글등록 함수 -> writeok.jsp로 submit()
function DoWrite()
{
	if($("#btitle").val() == "")
	{
		alert("제목을 입력하세요.");
		$("#btitle").focus();
		return;
	}
	if($("#bnote").val() == "")
	{
		alert("내용을 입력하세요.");
		$("#bnote").focus();
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
	
	if(confirm("해당 게시물을 게시하시겠습니까?") == 0)
	{
		return;
	}
	$("#write").submit();
	
}
</script>
<form id="write" name="write" method="post" action="writeok.jsp" enctype="multipart/form-data">
	<table border="0" width="100%">
		<tr>
			<td colspan="4" height="10px"></td>
		</tr>
		<tr>
			<td width="20%"></td>
			<td align="center" height="60px" colspan="2">
				<input type="text" id="btitle" name="btitle" style="width:85%; height:100%; font-size:30px;" placeholder="제목을 입력해주세요.">
			</td>
			<td width="20%"></td>
		</tr>
		<tr>
			<td width="20%"></td>
			<td style="vertical-align:top;" align="center" colspan="2">
				✔️<select id="season" name="season" style="width:23%">
					<option value="">계절</option>
					<option value="봄">봄</option>
					<option value="여름">여름</option>
					<option value="가을">가을</option>
					<option value="겨울">겨울</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				✔️<select id="local" name="local" style="width:23%">
					<option value="">지역</option>
					<option value="서울경기도">서울,경기도</option>
					<option value="강원도">강원도</option>
					<option value="충청도">충청도</option>
					<option value="전북">전라북도</option>
					<option value="전남">전라남도</option>
					<option value="경북">경상북도</option>
					<option value="경남">경상남도</option>
					<option value="제주">제주도</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select id="human" name="human" style="width:23%">
					<option value="">동행</option>
					<option value="가족">가족</option>
					<option value="연인">연인</option>
					<option value="친구">친구</option>
					<option value="반려견">반려견</option>
				</select>	
				<br>
			</td>
			<td width="20%"></td>
		</tr>
		<tr>
			<td width="20%"></td>
			<td style="vertical-align:top;" align="center" colspan="2">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select id="move" name="move" style="width:23%">
					<option value="">이동</option>
					<option value="버스">버스</option>
					<option value="기차">기차</option>
					<option value="자가용">자가용</option>
					<option value="자전거">자전거</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select id="schedule" name="schedule" style="width:23%">
					<option value="">일정</option>
					<option value="당일">당일</option>
					<option value="숙박">숙박</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select id="uinout" name="uinout" style="width:23%">
					<option value="">장소</option>
					<option value="실내">실내</option>
					<option value="실외">실외</option>
				</select>	
				<br>
			</td>
			<td width="20%"></td>
		</tr>
		<tr>
			<td width="20%"></td>
			<td align="center" colspan="2">
				<textarea id="bnote" name="bnote" style="width:85%; height:300px; font-size:20px; font-align:center; "></textarea>
			</td>
			<td width="20%"></td>
		</tr>
		<tr height="70px">
			<td></td>
			<td>
				<input type="button" id="add_btn" name="add_btn" value="첨부파일 추가" style="margin-left : 85px">
				<table id="attach_table" border="1" width="500px" style="margin-right : 155px; margin-top : 30px;">
					<tr>
						<th>첨부파일</th>
						<th width="100px">비고</th>
					</tr>
				</table>
			</td>
			<td colspan="2" style="text-align: left; vertical-align : top;">
				<input type="reset" class="rwhite" style="background-color : #d9d9d9;" value="초기화">
				<input type="button" class="wwhite" style="background-color : #d9d9d9; margin-right : 240px;" onclick="DoWrite();" value="글쓰기 완료">
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center"></td>
		</tr>
	</table>
	</form>
	</body>
</html>