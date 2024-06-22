<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %> 

<%@ page import="trip.vo.*" %>
<%@ page import="trip.dto.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %> 
<%
String pageno  = request.getParameter("page");
if(pageno  == null) pageno  = "1";

String kind    = request.getParameter("kind"); 
if(kind  == null) kind  = "W";

int curpage = 1;
try
{
	curpage = Integer.parseInt(pageno);
}catch(Exception e){}

boardDTO dto = new boardDTO();
int total = dto.writeTotal(login.getUno());

//최대 페이지 번호를 계산한다.
int perPage = 5;
int maxpage = total / perPage;	
if( total % perPage != 0) maxpage++;
%>
<link rel="stylesheet" type="text/css" href="../css/user_info.css">   
<script>
	$(document).ready(function(){
		$("#bookwrite").css("background-color","#b5dbf0");
		
		$(".bnoval")
		.mouseover(function(){
			$(this).css("background-color", "#F0F1EC");
		})
		.mouseout(function()
		{
			$(this).css("background-color", "");
		}); 
	});
		
	/* 회원탈퇴로직 */
	function gotoRetire()
	{
		window.location = "../user/retire.jsp";			
	};
	
	
	function writeDelete(bno)
	{
		if(confirm("게시글을 삭제하시겠습니까?") == false )
		{
			return;
		}
		$.ajax({
			type : "post",
			url  : "bookwritedelete.jsp",
			data : 
			{	
				bno :  bno
			},
			datatype : "html",
			success : function(result)
			{
				result = result.trim();
				alert("게시글삭제되었습니다.");
				window.location.reload();
			}
		});
	}
	
	function moveReply()
	{
		document.location = "bookreply.jsp";
	}
	
	function movebook()
	{
		document.location = "bookmark.jsp";
	}
	
	function moveWrite()
	{
		document.location = "bookwrite.jsp";
	}
	
	function view(a)
	{
		document.location = '../board/view.jsp?' + a;
	} 
