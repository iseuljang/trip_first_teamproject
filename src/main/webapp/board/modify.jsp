<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trip.util.*" %>
<%@ include file="../include/head.jsp" %>   
<%
request.setCharacterEncoding("UTF-8");

String pageno     = request.getParameter("page");
String type       = request.getParameter("type");
String bno        = request.getParameter("no");
String[] season   = request.getParameterValues("season"  );
String[] local    = request.getParameterValues("local"   );
String[] human    = request.getParameterValues("human"   );
String[] move     = request.getParameterValues("move"    );
String[] schedule = request.getParameterValues("schedule");
String[] uinout   = request.getParameterValues("uinout"  );
String[] keyword   = request.getParameterValues("keyword"  );
if(pageno  == null) pageno  = "1";
if(type    == null) type    = "T";
if(keyword == null) keyword = new String[] {""};
if(bno == null || bno.equals(""))
{
	response.sendRedirect("lobby.jsp");
	return;	
}

//파라메터를 생성한다.
String search_param = "";
search_param += Param.getParam(season,"season");
search_param += "&";
search_param += Param.getParam(local,"local");
search_param += "&";
search_param += Param.getParam(human,"human");
search_param += "&";
search_param += Param.getParam(move,"move");
search_param += "&";
search_param += Param.getParam(schedule,"schedule");
search_param += "&";
search_param += Param.getParam(uinout,"uinout");

String param = "";
param += "type=" + type;
param += "&";
param += "pageno=" + pageno;
param += "&";
param += "no=" + bno;
param += "&";
param += Param.getParam(keyword,"keyword");
param += "&";
param += search_param;

boardDTO bdto = new boardDTO();
boardVO  bvo  = bdto.Read(bno, false);

attachDTO adto = new attachDTO();
ArrayList<attachVO>  avos  = adto.Read(bno);

%>
<!-- ================================================================================= -->
<script>
$(document).ready(function(){	
	//게시물에 기존파일이 존재하면 
	if(<%= avos.isEmpty() %> != true)
	{
		//기존 첨부파일 불러오기
		$.ajax({
			url : "attach.jsp",
			type : "get",
			dataType : "html",
			data : 
			{
				no : <%= bno %>
			},
			success : function(response){
				response = response.trim();
				$("#tblUpload").append(response);
			}
		});				
	}
	
	//첨부파일 추가 버튼 이벤트 리스너
	$("#btnAdd").click(function(){
		AddAttach();
	});
	
});

//첨부파일 추가
function AddAttach()
{
	$.ajax({
		url : "attach.jsp",
		type : "get",
		dataType : "html",
		success : function(response){
			response  = response.trim();
			//response  = response.substr(156,347);
			$("#tblUpload").append(response);
		}
	});				
}

//첨부파일 삭제 
function RemoveAttach(obj)
{
	var tr = $(obj).parent().parent();
	tr.remove();
}



