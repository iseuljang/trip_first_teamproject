<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trip.util.*" %>
<%@ include file="../include/head.jsp" %>   
<link rel="stylesheet" type="text/css" href="../css/view.css">    
<%
request.setCharacterEncoding("UTF-8");
String uno = request.getParameter("uno");
String bkind       = request.getParameter("kind");
String pageno     = request.getParameter("page");
String type       = request.getParameter("type");
String bno        = request.getParameter("no");
String[] season   = request.getParameterValues("season"  );
String[] local    = request.getParameterValues("local"   );
String[] human    = request.getParameterValues("human"   );
String[] move     = request.getParameterValues("move"    );
String[] schedule = request.getParameterValues("schedule");
String[] uinout   = request.getParameterValues("uinout"  );
String keyword   = request.getParameter("keyword"  );

if(bkind  == null) bkind  = "I";
if(pageno  == null) pageno  = "1";
if(type    == null) type    = "T";
if(keyword == null) keyword = "";
//키워드를 공백을 기준으로 나눠서 배열에 저장
String[] keylist = keyword.split(" ");
if(bno == null || bno.equals(""))
{
	response.sendRedirect("lobby.jsp");
	return;	
}

//파라메터를 생성한다.
/* String search_param = "";
search_param += "&season=" + season;
search_param += "&local=" + local;
search_param += "&human=" + human;
search_param += "&move=" + move;
search_param += "&schedule=" + schedule;
search_param += "&uinout=" + uinout; */
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
param += "page=" + pageno;
param += "&";
param += "no=" + bno;
param += "&";
param += "keyword=" + keyword;
param += "&";
param += "kind=" + bkind;
param += "&";
param += search_param;

//게시물 정보를 조회한다.
boardDTO bdto  = new boardDTO();
boardVO  bvo   = bdto.Read(bno, true);

//게시물 첨부파일 조회한다.
attachDTO adto = new attachDTO();
ArrayList<attachVO>  avos  = adto.Read(bno);

//첨부파일이 없는 게시물 볼때 오류방지하기 위해 첫번째 배열에 빈값넣음
if(avos.size() == 0)
{
	attachVO avo  = new attachVO();
	avo.setAno("");
	avo.setFname("");
	avo.setPname("");
	avo.setBno("");
	avos.add(avo);
}

