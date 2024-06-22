$(document).ready(function(){
	$("#season_show").css("display","none"); 
	$("#local_show").css("display","none"); 
	$("#human_show").css("display","none"); 
	$("#move_show").css("display","none"); 
	$("#schedule_show").css("display","none"); 
	$("#inout_show").css("display","none");
});
	
function addCart(menu)
{
    let vimg = '';
    console.log(menu);
    
    // 이미 추가되었을 경우 return 시킴
    if($(".sub_list").find("#rm" + menu).length > 0)
    {
    	return;
    }
    
    
	switch(menu)
	{	//계절
		case '봄' : 
			//클릭시 이미지추가하고 사이즈 지정하기 위해 Ajax사용
			vimg = $('<img>', { 
             	'src' : '../image/spring.jpg',
              	'width' : '130px',
               	'height' : '100px'
               	});
			//카트에 추가된 메뉴 클릭시 삭제하기 위해 removeCart('메뉴') 함수 사용.
			var newItem = $(`<div class="menu_itemsub" onclick="removeCart('봄');" id="rm봄">`);
			
			$(newItem).append(vimg);
			//메뉴 이름 출력 부분
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			//search form의 데이터를 넘기기 위해 hidden 으로 값을 넘김
			$(newItem).html($(newItem).html()+'<input type="hidden" name="season" value="' + menu + '">');
			
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="season" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="season" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="season" value="' + menu + '">');
			$(".sub_list").append(newItem);
			break; 
		//지역
		case '서울경기도' : 
			vimg = $('<img>', { 
             	'src' : '../image/경기.jpg',
              	'width' : '130px',
               	'height' : '100px'
               	});
			
			var newItem = $(`<div class="menu_itemsub" onclick="removeCart('서울경기도');" id="rm서울경기도">`);
			
			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="local" value="' + menu + '">');
			$(".sub_list").append(newItem);
			break;    
		
		//동행
		case '가족' : 
			vimg = $('<img>', { 
             	'src' : '../image/family.jpg',
              	'width' : '130px',
               	'height' : '100px'
               	});
			
			var newItem = $(`<div class="menu_itemsub" onclick="removeCart('가족');" id="rm가족">`);
			
			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="human" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="human" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="human" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="human" value="' + menu + '">');
			$(".sub_list").append(newItem);
			break;  
		//이동수단
		case '버스' : 
			vimg = $('<img>', { 
             	'src' : '../image/bus.jpg',
              	'width' : '130px',
               	'height' : '100px'
               	});
			
			var newItem = $(`<div class="menu_itemsub" onclick="removeCart('버스');" id="rm버스">`);
			
			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="move" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="move" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="move" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="move" value="' + menu + '">');
			$(".sub_list").append(newItem);
			break;    
		//일정
		case '당일' : 
			vimg = $('<img>', { 
             	'src' : '../image/당일치기.jpg',
              	'width' : '130px',
               	'height' : '100px'
               	});
			
			var newItem = $(`<div class="menu_itemsub" onclick="removeCart('당일');" id="rm당일">`);
			
			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="schedule" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="schedule" value="' + menu + '">');
			$(".sub_list").append(newItem);
			break;  
		//장소
		case '실내' : 
			vimg = $('<img>', { 
             	'src' : '../image/inside.jpg',
              	'width' : '130px',
               	'height' : '100px'
               	});
			
			var newItem = $(`<div class="menu_itemsub" onclick="removeCart('실내');" id="rm실내">`);
			
			$(newItem).append(vimg);
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="uinout" value="' + menu + '">');
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
			$(newItem).html($(newItem).html()+'<div class="mdiv">' + menu + '</div>');
			$(newItem).html($(newItem).html()+'<input type="hidden" name="uinout" value="' + menu + '">');
			$(".sub_list").append(newItem);
			break; 
	}	
	
}
//카트 안의 메뉴 클릭하여 삭제
function removeCart(menu)
{
	$("#rm" + menu).remove();
}


function tablechange(main)
{
	let vimg = '';
	
	$(".btnbox").css("background-color","#d9d9d9");
	$(".btnbox").css("color","black");
	switch(main)
	{
		case '추천' : $("#reco_show").css("display",""); 
		$("#season_show").css("display","none"); 
		$("#local_show").css("display","none"); 
		$("#human_show").css("display","none"); 
		$("#move_show").css("display","none"); 
		$("#schedule_show").css("display","none"); 
		$("#inout_show").css("display","none");
		$("#idiv1").css("background-color","#1abc9b");
		$("#idiv1").css("color","white");
		break;
		case '계절' : $("#season_show").css("display",""); 
		$("#reco_show").css("display","none")
		$("#local_show").css("display","none"); 
		$("#human_show").css("display","none"); 
		$("#move_show").css("display","none"); 
		$("#schedule_show").css("display","none"); 
		$("#inout_show").css("display","none"); 
		$("#idiv2").css("background-color","#1abc9b");
		$("#idiv2").css("color","white");
		break;
		case '지역' : $("#local_show").css("display",""); 
		$("#reco_show").css("display","none")
		$("#season_show").css("display","none"); 
		$("#human_show").css("display","none"); 
		$("#move_show").css("display","none"); 
		$("#schedule_show").css("display","none"); 
		$("#inout_show").css("display","none"); 
		$("#idiv3").css("background-color","#1abc9b");
		$("#idiv3").css("color","white");
		break;
		case '동행' : $("#human_show").css("display",""); 
		$("#reco_show").css("display","none")
		$("#season_show").css("display","none"); 
		$("#local_show").css("display","none"); 
		$("#move_show").css("display","none"); 
		$("#schedule_show").css("display","none"); 
		$("#inout_show").css("display","none"); 
		$("#idiv4").css("background-color","#1abc9b");
		$("#idiv4").css("color","white");
		break;
		case '이동' : $("#move_show").css("display",""); 
		$("#reco_show").css("display","none")
		$("#season_show").css("display","none"); 
		$("#local_show").css("display","none"); 
		$("#human_show").css("display","none"); 
		$("#schedule_show").css("display","none"); 
		$("#inout_show").css("display","none"); 
		$("#idiv5").css("background-color","#1abc9b");
		$("#idiv5").css("color","white");
		break;
		case '일정' : $("#schedule_show").css("display",""); 
		$("#reco_show").css("display","none")
		$("#season_show").css("display","none"); 
		$("#move_show").css("display","none"); 
		$("#move_show").css("display","none"); 
		$("#move_show").css("display","none"); 
		$("#inout_show").css("display","none");
		$("#idiv6").css("background-color","#1abc9b");
		$("#idiv6").css("color","white");
		break;
		case '장소' : $("#inout_show").css("display",""); 
		$("#reco_show").css("display","none")
		$("#season_show").css("display","none"); 
		$("#local_show").css("display","none"); 
		$("#human_show").css("display","none"); 
		$("#move_show").css("display","none"); 
		$("#schedule_show").css("display","none"); 
		$("#idiv7").css("background-color","#1abc9b");
		$("#idiv7").css("color","white");
		break;
	}
}