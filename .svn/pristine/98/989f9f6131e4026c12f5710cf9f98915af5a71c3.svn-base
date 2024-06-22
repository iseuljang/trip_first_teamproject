<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>채팅방</title>
	</head>
	<script src="../js/jquery-3.7.1.js"></script>
	<script>
		window.onload = function()
		{
			$("#btnSend").click(function()
			{
				SendMsg();
			});
			
			//1초 간격으로 실행하기
			setInterval(function() 
			{ 
				GetMsg();
			}, 1000);
			
			GetMsg();
		}
		
		var last_cno = "0";  //마지막으로 받은 메시지 번호 
		function GetMsg()
		{
			$.ajax({
				type : "get",
				url: "getmsg.jsp?cno=" + last_cno,
				dataType: "xml",
				success : function(data) 
				{
					// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
					$(data).find("msg").each(function(){			
						var cno    = $(this).find("no").text();
						var uname  = $(this).find("name").text();
						var cnote  = $(this).find("note").text();
						var cwdate = $(this).find("wdate").text();
						var html = "";	
						
						var org_html = $("#chatMsg").html();
						org_html = org_html + "<br>\n[" + uname + "] "+ cnote;
						$("#chatMsg").html(org_html);
						
						last_cno = cno;					
					});
				}
			});				
		}
		
		function SendMsg()
		{
			if($("#msg").val() == "")
			{
				alert("발송 할 메시지를 입력하세요.");
				$("#msg").focus();
				return false;
			}	
			
			$.ajax({
				type : "post",
				url: "sendmsg.jsp",
				data: 
				{
					msg : $("#msg").val()
				},
				dataType: "html",
				success : function(data) 
				{
					$("#msg").val("");
					$("#msg").focus();
					
					GetMsg();
				}
			});	
			
			return false;				
		}		
		</script>
	
	
	<style>
		p
		{
			position: absolute;
			bottom: 0px;
			right: 0px;
		}
		#p1
		{
			position: absolute;
			bottom: 0px;
			right: 0px;
		}
		#div1
		{
			background-color: black;
			color: white;
			text-align: center;
			height: 50px;
			position: absolute;
			right: 0px;
			left: 0px;
			top: 0px;
			font-size: 40px;
		}
		#div2
		{
			background-color: lightgray;
			color: white;
			height: 50px;
			position: absolute;
			bottom: 0px;
			right: 0px;
			left: 0px;
		}
		#div3
		{
			background-color: white;
			position: absolute;
			bottom: 50px;
			top: 50px;
			right: 0px;
			left: 0px;
			
		}
		#div4
		{
			text-align: center;
			position: absolute;
			bottom: 0px;
			right: 0px;
			left: 0px;
		}
		#div5
		{
			position: absolute;
			bottom: 0px;
			right: 0px;
			font-size:40px;
		}
		#input1
		{
			width: 400px;
			height: 20px;
		}
	</style>
	<script>
		function submit()
		{
			$("#div3").html(`<div id="div5">\${$("#input1").val()}</div><br>`);
			
		}
	</script>
	<body>
		<div id="div1">정보공유방</div>
		<div id="div3">
			<div id="div4">정보공유방에 입장하였습니다.</div>
		</div>
		<div id="div2"><p id="p1"><input id="input1" type="text"><button type="button" onclick="submit();">전송하기</button></p></div>
	</body>
</html>