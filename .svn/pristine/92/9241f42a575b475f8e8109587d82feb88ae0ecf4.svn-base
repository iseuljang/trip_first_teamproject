<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trip.util.*" %>
<%@ include file="../include/head.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String kind       = request.getParameter("kind");
String pageno  = request.getParameter("page");
String type  = request.getParameter("type");
String[] season   = request.getParameterValues("season"  );
String[] local    = request.getParameterValues("local"   );
String[] human    = request.getParameterValues("human"   );
String[] move     = request.getParameterValues("move"    );
String[] schedule = request.getParameterValues("schedule");
String[] uinout   = request.getParameterValues("uinout"  );
String keyword    = request.getParameter("keyword"  );
if(kind  == null) kind  = "I";
if(pageno  == null) pageno  = "1";
if(type    == null) type    = "T";
if(keyword == null) keyword = "";
int perPage = 30;
int curpage = 1;  // 게시판 페이지번호
try
{
	curpage = Integer.parseInt(pageno);
}catch(Exception e){}

int acurpage = 1;  // 공지사항 페이지 ㅣ번호


System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++");
System.out.println("로컬 values : "+local);
if(local!=null)
{
	System.out.println("원소 갯수 : "+local.length);
	System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++");
	for(String item : local)
	{
		System.out.println(item);
		System.out.println(item.equals(""));
	}
}
// 슬라이드 게시물 조회
adminboardDTO dto = new adminboardDTO();

ArrayList<adminboardVO> alist = dto.GetList(acurpage);



//게시물 정보를 srvo객체에 담아 조회한다
boardDTO bdto = new boardDTO();
searchVO svo = new searchVO();
if(season!=null)svo.setSeason(season);
if(local!=null)svo.setLocal(local);
if(human!=null)svo.setHuman(human);
if(move!=null)svo.setMove(move);
if(schedule!=null)svo.setSchedule(schedule);
if(uinout!=null)svo.setUinout(uinout);

System.out.println("시즌은:" + svo.getSeason()); 
//키워드를 공백을 기준으로 나눠서 배열에 저장
String[] keylist = keyword.split(" ");

ArrayList<boardVO> list = bdto.GetList(curpage, type, keylist, svo, perPage);


//전체 게시물 갯수를 조회한다.
int total = bdto.GetTotal(type, keylist, svo);
System.out.println("type : "+ type);
System.out.println("keyword : "+ keyword);
System.out.println("total : "+ total);

//최대 페이지 번호를 계산한다.

int maxpage = total / perPage;	
if( total % perPage != 0) maxpage++;

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
param += "keyword=" + keyword;
param += "&";
param += "kind=" + kind;
param += "&";
param += search_param;
%>  
<link rel="stylesheet" type="text/css" href="../css/index.css">

<script>
	$(document).ready(function()
	{
		$(".write_button").click(function(){
			if(confirm("글쓰기 페이지로 이동하시겠습니까?") == true)
			{
				document.location = "../board/write.jsp?<%= search_param %>&type=" + $("#type").val() + "&keyword=" + $("#keyword").val();
			}
		});
		
		$(".keyword_button").click(function(){
			if(confirm("키워드선택 페이지로 이동하시겠습니까?") == true)
			{
				document.location = "../firstmain/main.jsp?<%= search_param %>&type=" + $("#type").val() + "&keyword=" + $("#keyword").val();
			}
		});
		
		/* $(".view")
		.click(function(){
				document.location = "../board/view.jsp";
		})
		*/
		$(".view")
		.mouseover(function(){
			$(this).css("background-color", "#F0F1EC");
		})
		.mouseout(function()
		{
			$(this).css("background-color", "");
		}); 
		
	});
		
	$(function()
	{
		var firstSlide = 
		$('.slider').find('li').first()			// 첫번째 슬라이드		
		.stop(true).animate({'opacity':1},200);	// 첫번째 슬라이드만 보이게 하기
	      
		// 이전버튼 함수
		function PrevSlide()
		{ 
		    stopSlide(); startSlide();		//타이머 초기화
		    
		    var lastSlide = $('.slider').find('li').last()	//마지막 슬라이드
		    .prependTo( $('.slider'));						//마지막 슬라이드를 맨 앞으로 보내기	
		     						  
		    secondSlide =  $('.slider').find('li').eq(1)	//두 번째 슬라이드 구하기
		    .stop(true).animate({'opacity':0},400); 		//밀려난 두 번째 슬라이드는 fadeOut 시키고
		    
		    firstSlide =  $('.slider').find('li').first() 	//맨 처음 슬라이드 다시 구하기
		    .stop(true).animate({'opacity':1},400);			//새로 들어온 첫 번째 슬라이드는 fadeIn 시키기
		 }
		 
		// 다음 버튼 함수	  
	  	function NextSlide()
	  	{ 
	   	 	stopSlide();startSlide();		//타이머 초기화
	   	 	
	    	firstSlide = $('.slider').find('li').first() 	// 첫 번째 슬라이드
		    .appendTo($('.slider')); 					 	// 맨 마지막으로 보내기
		    
		    var lastSlide = $('.slider').find('li').last() 	// 맨 마지막으로 보낸 슬라이드
		    .stop(true).animate({'opacity':0},400); 		// fadeOut시키기
		    
		    firstSlide = $('.slider').find('li').first()	// 맨 처음 슬라이드
		    .stop(true).animate({'opacity':1},400);			// fadeIn 시키기
	 	 }
	  
	    $('#next').on('click', function()
		{ 
			// 다음버튼 클릭
	    	NextSlide();
	    });
	  
		 $('#prev').on('click', function()
		 { 
			// 이전 버튼 클릭 
		 	PrevSlide();
		 });
	  
		// 자동 슬라이드 시작
		startSlide();
		var theInterval;
		
		//자동 슬라이드 설정
		function startSlide()
		{
			theInterval = setInterval(NextSlide, 5000); 
		}
		
		//자동 멈추기
		function stopSlide() 
		{ 
			clearInterval(theInterval);
		}
		  
		//마우스 오버시 슬라이드 멈춤
		$('.slider').hover(function()
		{ 
			stopSlide();
		}, 
		function()
		{
			startSlide();
		});
	});	
	
