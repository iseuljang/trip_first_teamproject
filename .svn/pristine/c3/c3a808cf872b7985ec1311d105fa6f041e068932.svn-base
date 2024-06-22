<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
<%@ page import="trip.util.*" %>
<%@ page import="trip.vo.*" %>
<link rel="stylesheet" type="text/css" href="../css/index2.css">
<script src="../js/main.js"></script>
<%
request.setCharacterEncoding("UTF-8");
String pageno  = request.getParameter("page");
String type  = request.getParameter("type");
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

//슬라이드 게시물 조회
adminboardDTO dto = new adminboardDTO();
ArrayList<adminboardVO> alist = dto.GetList(1);
System.out.println("가져온 데이터 갯수 : "+alist.size());
%>
<script>

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
	
	<%-- // 슬라이드에서 얻은 게시물번호로 링크
	$('.slider > #divSlide').on('click', function()
	{ 
		firstSlide = $('.slider').find('li').first();
		//alert($(firstSlide).attr("no"));
		
		bno = $(firstSlide).attr("no");    
		document.location = "../board/view.jsp?<%= param %>&no=" + bno;
	});	 --%>

});
	//이전페이지에서 받아온 season
	<%
	String   season_list = "";
	if(season != null)
	{
		for(String item : season)
		{
			if(!season_list.equals(""))
			{
				season_list += ",";
			}
			season_list += item;
		}
	}
	%>
	var season_list = "<%= season_list %>";

	$(document).ready(function()
	{
		let vimg = '';		
		console.log(season_list);

		var flag = false;
	
		season_ary = season_list.split(",");

		for(i = 0 ; i < season_ary.length; i++)
		{
			season = season_ary[i];		
			
			if($(".sub_list").find("#rm" + season).length > 0)
			{
				continue;
			}
			switch(season)
			{	//계절
				case '봄' :
					vimg = $('<img>', {
					 	'src' : '../image/spring.jpg',
					  	'width' : '130px',
					   	'height' : '100px'
					   	});
	
					var newItem = $(`<div class="menu_itemsub" onclick="removeCart('봄');" id="rm봄">`);
	
					$(newItem).append(vimg);
					$(newItem).html($(newItem).html()+'<div class="mdiv">' + season + '</div>');
					$(newItem).html($(newItem).html()+'<input type="hidden" name="season" value="' + season + '">');
	
					$(".sub_list").append(newItem);
					break;
	
				case '여름' :
					vimg = $('<img>', {
					 	'src' : '../image/summer.jpg',
					  	'width' : '130px',
					   	'height' : '100px'
					   	});
	
					var newItem = $(`<div class="menu_itemsub" onclick="removeCart('여름');" id="rm여름">`);
	
					$(newItem).append(vimg);
					$(newItem).html($(newItem).html()+'<div class="mdiv">' + season + '</div>');
					$(newItem).html($(newItem).html()+'<input type="hidden" name="season" value="' + season + '">');
					$(".sub_list").append(newItem);
					break;
	
				case '가을' :
					vimg = $('<img>', {
					 	'src' : '../image/autumn.jpg',
					  	'width' : '130px',
					   	'height' : '100px'
					   	});
	
					var newItem = $(`<div class="menu_itemsub" onclick="removeCart('가을');" id="rm가을">`);
	
					$(newItem).append(vimg);
					$(newItem).html($(newItem).html()+'<div class="mdiv">' + season + '</div>');
					$(newItem).html($(newItem).html()+'<input type="hidden" name="season" value="' + season + '">');
					$(".sub_list").append(newItem);
					break;
	
				case '겨울' :
					vimg = $('<img>', {
					 	'src' : '../image/winter.jpg',
					  	'width' : '130px',
					   	'height' : '100px'
					   	});
	
					var newItem = $(`<div class="menu_itemsub" onclick="removeCart('겨울');" id="rm겨울">`);
	
					$(newItem).append(vimg);
					$(newItem).html($(newItem).html()+'<div class="mdiv">' + season + '</div>');
					$(newItem).html($(newItem).html()+'<input type="hidden" name="season" value="' + season + '">');
					$(".sub_list").append(newItem);
					break;
			};
		};
	});
	
	//이전페이지에서 받아온 local
	<%
	String   local_list = "";
	if(local != null)
	{
		for(String item : local)
		{
			if(!local_list.equals(""))
			{
				local_list += ",";
			}
			local_list += item;
		}
	}
	%>
	var local_list = "<%= local_list %>";

	$(document).ready(function()
	{
		let vimg = '';		
		console.log(local_list);

		var flag = false;
	
		local_ary = local_list.split(",");

		for(i = 0 ; i < local_ary.length; i++)
		{
			local = local_ary[i];		
			
			if($(".sub_list").find("#rm" + local).length > 0)
			{
				continue;
			}
		switch(local)
		{	//계절
			case '서울경기도' :
				vimg = $('<img>', {
				 	'src' : '../image/경기.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('서울경기도');" id="rm서울경기도">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + local + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + local + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '강원도' :
				vimg = $('<img>', {
				 	'src' : '../image/강원.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('강원도');" id="rm강원도">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + local + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + local + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '충청도' :
				vimg = $('<img>', {
				 	'src' : '../image/충청도.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('충청도');" id="rm충청도">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + local + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + local + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '전북' :
				vimg = $('<img>', {
				 	'src' : '../image/전북.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('전북');" id="rm전북">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + local + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + local + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '전남' :
				vimg = $('<img>', {
				 	'src' : '../image/전남.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('전남');" id="rm전남">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + local + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + local + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '경북' :
				vimg = $('<img>', {
				 	'src' : '../image/경북.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('경북');" id="rm경북">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + local + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + local + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '경남' :
				vimg = $('<img>', {
				 	'src' : '../image/경남.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('경남');" id="rm경남">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + local + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + local + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '제주' :
				vimg = $('<img>', {
				 	'src' : '../image/제주.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('제주');" id="rm제주">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + local + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + local + '">');

				$(".sub_list").append(newItem);
				break;
		}
	}
	});
	
	//이전페이지에서 받아온 human
	<%
	String   human_list = "";
	if(human != null)
	{
		for(String item : human)
		{
			if(!human_list.equals(""))
			{
				human_list += ",";
			}
			human_list += item;
		}
	}
	%>
	var human_list = "<%= human_list %>";

	$(document).ready(function()
	{
		let vimg = '';		
		console.log(human_list);

		var flag = false;
	
		human_ary = human_list.split(",");

		for(i = 0 ; i < human_ary.length; i++)
		{
			human = human_ary[i];		
			
			if($(".sub_list").find("#rm" + human).length > 0)
			{
				continue;
			}
		switch(human)
		{	//가족
			case '가족' :
				vimg = $('<img>', {
				 	'src' : '../image/family.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('가족');" id="rm가족">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + human + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="human" value="' + human + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '연인' :
				vimg = $('<img>', {
				 	'src' : '../image/lover.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('연인');" id="rm연인">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + human + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="human" value="' + human + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '친구' :
				vimg = $('<img>', {
				 	'src' : '../image/friend.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('친구');" id="rm친구">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + human + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="human" value="' + human + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '반려견' :
				vimg = $('<img>', {
				 	'src' : '../image/dog.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('반려견');" id="rm반려견">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + human + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="human" value="' + human + '">');

				$(".sub_list").append(newItem);
				break;
		}
	}
	});
	
	//이전페이지에서 받아온 move
	<%
	String  move_list = "";
	if(move != null)
	{
		for(String item : move)
		{
			if(!move_list.equals(""))
			{
				move_list += ",";
			}
			move_list += item;
		}
	}
	%>
	var move_list = "<%= move_list %>";

	$(document).ready(function()
	{
		let vimg = '';		
		console.log(move_list);

		var flag = false;
	
		move_ary = move_list.split(",");

		for(i = 0 ; i < move_ary.length; i++)
		{
			move = move_ary[i];		
			
			if($(".sub_list").find("#rm" + move).length > 0)
			{
				continue;
			}
		switch(move)
		{	//이동수단
			case '버스' :
				vimg = $('<img>', {
				 	'src' : '../image/bus.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('버스');" id="rm버스">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + move + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="move" value="' + move + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '기차' :
				vimg = $('<img>', {
				 	'src' : '../image/train.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('기차');" id="rm기차">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + move + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="move" value="' + move + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '자가용' :
				vimg = $('<img>', {
				 	'src' : '../image/car.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('자가용');" id="rm자가용">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + move + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="move" value="' + move + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '자전거' :
				vimg = $('<img>', {
				 	'src' : '../image/cycle.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('자전거');" id="rm자전거">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + move + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="move" value="' + move + '">');

				$(".sub_list").append(newItem);
				break;
		}
	}
	});
	
	//이전페이지에서 받아온 schedule
	<%
	String  schedule_list = "";
	if(schedule != null)
	{
		for(String item : schedule)
		{
			if(!schedule_list.equals(""))
			{
				schedule_list += ",";
			}
			schedule_list += item;
		}
	}
	%>
	var schedule_list = "<%=schedule_list %>";

	$(document).ready(function()
	{
		let vimg = '';		
		console.log(schedule_list);

		var flag = false;
	
		schedule_ary = schedule_list.split(",");

		for(i = 0 ; i < schedule_ary.length; i++)
		{
			schedule = schedule_ary[i];		
			
			if($(".sub_list").find("#rm" + schedule).length > 0)
			{
				continue;
			}
		switch(schedule)
		{	//일정
			case '당일' :
				vimg = $('<img>', {
				 	'src' : '../image/당일치기.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('당일');" id="rm당일">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + schedule + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="schedule" value="' + schedule + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '숙박' :
				vimg = $('<img>', {
				 	'src' : '../image/숙박.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('숙박');" id="rm숙박">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + schedule + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="schedule" value="' + schedule + '">');

				$(".sub_list").append(newItem);
				break;
		}
	}
	});
	
	//이전페이지에서 받아온 uinout
	<%
	String  uinout_list = "";
	if(uinout != null)
	{
		for(String item : uinout)
		{
			if(!uinout_list.equals(""))
			{
				uinout_list += ",";
			}
			uinout_list += item;
		}
	}
	%>
	var uinout_list = "<%=uinout_list %>";

	$(document).ready(function()
	{
		let vimg = '';		
		console.log(uinout_list);

		var flag = false;
	
		uinout_ary = uinout_list.split(",");

		for(i = 0 ; i < uinout_ary.length; i++)
		{
			uinout = uinout_ary[i];		
			
			if($(".sub_list").find("#rm" + uinout).length > 0)
			{
				continue;
			}
		switch(uinout)
		{	//장소
			case '실내' :
				vimg = $('<img>', {
				 	'src' : '../image/inside.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('실내');" id="rm실내">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + uinout + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="uinout" value="' + uinout + '">');

				$(".sub_list").append(newItem);
				break;
				
			case '실외' :
				vimg = $('<img>', {
				 	'src' : '../image/outside.jpg',
				  	'width' : '130px',
				   	'height' : '100px'
				   	});

				var newItem = $(`<div class="menu_itemsub" onclick="removeCart('실외');" id="rm실외">`);

				$(newItem).append(vimg);
				$(newItem).html($(newItem).html()+'<div class="mdiv">' + uinout + '</div>');
				$(newItem).html($(newItem).html()+'<input type="hidden" name="uinout" value="' + uinout + '">');

				$(".sub_list").append(newItem);
				break;
				
		
		}
	}
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	var login_season = "";	
	var login_local = "";	
	var login_human = "";	
	var login_move = "";	
	var login_schedule = "";	
	var login_uinout = "";	
		
	<%
	if( login != null)
	{	%>
		login_season = '<%=login.getSeason() %>';  // 회원가입시 추천 계절
		login_local = '<%=login.getLocal() %>';  // 회원가입시 지역
		login_human = '<%=login.getHuman() %>';  // 회원가입시 동행
		login_move = '<%=login.getMove() %>';  // 회원가입시 이동
		login_schedule = '<%=login.getSchedule() %>';  // 회원가입시 일정
		login_uinout = '<%=login.getUinout() %>';  // 회원가입시 장소
<%	} %>
	
	$(document).ready(function()
	{
		let vimg = '';
		console.log(login_season);

		var flag = false;

		if($("#reco_show").find("#rm" + login_season).length > 0)
		{
			return;
		}
		if($("#reco_show").find("#rm" + login_local).length > 0)
		{
			return;
		}
		if($("#reco_show").find("#rm" + login_human).length > 0)
		{
			return;
		}
		if($("#reco_show").find("#rm" + login_move).length > 0)
		{
			return;
		}
		if($("#reco_show").find("#rm" + login_schedule).length > 0)
		{
			return;
		}
		if($("#reco_show").find("#rm" + login_uinout).length > 0)
		{
			return;
		}

		switch(login_season)
		{	//계절
		
		case '봄' :
			vimg = $('<img>', {
			 	'src' : '../image/spring.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});

			var newItem = $(`<div class="menu_item" onclick="addCart('봄');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_season + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '여름' :
			vimg = $('<img>', {
			 	'src' : '../image/summer.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('여름');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_season + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '가을' :
			vimg = $('<img>', {
			 	'src' : '../image/autumn.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('가을');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_season + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '겨울' :
			vimg = $('<img>', {
			 	'src' : '../image/winter.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('겨울');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_season + '</div>');

			$("#reco_show").append(newItem);
			break;
		}
		
		switch(login_local)
		{	//지역
		
		case '서울경기도' :
			vimg = $('<img>', {
			 	'src' : '../image/경기.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});

			var newItem = $(`<div class="menu_item" onclick="addCart('서울경기도');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_local + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '강원도' :
			vimg = $('<img>', {
			 	'src' : '../image/강원.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('강원도');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_local + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '충청도' :
			vimg = $('<img>', {
			 	'src' : '../image/충청도.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('충청도');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_local + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '전북' :
			vimg = $('<img>', {
			 	'src' : '../image/전북.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('전북');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_local + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '전남' :
			vimg = $('<img>', {
			 	'src' : '../image/전남.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('전남');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_local + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '경북' :
			vimg = $('<img>', {
			 	'src' : '../image/경북.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('경북');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_local + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '경남' :
			vimg = $('<img>', {
			 	'src' : '../image/경남.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('경남');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_local + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '제주' :
			vimg = $('<img>', {
			 	'src' : '../image/제주.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('제주');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_local + '</div>');

			$("#reco_show").append(newItem);
			break;
		}
		
		switch(login_human)
		{	//동행
		
		case '가족' :
			vimg = $('<img>', {
			 	'src' : '../image/family.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});

			var newItem = $(`<div class="menu_item" onclick="addCart('가족');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_human + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '연인' :
			vimg = $('<img>', {
			 	'src' : '../image/lover.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('연인');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_human + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '친구' :
			vimg = $('<img>', {
			 	'src' : '../image/friend.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('친구');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_human + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '반려견' :
			vimg = $('<img>', {
			 	'src' : '../image/dog.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('반려견');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_human + '</div>');

			$("#reco_show").append(newItem);
			break;
		}
		
		switch(login_move)
		{	//이동수단
		
		case '버스' :
			vimg = $('<img>', {
			 	'src' : '../image/bus.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});

			var newItem = $(`<div class="menu_item" onclick="addCart('버스');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_move + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '기차' :
			vimg = $('<img>', {
			 	'src' : '../image/train.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('기차');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_move + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '자가용' :
			vimg = $('<img>', {
			 	'src' : '../image/car.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('자가용');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_move + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '자전거' :
			vimg = $('<img>', {
			 	'src' : '../image/cycle.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('자전거');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_move + '</div>');

			$("#reco_show").append(newItem);
			break;
		}
		
		switch(login_schedule)
		{	//일정
		
		case '당일' :
			vimg = $('<img>', {
			 	'src' : '../image/당일치기.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});

			var newItem = $(`<div class="menu_item" onclick="addCart('당일');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_schedule + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '숙박' :
			vimg = $('<img>', {
			 	'src' : '../image/숙박.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('숙박');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_schedule + '</div>');

			$("#reco_show").append(newItem);
			break;
		}
		
		switch(login_uinout)
		{	//장소
		
		case '실내' :
			vimg = $('<img>', {
			 	'src' : '../image/inside.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});

			var newItem = $(`<div class="menu_item" onclick="addCart('실내');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_uinout + '</div>');

			$("#reco_show").append(newItem);
			break;
			
		case '실외' :
			vimg = $('<img>', {
			 	'src' : '../image/outside.jpg',
			  	'width' : '200px',
			   	'height' : '130px'
			   	});
			
			var newItem = $(`<div class="menu_item" onclick="addCart('실외');">`);

			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + login_uinout + '</div>');

			$("#reco_show").append(newItem);
			break;
		}
		
	});
	
	
</script>
	<table border="0" width="100%">
		<tr>
			<td width="15%" rowspan="5" class="ibtn" style="vertical-align:middle;">
				<div>
				<div id="idiv1" class="btnbox" style="background-color:#1abc9b; color:white;" onclick="tablechange('추천');">추천</div>
				<div id="idiv2" class="btnbox" onclick="tablechange('계절');">계절</div>
				<div id="idiv3" class="btnbox" onclick="tablechange('지역');">지역</div>
				<div id="idiv4" class="btnbox" onclick="tablechange('동행');">동행</div>
				<div id="idiv5" class="btnbox" onclick="tablechange('이동');">이동</div>
				<div id="idiv6" class="btnbox" onclick="tablechange('일정');">일정</div>
				<div id="idiv7" class="btnbox" onclick="tablechange('장소');">장소</div>
				</div>
			</td>
			<td colspan="4" align="center" width="80%" height="120px">
				<table border="0" width="1500px" height="200px">
					<tr border="0">
						<td style="width:50px"><div class="btn"><button type="button" id="prev" style="width: 35px;">◀️</button></div>
						</td>
						<td style="text-align:center;">
							<section style="height: 100px;">
							<ul class="slider">
							<%  
							for(adminboardVO vo : alist)
							{								
								%>
								<li id="divSlide">
									<div style="background-image: url(../upload/<%= vo.getPname() %>);  width: 1400px; height: 200px; ">  
										<dl class="right">
											<dt></dt>
											<dd></dd>
										</dl>
									</div>
								</li>	
								<%
							}
							%>
						</ul>
						</section>
						</td>
						<td style="width:50px"><div class="btn"><button type="button" id="next" style="width: 35px;">▶️</button></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="300px" style="vertical-align:top;">
			<td width="150px" align="center" height="100%" colspan="3" >
				<section id="reco_show">
					
				</section>
			<section id="season_show">
				<div class="menu_item" onclick="addCart('봄');">
					<img src="../image/spring.jpg" width="200px" height="130px"><br>
					<div class="mdiv">봄</div>
				</div>
				<div class="menu_item" onclick="addCart('여름');">
					<img src="../image/summer.jpg" width="200px" height="130px"><br>
					<div class="mdiv">여름</div>
				</div>
				<div class="menu_item" onclick="addCart('가을');">
					<img src="../image/autumn.jpg" width="200px" height="130px"><br>
					<div class="mdiv">가을</div>
				</div>
				<div class="menu_item" onclick="addCart('겨울');">
					<img src="../image/winter.jpg" width="200px" height="130px"><br>
					<div class="mdiv">겨울</div>
				</div>
			</section>
			<section id="local_show">
					<div class="menu_item" onclick="addCart('서울경기도');">
						<img src="../image/경기.jpg" width="200px" height="130px">
						<div class="mdiv">서울,경기도</div>
					</div>
					<div class="menu_item" onclick="addCart('강원도');">
						<img src="../image/강원.jpg" width="200px" height="130px">
						<div class="mdiv">강원도</div>
					</div>
					<div class="menu_item" onclick="addCart('충청도');">
						<img src="../image/충청도.jpg" width="200px" height="130px">
						<div class="mdiv">충청도</div>
					</div>
					<div class="menu_item" onclick="addCart('전북');">
						<img src="../image/전북.jpg" width="200px" height="130px">
						<div class="mdiv">전라북도</div>
					</div>
					<div class="menu_item" onclick="addCart('전남');">
						<img src="../image/전남.jpg" width="200px" height="130px">
						<div class="mdiv">전라남도</div>
					</div>
					<div class="menu_item" onclick="addCart('경북');">
						<img src="../image/경북.jpg" width="200px" height="130px">
						<div class="mdiv">경상북도</div>
					</div>
					<div class="menu_item" onclick="addCart('경남');">
						<img src="../image/경남.jpg" width="200px" height="130px">
						<div class="mdiv">경상남도</div>
					</div>
					<div class="menu_item" onclick="addCart('제주');">
						<img src="../image/제주.jpg" width="200px" height="130px">
						<div class="mdiv">제주도</div>
					</div>
				</section>
				<section id="human_show">
					<div class="menu_item" onclick="addCart('가족');">
						<img src="../image/family.jpg" width="200px" height="130px">
						<div class="mdiv">가족</div>
					</div>
					<div class="menu_item" onclick="addCart('연인');">
						<img src="../image/lover.jpg" width="200px" height="130px">
						<div class="mdiv">연인</div>
					</div>
					<div class="menu_item" onclick="addCart('친구');">
						<img src="../image/friend.jpg" width="200px" height="130px">
						<div class="mdiv">친구</div>
					</div>
					<div class="menu_item" onclick="addCart('반려견');">
						<img src="../image/dog.jpg" width="200px" height="130px">
						<div class="mdiv">반려견</div>
					</div>
				</section>
				<section id="move_show">
					<div class="menu_item" onclick="addCart('버스');">
						<img src="../image/bus.jpg" width="200px" height="130px">
						<div class="mdiv">버스</div>
					</div>
					<div class="menu_item" onclick="addCart('기차');">
						<img src="../image/train.jpg" width="200px" height="130px">
						<div class="mdiv">기차</div>
					</div>
					<div class="menu_item" onclick="addCart('자가용');">
						<img src="../image/car.jpg" width="200px" height="130px">
						<div class="mdiv">자가용</div>
					</div>
					<div class="menu_item" onclick="addCart('자전거');">
						<img src="../image/cycle.jpg" width="200px" height="130px">
						<div class="mdiv">자전거</div>
					</div>
				</section>
				<section id="schedule_show">
				<div class="menu_item" onclick="addCart('당일');">
					<img src="../image/당일치기.jpg" width="200px" height="130px">
					<div class="mdiv">당일</div>
				</div>
				<div class="menu_item" onclick="addCart('숙박');">
					<img src="../image/숙박.jpg" width="200px" height="130px">
					<div class="mdiv">숙박</div>
				</div>
				</section>
				<section id="inout_show">
					<div class="menu_item" onclick="addCart('실내');">
						<img src="../image/inside.jpg" width="200px" height="130px">
						<div class="mdiv">실내</div>
					</div>
					<div class="menu_item" onclick="addCart('실외');">
						<img src="../image/outside.jpg" width="200px" height="130px">
						<div class="mdiv">실외</div>
					</div>
				</section>
			</td>
		</tr>
		<tr height="130px">
			<td colspan="4">
			<form id="search" name="search" method="get" action="../board/search.jsp">
				<table class="line" width="1500px" height="170px">
					<tr>
						<td>
							<!-- 클릭했을때 추가되는 부분 -->
							<section class="sub_list">
							</section>
						</td>
						<td align="right" style="vertical-align:center;">
							<input type="submit" class="sbtn" value="검색">&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</table>
			</form>
			</td>
		</tr>
	</table>
	</body>
</html>