%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
	$(document).ready(function()
	{
		/* 게시물 첫번째 첨부파일 이미지 상단배너에 삽입 */
		$("#intro_table").css("background-size", "cover")
						 .css("background-image","url(../upload/<%= avos.get(0).getFname() %>)");
		
		
		var scrolltop = $(document).scrollTop();
        console.log(scrolltop);
        var height = $(document).height();
        console.log(height);
        var height_win = $(window).height();
        console.log(height_win);
		
		
		
		//맨위로 가는 버튼
		$(window).scroll(function() { 
			if ($(this).scrollTop() > 450) { //250 넘으면 버튼이 보여짐니다. 
				$('#toTop').fadeIn(); 
				$('#toTop').css('left', $('#sidebar').offset().left); // #sidebar left:0 죄표 
			} else { 
				$('#toTop').fadeOut(); 
			} 
		}); 
		// 버튼 클릭시 
		$("#toTop").click(function() { 
			$('html, body').animate({ scrollTop : 0 // 0 까지 animation 이동합니다. 
			}, 400); // 속도 400 return false; 
		}); 
		
		
		
		
		//맨아래로 가는 버튼
		$(window).scroll(function() { 
			if ($(this).scrollTop() > 300) { // 작은동안 버튼이 보여짐니다. 
				$('#toDown').fadeIn(); 
				$('#toDown').css('left', $('#sidebar').offset().left); // #sidebar left:0 죄표 
			} else if (($(document).height()-$(window).height()) > 2000) { 
				$('#toDown').fadeOut(); 
			} 
		}); 
		// 버튼 클릭시 
		$("#toDown").click(function() { 
			$('html, body').animate({ scrollTop : $('body').height() // 0 까지 animation 이동합니다. 
			}, 400); // 속도 400 return false; 
		}); 
		
		
		/* 글목록버튼 */
		$("#index_btn").click(function(){
			if("<%= bkind %>" == "I")
			{
				document.location = "../board/index.jsp?<%= param %>";
			}else if("<%= bkind %>" == "S")
			{
				document.location = "../board/search.jsp?<%= param %>";
			}else if("<%= bkind %>" == "B")
			{
				document.location = "../user/bookmark.jsp?page=<%= pageno %>&uno=<%= uno %>&kind=<%= bkind%>";
			}else if("<%= bkind %>" == "R")
			{
				document.location = "../user/bookreply.jsp?page=<%= pageno %>&uno=<%= uno %>&kind=<%= bkind%>";
			}else if("<%= bkind %>" == "W")
			{
				document.location = "../user/bookwrite.jsp?page=<%= pageno %>&uno=<%= uno %>&kind=<%= bkind%>";
			}
		});
		/* 수정버튼 */
		$("#modify_btn").click(function(){
			document.location = "../board/modify.jsp?<%= param %>";
		});
		/* 삭제버튼 */
		$("#delete_btn").click(function(){
			if(confirm("삭제하시겠습니까") == false)
			{
				return;			
			}
			document.location = "../board/delete.jsp?<%= param %>";
		});
		
		$(".btn-like").click(function() 
		{
			$(this).toggleClass("done");
		});
		
		/* 추천 버튼 */
		$("#like").click(function() 
		{
			if(<%= login != null %>)
			{
				$("#unlike").removeClass("done");
				$.ajax({
					type : "post",
					url  : "b_likeok.jsp",
					data : 
					{
						no      : "<%= bno %>"
					},
					datatype : "html",
					success : function(result)
					{
						window.location.reload();
					}
				});
				return;
			}
		});
		/* 비추천 버튼 */
		$("#unlike").click(function() 
		{
			if(<%= login != null %>)
			{
				$("#like").removeClass("done");
				$.ajax({
					type : "post",
					url  : "b_nolikeok.jsp",
					data : 
					{
						no      : "<%= bno %>"
					},
					datatype : "html",
					success : function(result)
					{
						window.location.reload();
					}
				});
				return;
			}
		});
		
		/* 댓글작성버튼 */
		$("#r_write").click(function(){
			if(confirm("댓글을 작성하시겠습니까?") == false)
			{
				return;
			}
			$.ajax({
				type : "post",
				url  : "r_writeok.jsp",
				data : 
				{
					no      : "<%= bno %>",
					rnote   : $("#rnote").val(),
					btitle  : "<%= bvo.getBtitle() %>"
				},
				datatype : "html",
				success : function(result)
				{
					window.location.reload();
				}
			});
		});
		
	});
	
	/* 댓글수정버튼 */
	function reply_modify(rno)
	{
		if(confirm("댓글을 수정하시겠습니까?") == false )
		{
			return;
		}
		let r_modify = prompt("댓글을 수정하세요");
		$.ajax({
			type : "post",
			url  : "r_modifyok.jsp",
			data : 
			{
				no      : "<%= bno %>",
				rnote   : r_modify,
				rno     : rno
			},
			datatype : "html",
			success : function(result)
			{
				alert("댓글이 수정되었습니다.");
				window.location.reload();
			}
		});
	};
	/* 댓글삭제버튼 */
	function reply_delete(rno)
	{
		if(confirm("댓글을 삭제하시겠습니까?") == false )
		{
			return;
		}
		$.ajax({
			type : "post",
			url  : "r_deleteok.jsp",
			data : 
			{
				rno     : rno
			},
			datatype : "html",
			success : function(result)
			{
				alert("댓글이 삭제되었습니다.");
				window.location.reload();
			}
		});
	};
	
	function DoBook(bno)
	{
		if(confirm("북마크하시겠습니까?") == false )
		{
			return;
		}
		
		$.ajax({
			type : "post",
			url  : "bookok.jsp",
			data : 
			{
				no : bno
			},
			datatype : "html",
			success : function(result)
			{
				result = result.trim();
				switch(result)
				{
				case "ERROR" :
					alert("이미 북마크된 게시물입니다");
					break;
				case "OK" :
					alert("북마크되었습니다");
					window.location.reload();
					break;
				}
			}
		});
	}
	