function view(a)
{
	document.location = 'view.jsp?' + a;
} 
	
function DoSearch()
{
	// select-option의 선택값을 가져오고
	// if
	console.log($("#type option:selected").val());
 	if($("#type option:selected").val() == "G")
	{
		document.location = "index.jsp?type=G" + "&keyword=" + $("#keyword").val();
	}
	// 나머지거나
	else
	{
		document.location = "index.jsp?<%= search_param %>&type=" + $("#type").val() + "&keyword=" + $("#keyword").val();
	}
}	
	
</script>
		
<table border="0" style="width: 1400px;" align="center">
	<tr align="center">
		<td>
			<section style="height: 450px;">
			 <ul class="slider">
							<%  // 슬라이드 타이틀 좌우로 보일수 있도록  
							int count = 0;
							for(adminboardVO vo : alist)
							{								
								if(count%2 == 1)
								{	
									%>
									<li id="divSlide">
										<div align="center" style="background-image: url(../upload/<%= vo.getPname() %>);  width: 1820px; height: 260px; ">                                                                           
											<dl>
												<dt></dt>
												<dd></dd>
											</dl>
										</div>
									</li>	
									<%
								}else{
									%>
									<li id="divSlide">
										<div style="background-image: url(../upload/<%= vo.getPname() %>);  width: 1820px; height: 260px; ">  
											<dl class="right">
												<dt></dt>
												<dd></dd>
											</dl>
										</div>
									</li>	
									<%
								}
								count++;
							}
							%>
						</ul>
			  <div class="btn" style="padding-top:135px; padding-right: 100px;">
			    <button type="button" id="prev" style="width: 35px;"><</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <button type="button" id="next" style="width: 35px;">></button>
			  </div>
			</section>
		</td>					
	</tr>
</table>
<table border="0" style="width: 90%; margin-top: -100px;" align="center">
	<tr>
	<td style="text-align: left; width: 550px; font-size : 20px; font-weight : 500; "><b>키워드</b> &nbsp;&nbsp; : 
	<%= Param.setItem(season,"hotpink") %>   <!-- 배열로 넘어오는 season을 param클래스를 활용하여 향상된 for문에 color를 대입하여 값 출력 -->
	<%= Param.setItem(local,"saddlebrown") %>
	<%= Param.setItem(human,"orangered") %>
	<%= Param.setItem(move,"royalblue") %>
	<%= Param.setItem(schedule,"darkmagenta") %>
	<%= Param.setItem(uinout,"#FFBF00") %>
	<br>
	검색결과 : <%= total %>개
		</td>
		<td>
			<select id="type" name="type" style="width: 100px; height: 35px; font-size: 20px; margin-right : 20px;">
				<option value="T" <%= type.equals("T") ? "selected" : "" %>>제목</option>
				<option value="N" <%= type.equals("N") ? "selected" : "" %>>내용</option>
				<option value="U"  <%= type.equals("U")  ? "selected" : "" %>>닉네임</option>
				<option value="" <%= type.equals("") ? "selected" : "" %>>제목+내용</option>
				<option value="G" <%= type.equals("G") ? "selected" : "" %>>전체</option>
			</select>
			<%  // 검색된 
			String searchKeys = "";
			for(String key : keylist)
			{
				System.out.println("key : " + key);
				System.out.println("length : " + key.length());
				if(key.length() > 0 ){searchKeys += (key + " ");}
				
			}
			System.out.println("searchKeys : " + searchKeys);
			System.out.println("length : " + searchKeys.length());
			%>
		</td>
		<td style="text-align: left;">
			<input type="text" id="keyword" style="font-size: 20px; height: 33px;" placeholder="검색어를 입력해주세요." value="<%= searchKeys %>">
			<input type="button" onclick="DoSearch();" id="DoSearch"  value="검색하기" class="search_button">&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		<td style="text-align: right;">
			<button type="button" class="keyword_button">키워드 선택</button>
		</td>
		<td style="text-align: right;">
			<button type="button" class="write_button">글쓰기</button>
		</td>
	</tr>
	<tr>
		<td><br></td>
	</tr>