</script>
<style>
td
{
	text-align:center;
}
</style>
	<form method="post" name="book" id="book" action="bookok.jsp">
		<table border="0" width="80%" align="center" >
			<tr>
				<td style="width: 20%; vertical-align: top;">
					<table border="0" align="center" width="80%" height="550px">
						<tr>
							<td align="center">
							<br><br><br>
							<%
							String icon = "😄";
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
				<td width="100%">
					<table border="0" width="95%" align="center" margin="0px">
						<tr>
							<td colspan="2">
								<button type="button" id="bookpage" onclick="movebook();"><span style="font-size: 22px;">북마크확인</span></button>
								<button type="button" id="bookwrite" onclick="moveWrite();"><span style="font-size: 22px;">작성글확인</span></button>
								<button type="button" id="bookreply" onclick="moveReply();"><span style="font-size: 22px;">작성댓글확인</span></button>
							<td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:left; font-size: 20px;">작성 게시물 : <%= total %>개<br></td>
						</tr>
						<tr style="background-color: lightgray;">
							<td style="width: 40px; font-size: 20px;">번호</td>
							<td style="width: 150px; font-size: 20px;">키워드</td>
							<td style="width: 350px; font-size: 20px;">제목</td>
							<td style="width: 20px; font-size: 20px;">&nbsp;</td>
							<td style="width: 80px; font-size: 20px;">작성일</td>
							<td style="width: 50px; font-size: 20px;">조회수</td>
							<td style="width: 50px; font-size: 20px;">추천수</td>
						</tr>
						<%
						int seqNo = total -((curpage - 1) * 5);
						ArrayList<boardVO> mlist = dto.writeList(login.getUno(), 5, curpage);
						for(boardVO vo : mlist)
						{
							String link_str = "";
							link_str += "page=" + curpage + "&no=" + vo.getBno() + "&uno=" + login.getUno() + "&kind=" + kind;
						%>
						<tr id="bnoval" class="bnoval" onclick="view('<%= link_str %>');" style="cursor: pointer;">
							<td style="font-size: 20px;"><%= seqNo-- %></td>
							<td style="width: 260px;">
								<span>
									<span style="color: hotpink; font-size: 18px; width: 30px;">
										<%=(!vo.getSeason().equals("null"))?vo.getSeason():"" %>
									</span>
									<span style="color: saddlebrown; font-size: 18px; width: 40px;">
										<%=(!vo.getLocal().equals("null"))?vo.getLocal():"" %>
									</span>
									<span style="color: orangered; font-size: 18px; width: 30px;">
										<%=(!vo.getHuman().equals("null"))?vo.getHuman():"" %>
									</span>
									<span style="color: royalblue; font-size: 18px; width: 30px;">
										<%=(!vo.getMove().equals("null"))?vo.getMove():"" %>
									</span>
									<span style="color: darkmagenta; font-size: 18px; width: 30px;">
										<%=(!vo.getSchedule().equals("null"))?vo.getSchedule():"" %>
									</span>
									<span style="color: #FFBF00; font-size: 18px; text-shadow: 0.5px -1px 0.5px black; width: 30px;">
										<%=(!vo.getUinout().equals("null"))?vo.getUinout():"" %>
									</span>
								</span>
							</td>
							<td style="font-size: 20px;"><%=vo.getBtitle() %>
							<%
							if(!vo.getRno().equals("0"))
							{
								%>
								<span style="color:#ff6600; ">(<%= vo.getRno() %>)</span></td>
								<%
							}
							%>
							<td style="font-size: 10px;">&nbsp;</td>
							<td style="font-size: 20px;"><%= vo.getBwdate() %></td>
							<td style="font-size: 20px;"><%= vo.getBhit() %></td>
							<td style="font-size: 20px;"><%= vo.getBlike() %></td>
							<td width="30px">
								<span id="bookdel" name="bookdel" onclick="writeDelete(<%= vo.getBno() %>);">
								<img src="../image/del.jpg" width="14px" height="14px"></span>
							</td>
							<%
							}
						%>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<table>
					<tr>
						<td colspan="3" style="font-size: 25px; width: 70%; align:center;">
						<%
						//페이징 시작블럭번호와 끝블럭 번호를 계산한다
						int startBlock = ( (curpage - 1)  / 10) * 10 + 1;
						int endBlock   = startBlock + 10 - 1; 
						
						//endBlock 이 최대 페이지 번호보다 크면 안됨.
						if( endBlock > maxpage)
						{
							//예: maxpage가 22인데, endBlock이 30이면 endBlock을 22로 변경
							endBlock = maxpage;
						}	
			
						//이전 페이지 블럭을 표시한다.
						if(startBlock != 1)
						{
							%><a href="bookwrite.jsp?page=<%= startBlock - 1 %>">◀</a>&nbsp;<%
						}	
						
						//화면에 블럭 페이징을 표시한다.
						for(int pno = startBlock ; pno <= endBlock; pno++)
						{
							if( curpage == pno)
							{
								//현재 페이지 이면....
								%><a href="bookwrite.jsp?page=<%= pno %>&uno=<%= login.getUno() %>"><b style="color:red;">&nbsp;&nbsp;&nbsp;<%= pno %></b></a>&nbsp;<%
							}else
							{
								%><a href="bookwrite.jsp?page=<%= pno %>&uno=<%= login.getUno() %>">&nbsp;&nbsp;&nbsp;<%= pno %></a>&nbsp;<%	
							}
						}
						
						//다음 페이지 블럭을 표시한다.
						if(endBlock < maxpage)
						{
							%><a href="bookwrite.jsp?page=<%= endBlock + 1 %>">▶</a>&nbsp;<%
						}
						%>
						</td>
					</tr>
				</table>
			</tr>
		</table>
	</form>
</body>
</html>