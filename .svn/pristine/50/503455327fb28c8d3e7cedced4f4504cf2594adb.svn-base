<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../include/head.jsp" %>
<script>
	window.onload = function()
	{
		$("#msg").keyup(function(event){
			if(event.keyCode == 13)
			{
				DoSendmsg();
			}
		});
		
		//1초 간격으로(자동갱신역할) 
		setInterval(function() 
		{ 
			//채팅방 내용 가져오기
			GetMsg();
		}, 1000);
	};
	
	
	//채팅 메세지 보내기 클릭 
	function DoSendmsg()
	{
		if($("#msg").val() == "")
		{
			alert("발송 할 메시지를 입력하세요.");
			$("#msg").focus();
			return false;
		}	
		
		//#btnSend(보내기) 클릭시 본인채팅내용 저장과 동시에 본인이 전송한 채팅내용이 채팅방에 뜬다
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
				data = data.trim();
				$("#talk").append(data);
				$("#msg").val("");
				$("#msg").focus();
			}
		});	
	};
	
	//채팅방 내용 가져오기 
	function GetMsg()
	{
		$.ajax({
			type : "post",
			url: "getmsg.jsp",
			dataType: "html",
			success : function(data) 
			{
				data = data.trim();
				$("#talk").html("");
				$("#talk").append(data);
				
			}
		});	
	};
</script>
<style>
	#chatMsg
	{
		width: 700px;
		height: 300px;
		background-color: #f4f4f4;
		overflow: auto;
	}
</style>		
	<body>
		<form id="chat" name="chat" method="post" onsubmit="return false">
			<table border="1" width="700px">
				<tr>
					<td id="talk">
						<div id="chatMsg" style="height:40px;">채팅방에 입장하였습니다.</div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="msg" name="msg" size="80%" placeholder="메세지를 입력하세요">
						<input type="button" id="btnSend" value="보내기" onclick="DoSendmsg();">
					</td>
				</tr>
			</table>		
		</form>
	</body>
</html>