// 수정버튼
function DoModify()
{
	if( $("#btitle").val() == "" )
	{
		$("#btitle").focus();
		alert("제목을 입력하세요.");
		return;
	}
	if( $("#bnote").val() == "" )
	{
		$("#bnote").focus();
		alert("내용을 입력하세요.");
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
	
	if(confirm("변경된 게시물을 작성하시겠습니까?") == false)
	{
		return;
	}
	$("#modify").submit();
}

//취소버튼
function DoReset()
{
	document.location = "../board/view.jsp?<%= param %>";
}

//삭제버튼
function DoDelete()
{
	if(confirm("삭제하시겠습니까") == false)
	{
		return;			
	}
	document.location = "../board/delete.jsp?<%= param %>";
}
</script>   
		<form id="modify" name="modify" method="post" action="modifyok.jsp" enctype="multipart/form-data">
			<input type="hidden" name="no" value="<%= bno %>">
			<table border="0" width="100%">
				<tr>
					<td colspan="4" height="10px"></td>
				</tr>
				<tr>
					<td width="20%"></td>
					<td align="center" height="60px" colspan="2">
						<!-- 제목 -->
						<input type="text" id="btitle" name="btitle" style="width:85%; height:100%; font-size:30px;" value="<%= bvo.getBtitle() %>">
					</td>
					<td width="20%"></td>
				</tr>
				<tr>
					<td width="20%"></td>
					<td style="vertical-align:top;" align="center" colspan="2">
					<!-- 키워드 -->
					✔️<select id="season" name="season" style="width:23%">
							<option value="">계절</option>
							<option value="봄" <%= bvo.getSeason().equals("봄") ? "selected" : "" %>>봄</option>
							<option value="여름" <%= bvo.getSeason().equals("여름") ? "selected" : "" %>>여름</option>
							<option value="가을" <%= bvo.getSeason().equals("가을") ? "selected" : "" %>>가을</option>
							<option value="겨울" <%= bvo.getSeason().equals("겨울") ? "selected" : "" %>>겨울</option>
						</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					✔️<select id="local" name="local" style="width:23%">
							<option value="">지역</option>
							<option value="서울경기도" <%= bvo.getLocal().equals("서울경기도") ? "selected" : "" %>>서울,경기도</option>
							<option value="강원도" <%= bvo.getLocal().equals("강원도") ? "selected" : "" %>>강원도</option>
							<option value="충청도" <%= bvo.getLocal().equals("충청도") ? "selected" : "" %>>충청도</option>
							<option value="전북" <%= bvo.getLocal().equals("전북") ? "selected" : "" %>>전라북도</option>
							<option value="전남" <%= bvo.getLocal().equals("전남") ? "selected" : "" %>>전라남도</option>
							<option value="경북" <%= bvo.getLocal().equals("경북") ? "selected" : "" %>>경상북도</option>
							<option value="경남" <%= bvo.getLocal().equals("경남") ? "selected" : "" %>>경상남도</option>
							<option value="제주" <%= bvo.getLocal().equals("제주") ? "selected" : "" %>>제주도</option>
						</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="human" name="human" style="width:23%">
							<option value="">동행</option>
							<option value="가족" <%= bvo.getHuman().equals("가족") ? "selected" : "" %>>가족</option>
							<option value="연인" <%= bvo.getHuman().equals("연인") ? "selected" : "" %>>연인</option>
							<option value="친구" <%= bvo.getHuman().equals("친구") ? "selected" : "" %>>친구</option>
							<option value="반려견" <%= bvo.getHuman().equals("반려견") ? "selected" : "" %>>반려견</option>
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
							<option value="버스" <%= bvo.getMove().equals("버스") ? "selected" : "" %>>버스</option>
							<option value="기차" <%= bvo.getMove().equals("기차") ? "selected" : "" %>>기차</option>
							<option value="자가용" <%= bvo.getMove().equals("자가용") ? "selected" : "" %>>자가용</option>
							<option value="자전거" <%= bvo.getMove().equals("자전거") ? "selected" : "" %>>자전거</option>
						</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="schedule" name="schedule" style="width:23%">
							<option value="" >일정</option>
							<option value="당일" <%= bvo.getSchedule().equals("당일") ? "selected" : "" %>>당일</option>
							<option value="숙박" <%= bvo.getSchedule().equals("숙박") ? "selected" : "" %>>숙박</option>
						</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="uinout" name="uinout" style="width:23%">
							<option value="">장소</option>
							<option value="실내" <%= bvo.getUinout().equals("실내") ? "selected" : "" %>>실내</option>
							<option value="실외" <%= bvo.getUinout().equals("실외") ? "selected" : "" %>>실외</option>
						</select>		
						<br>
					</td>
					<td width="20%"></td>
				</tr>
				<tr>
					<td width="20%"></td>
					<td align="center" colspan="2">
						<!-- 내용 -->
						<textarea id="bnote" name="bnote" style="width:85%; height:300px;"><%= bvo.getBnote().replace("<br>","\n") %></textarea>
					</td>
					<td width="20%"></td>
				</tr>
				<tr bgcolor="#d9d9d9">
					<td colspan="4" align="center">
						<span>
					   		<input type="button" id="btnAdd" name="btnAdd" value="첨부파일 추가">
					   		<table id="tblUpload" border="1" width="500px">
								<tr>
									<th>삭제</th><!-- 삭제할 첨부파일 체크박스 -->
									<th>첨부파일</th><!-- 첨부파일 이름뜨는곳 -->
									<th width="100px">비고</th><!-- 첨부파일추가 칸 지우기 -->
								</tr>
							</table>
						</span><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="wwhite" onclick="DoModify();" value="수정">
						<input type="reset" class="wwhite" onclick="DoReset();" value="취소">
						<input type="button" class="wwhite" onclick="DoDelete()" value="삭제">
					</td>
				</tr>
				<tr>
					<td width="20%"></td>
					<td colspan="2" align="center"></td>
					<td width="20%"></td>
				</tr>
			</table>
		</form>
	</body>
</html>