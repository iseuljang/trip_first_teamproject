<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %> 
<link rel="stylesheet" type="text/css" href="../css/masterGonggiwrite.css">    
<%
// -------------------- 값 수령 --------------------
String pageno  = request.getParameter("page");

// 페이징 기본설정
if(pageno  == null || pageno.equals("")) 
{
	pageno  = "1";
}

int curpage = 1;
try{
		curpage = Integer.parseInt(pageno);
}catch(Exception e){  }

// ------------------ 페이징 설정 ----------------------
adminboardDTO dto = new adminboardDTO();
int total = dto.GetTotal();
int perPage = 5;
int maxpage = total / perPage;	
if( total % perPage != 0) maxpage++;

// --------------------- 접근제어 ------------------
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

//관리자 권한이 없을시
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
	$(document).ready(function(){
		$(".tr")
		.mouseover(function(){
			$(this).css("background-color", "#F0F1EC");
		})
		.mouseout(function()
		{
			$(this).css("background-color", "");
		});
		
		// ****보충 보류*****
		$(".checkbox1").mouseup(function(){
			
			if($(".checkbox1").is(":checked") == true)
			{
				$("#selAll").is(":Checked") == true;
			}
			if($(".checkbox1").is(":checked") == false)
			{
				$("#selAll").is(":Checked") == false;
			}
		})
		
		
	});
	
	
	// ----------------- 공지작성 버튼 ------------------  
	function writegonggi()
	{
		if(confirm("글작성 페이지로 이동하시겠습니까?") == true)
		{
			document.location = "masterwrite.jsp";
			return;
		}
	} 
	
	// ----------------- 공지삭제 버튼 ----------------- 
	function batchDel()
	{
		var checked = $('input:checkbox[name=checkbox1]:checked');
		var checkedValueTotal = ""
		
		if(checked.length == 0)
		{
			alert("삭제할 게시글을 선택해주세요.");
			return;
		}
		
		if(confirm("해당 공지글 '" + checked.length +"' 개를 삭제하시겟습니까?") == false) 
		{
			return;
		}
		
		// $.each 를 통해 체크된 항목의 adno의 값을 차례로 받아와 ajax로 전송
		$(checked).each(function(){
			if(checkedValueTotal != "")
			{
				checkedValueTotal += ","	
			}
			checkedValueTotal += $(this).val(); // --> **checked가 아닌 $(this)
		});
		
		$.ajax({
			type : "post",
			url  : "masterGonggidelete.jsp?checkedValueTotal="+checkedValueTotal,
			datatype : "html",
			success : function(result)
			{
				result = result.trim();
				switch(result)
				{
					
					 case "0" : 
						alert("오류로 인해 삭제에 실패했습니다.");
						break;
						
					case "1" : 
						alert("해당 게시글" + checked.length + "개가 삭제되었습니다.");
						break;
				}
			}
		});
		
		location.reload();
	}
		
	// ------------- 게시물 전체 체크 버튼 ----------------
	function select_all(obj)
	{
		if($(obj).is(":Checked") == true)
		{
			var choose_all = $(obj).is(":Checked");
			var each_view = $('input:checkbox[name=checkbox1]');
			
			$(each_view).each(function(){
				this.checked = true;
			
			});
		}else if($(obj).is(":Checked") == false)
		{
			var choose_all = $(obj);
			var each_view = $('input:checkbox[name=checkbox1]');
			
			$(each_view).each(function(){
				this.checked = false;
			
			});
		}
	}
	
	
	// --------------- 공지 게시글 선택시 주소설정 함수 -------------------
	function view(obj)
	{
		document.location = 'masterview.jsp?' + obj;
	} 
</script>
<style>
.tr
{
	cursor : hand; cursor : pointer;
}
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
<body>
	<form method="post" name="masterGonggiwrite" id="masterGonggiwrite" action="masterwrite.jsp">
	
	<!-- 중간부분입니다 -->
	<div style="margin-top:100px"></div>
	<table border="0" width="90%" align="center">
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
							<button type="button" class ="btn" id="write_btn" onclick="writegonggi();" style="background-color : royalblue; margin-right : 20px;">공지 작성</button>
							<button type="button" class ="btn" id="delete_btn" onclick="batchDel();" style="background-color : deeppink;">일괄 삭제</button>
						</td>
					</tr>
					<tr  class="top_tr" id="tr_top">
						<th style="text-align : left; width : 165px;">
							전체 선택 &nbsp;
							<input type="checkbox" id="selAll" name="selAll" onclick="select_all(this);">
						</th>
						<th>번호</th>
						<th>제목</th>
						<th>시작일</th>
						<th>종료일</th>
					</tr>
					<%
					int seqNo = total -((curpage - 1) * 5);
					ArrayList<adminboardVO> alist = dto.GetList(curpage);
					for(adminboardVO vo : alist)
					{
						String link_str = "";
						link_str = "page="+ pageno;
						link_str += "&adno=" + vo.getAdno();
						%>
						<tr class="tr" id="repeat_tr">
							<td>
								<input type="checkbox" name="checkbox1"  class="checkbox1" value="<%= vo.getAdno() %>">
							</td>
							<td onclick="view('<%= link_str %>');"><%= seqNo -- %></td>
							<td onclick="view('<%= link_str %>');"><%= vo.getAdtitle() %></td>
							<td onclick="view('<%= link_str %>');"><%= vo.getStartday() %></td>
							<td onclick="view('<%= link_str %>');"><%= vo.getEndday() %></td>
						</tr>
						<% 
					}
						%>
				</table>
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td style="background-color:gray;">
			</td>
			<td style="font-size: 25px; text-align:center; padding left : 300px; border : 0;" >
			<%
			// **페이징 시작블럭번호와 끌블럭 번호를 계산 
			int startBlock = ((curpage - 1) / 10) * 10 + 1; // -> ex) 1,  11, 21 ,31
			int endBlock = startBlock + 9;					// -> ex) 10, 20, 30 ,40
			
			// endBlock이 최대 페이지 번호보다 크면 안됨
			if( endBlock > maxpage)
			{
				endBlock = maxpage;
			}	

			//이전 페이지 블럭을 표시한다.
			if(startBlock != 1)
			{
				%><a href="masterGonggiwrite.jsp?page=<%= startBlock - 1 %>">◀</a>&nbsp;<%
			}	
			
			//화면에 블럭 페이징을 표시한다.
			for(int pno = startBlock ; pno <= endBlock; pno++)
			{
				if( curpage == pno)
				{
					//현재 페이지 이면....
					%><a href="masterGonggiwrite.jsp?page=<%= pno %>"><b style="color:red;">&nbsp;&nbsp;&nbsp;(<%= pno %>)</b></a>&nbsp;<%
				}else
				{
					%><a href="masterGonggiwrite.jsp?page=<%= pno %>">&nbsp;&nbsp;&nbsp;<%= pno %></a>&nbsp;<%	
				}
			}
			
			//다음 페이지 블럭을 표시한다.
			if(endBlock < maxpage)
			{
				%><a href="masterGonggiwrite.jsp?page=<%= endBlock + 1 %>">▶</a>&nbsp;<%
			}
			%>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>