</script>
<!-- 상단부분 -->
<table border="0" style="width: 100%; height: 50px; background-color: lightgray; position: relative; top: -5px;">
	<tr>
		<td width="120px">
		&nbsp;
		</td>
		<td class="keywords">
			<%
			//키워드표시(null 값이 아니고 "null"값도 아니면 표시) 
			if(bvo.getSeason() != null && !bvo.getSeason().equals("null"))
			{
				%>
				<span style="color: hotpink; padding-left: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;<%= bvo.getSeason() %> </span>
				<%
			}
			if(bvo.getLocal() != null && !bvo.getLocal().equals("null"))
			{
				%>
				<span style="color: saddlebrown;"> <%= bvo.getLocal() %> </span>
				<%
			}
			if(bvo.getHuman() != null && !bvo.getHuman().equals("null"))
			{
				%>
				<span style="color: orangered;"> <%= bvo.getHuman() %> </span>
				<%
			}
			if(bvo.getMove() != null && !bvo.getMove().equals("null"))
			{
				%>
				<span style="color: royalblue;"> <%= bvo.getMove() %> </span>
				<%
			}
			if(bvo.getSchedule() != null && !bvo.getSchedule().equals("null"))
			{
				%>
				<span style="color: darkmagenta;"> <%= bvo.getSchedule() %> </span>
				<%
			}
			if(bvo.getUinout() != null && !bvo.getUinout().equals("null"))
			{
				%>
				<span style="color: ghostwhite;"> <%= bvo.getUinout() %> </span>
				<%
			}
			%>
		</td>
		<td class="buttons_td" width="650px;">
			<%
			//비로그인시
			if(login == null){}
			//로그인 상태와 본인이 쓴 게시물이 맞을시
			else if(login != null && login.getUno().equals(bvo.getUno()) || login.getAdmin().equals("Y"))
			{
				%>
				<button type="button" class="buttons" id="modify_btn">수정</button>
				<button type="button" class="buttons" id="delete_btn">삭제</button>
				<%
			}
			%>
			<%
			if(login != null)
			{
				%>
				<button type="button" class="buttons" id="bookbtn" onclick="DoBook(<%= bvo.getBno() %>);">북마크</button>
				<%
			}else
			{
				%>
				<button type="button" class="buttons" id="bookbtn" onclick="alert('로그인 후 북마크 가능합니다.')">북마크</button>
				<%				
			}
			%>
			<button type="button" class="buttons" id="index_btn">글목록</button>
		</td>
		<td width="120px">
		&nbsp;
		</td>
	</tr>
</table>	
<!-- 본문부분 -->
<table border="0" style="width: 60%; height: 350px;" align="center" id="intro_table">
	<tr>
		<td class="intro"><h1 style="color: whitesmoke; text-align:left; height:50px;">&nbsp;&nbsp;&nbsp;<%= bvo.getBtitle() %></h1></td>
	</tr>
	<tr>
		<td class="intro" height="10"><h3 style="color: whitesmoke; text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= bvo.getUnick() %></h3></td>
	</tr>	
	<tr>
		<td class="intro" height="10" style="text-align:left; height:50px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= bvo.getBwdate() %> ㅣ <%= bvo.getBhit() %></td>
	</tr>
</table>
<table border="0" align="center" style="width: 60%;">
	<tr>
		<td align="center" colspan="2" style="padding: 50px;"><i  style="font-size: 50px; font-weight: bolder; text-shadow:1px 1px 10px #444;"><%= bvo.getBtitle() %></i></td>
		<td align="right">
			<button type="button" id="toDown" style="width:120px; heigh:60px; cursor:pointer; cursor:hand; line-height: -3em; font-size: 25px; border-radius: 0.5em; background-color: rightgray;">
				▼DOWN
			</button>
		</td>
	</tr>
		<td colspan="2" id="note">
			<%		
			String bnote = bvo.getBnote();
			bnote = bnote.replace("<","&lt;");
			bnote = bnote.replace(">","&gt;");
			bnote = bnote.replace("\n","<br>");
			%>
			<%= bnote %>
		</td>
	<tr>
	</tr>
		<td colspan="2">
			<%
			//게시물 첨부파일 이미지(없으면 표시하지않음) 
			if(avos.isEmpty() != true)
			{
				for(attachVO  avo : avos)
				{
					if(!avo.getFname().equals(""))
					{
						%>
						<img src=" ../upload/<%= avo.getFname() %> " style="width:800px;">
						<%
					}
				}
			}
			%>
		</td>
	<tr>
		<td colsapn="2">
			<%
			//게시물 첨부파일 다운로드(없으면 표시하지않음) 
			for(attachVO avo : avos)
			{
				if(!avo.getAno().equals(""))
				{
					%>
					첨부파일 : <a href="download.jsp?no=<%= avo.getAno() %>"><%= avo.getPname() %></a><br>
					<%
				}
			}
			%>
		</td>
	</tr>
	<tr>
		<td style="width:50%; text-align: right; padding-right: 20px; padding-top: 50px;"><button class="btn-like" id="like" style="font-size: 40px;">👍🏻</button></td>
		<td style="text-align: left; padding-left: 20px; padding-top: 50px;"><button class="btn-like" id="unlike" style="font-size: 40px;">👎🏻</button></td>
		<td align="right">
			<button type="button" id="toTop" style="width:120px; heigh:60px; cursor:pointer; cursor:hand; line-height: -3em; font-size: 25px; border-radius: 0.5em; background-color: rightgray;">
				▲TOP
			</button>
		</td>
	</tr>
	<tr>
		<td style="text-align: right; padding-right: 20px;">추천: <%= bvo.getBlike() %></td>
		<td style="text-align: left; padding-left: 20px;">비추천: <%= bvo.getBhate() %></td>
	</tr>				