</table>
<hr style="margin-bottom : 40px; margin-top : 0px;">
<table border="1" style="width: 90%; font-size: 18px;" align="center">
	<tr style="background-color: lightgray;">
		<td style="width: 50px;">번호</td>
		<td style="width: 150px;">키워드</td>
		<td style="width: 300px;">제목</td>
		<td style="width: 80px;">작성자</td>
		<td style="width: 80px;">작성일</td>
		<td style="width: 50px;">조회수</td>
		<td style="width: 50px;">추천수</td>
	</tr>
		
	<% 
	int seqNo = total -((curpage-1)*30);
	for(boardVO vo : list)
	{
		String link_str = "";
		link_str += param;
		link_str += "&page=" + curpage;
		link_str += "&no=" + vo.getBno();
		%>
		<tr onclick="view('<%= link_str %>');" style="cursor: pointer;" class="view">
			
			<td><%= seqNo-- %></td>
			<td>
				<span style="width: 100%; align:center;">
					<span style="color: hotpink; font-size: 13px; width: 20px; margin:1px;">
						<%= vo.getSeason() %>
					</span>
					<span style="color: saddlebrown; font-size: 13px; text-align:center; width: 20px; margin:1px">
						<%= vo.getLocal() %>
					</span>
					<%
					if(!vo.getHuman().equals("null"))
					{
						%>
						<span style="color: orangered; font-size: 13px; width: 20px; margin:1px;">
							<%= vo.getHuman() %>
						</span>
						<%
					}
					%>
					<%
					if(!vo.getMove().equals("null"))
					{
						%>
						<span style="color: royalblue; font-size: 13px; width: 20px; margin:1px;">
						<%= vo.getMove()%>
						</span>
						<%
					}
					%>
					<%
					if(!vo.getSchedule().equals("null"))
					{
						%>
						<span style="color: darkmagenta; font-size: 13px; width: 20px; margin:1px;">
						<%= vo.getSchedule() %>
						</span>
						<%
					}
					%>
					<%
					if(!vo.getUinout().equals("null"))
					{
						%>
						<span style="color: #FFBF00; font-size: 13px; text-shadow: 0.5px -1px 0.5px black; width: 20px; margin:1px;">
						<%= vo.getUinout() %>
						</span>
						<%
					}
					%>
				</span>
			</td>
			<td>
			<!--  <a href="./view.jsp?<%= param %>&no=<%= vo.getBno() %>"> -->
			<%=vo.getBtitle() %> 
			<!--  </a>-->
			</td>
			<td><%=vo.getUnick() %></td>
			<td><%=vo.getBwdate() %></td>
			<td><%=vo.getBhit() %></td>
			<td><%=vo.getBlike() %></td>
		</tr>
		<%
	}
	%>
</table>
<table border="0" style="width: 70%;" align="center">
		<tr style="font-size: 25px;">
			<td>
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
				%><a href="index.jsp?<%= param %>&page=<%= startBlock - 1 %>">◀</a>&nbsp;<%
			}	
			
			//화면에 블럭 페이징을 표시한다.
			for(int pno = startBlock ; pno <= endBlock; pno++)
			{
				if( curpage == pno)
				{
					//현재 페이지 이면....
					%><a href="index.jsp?<%= param %>&page=<%= pno %>"><b style="color:red;"><%= pno %></b></a>&nbsp;<%
				}else
				{
					%><a href="index.jsp?<%= param %>&page=<%= pno %>"><%= pno %></a>&nbsp;<%	
				}
			}
			
			//다음 페이지 블럭을 표시한다.
			if(endBlock < maxpage)
			{
				%><a href="index.jsp?<%= param %>&page=<%= endBlock + 1 %>">▶</a>&nbsp;<%	
			}
			%>
			</td>
		</tr>
	</table>
</body>
</html>