</table>
<hr>
<!-- 하단부분 -->
<%
//로그인이 되어야만 댓글을 쓸수있음(비로그인은 댓글을 볼수만 잇음)
if(login != null)
{
	%>
	<table border="0" style="width: 70%;" align="center">
	
		<tr>
			<td align="right" style="text-align: center; font-size : 60px;">
			<%
				String icon = "😄";
				switch (login.getUicon())
				{
	    		case "1": icon  = "😄"; break;     				  
	    		case "2": icon  = "😅"; break;  
	    		case "3": icon  = "😆"; break;  
	    		case "4": icon  = "😀"; break;  
	    		case "5": icon  = "😨"; break;  
	    		case "6": icon  = "👿"; break;  
	    		case "7": icon  = "😝"; break;  
	    		case "8": icon  = "😷"; break;  
	    		case "9": icon  = "😴"; break;  
	    		case "10": icon  = "😱"; break;  
	            }
				%>
				<%= icon %>
				<%
			%>
			</td>
			<td>
				&nbsp;&nbsp;&nbsp;
				<input type="text" id="rnote" placeholder="내용을 입력해주세요">&nbsp;&nbsp;&nbsp;
				<button type="button" id="r_write"style="background-color: skyblue; width: 90px; height: 35px;">댓글 작성</button>
			</td>
		</tr>
	</table>	
	<%
}else{}
//댓글 불러오기
replyDTO rdto = new replyDTO();
ArrayList<replyVO> rlist = rdto.GetList(bno);
for(replyVO rvo : rlist)
{
%>
	<table border="0" style="width: 60%;" align="center">
		<tr>
			<td colspan="4"><hr style="width: 100%; border:0px; height:1px; background: linear-gradient(to left, transparent, #87CEEA, transparent);"></td>
		</tr>	
		<tr>
			<td rowspan="2" style="text-align: center; font-size : 40px; width:150px;">
			<%
				String icon = "😄";
				switch (rvo.getUicon())
				{
	    		case "1": icon  = "😄"; break;     				  
	    		case "2": icon  = "😅"; break;  
	    		case "3": icon  = "😆"; break;  
	    		case "4": icon  = "😀"; break;  
	    		case "5": icon  = "😨"; break;  
	    		case "6": icon  = "👿"; break;  
	    		case "7": icon  = "😝"; break;  
	    		case "8": icon  = "😷"; break;  
	    		case "9": icon  = "😴"; break;  
	    		case "10": icon  = "😱"; break;  
	            }
				%>
				<%= icon %>
				<%
			%>
			</td>
			<td style="font-size: 20px;" width="150"><%=rvo.getUnick() %></td>
			<td style="font-size: 15px;">&nbsp;&nbsp;&nbsp;<%=rvo.getRwdate() %></td>
			<td style="text-align: right; height: 20px; padding-right: 100px;">
				<%
				//비로그인시
				if(login == null){}
				//로그인이 되어있고 본인이 쓴 댓글이 맞을시
				else if(login != null && login.getUno().equals(rvo.getUno()) || login.getAdmin().equals("Y"))
				{
					%>
					<a href="javascript:reply_modify('<%= rvo.getRno() %>');"><span class="reply_btn" id="reply_modify" style="width: 60px; height: 25px; background-color: navajowhite; border-radius: 0.2em; border: 0;">수정</span></a>
					<a href="javascript:reply_delete('<%= rvo.getRno() %>');"><span class="reply_btn" id="reply_delete" style="width: 60px; height: 25px; background-color: navajowhite; border-radius: 0.2em; border: 0;">삭제</span></a>
					<%
				}
				%>
			</td>
		</tr>
		<tr>
			<td colspan="3" style="padding-bottom: 30px;"><%=rvo.getRnote() %></td>					
		</tr>
	</table>
	<%
}
%>
</body>
</html>