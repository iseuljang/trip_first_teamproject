<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../include/head.jsp" %>
	<script>
$(document).ready(function()
{
	$("#attach1").focus();
	
	$("#attach1").keyup(function(event){
		if(event.keyCode == 13)
		{
			AddReply();	
		}
	});
	
	$("#serch1-1")
	.mouseover(function()
	{
		$("#serch1-1").hide();
		$("#serch1-1").attr("style", "background-image: url('../image/봄1.jpg')");
		$("#serch1-1").show();
	})
	.mouseout(function()
	{
		$("#serch1-1").hide();
		$("#serch1-1").attr("style", "background-image: url('../image/봄.jpg')");
		$("#serch1-1").show();
	})
	.click(function(){
		document.location = "../firstmain/main.jsp?season=봄";
	});	
	
	$("#serch1-2")
	.mouseover(function()
	{
		$("#serch1-2").hide();
		$("#serch1-2").attr("style", "background-image: url('../image/여름1.jpg')");
		$("#serch1-2").show();
	})
	.mouseout(function()
	{
		$("#serch1-2").hide();
		$("#serch1-2").attr("style", "background-image: url('../image/여름.jpg')");
		$("#serch1-2").show();
	})
	.click(function(){
		document.location = "../firstmain/main.jsp?season=여름";
	});	
	
	$("#serch1-3")
	.mouseover(function()
	{
		$("#serch1-3").hide();
		$("#serch1-3").attr("style", "background-image: url('../image/가을1.jpg')");
		$("#serch1-3").show();
	})
	.mouseout(function()
	{
		$("#serch1-3").hide();
		$("#serch1-3").attr("style", "background-image: url('../image/가을.jpg')");
		$("#serch1-3").show();
	})
	.click(function(){
		document.location = "../firstmain/main.jsp?season=가을";
	});	
	
	$("#serch1-4")
	.mouseover(function()
	{
		$("#serch1-4").hide();
		$("#serch1-4").attr("style", "background-image: url('../image/겨울1.jpg')");
		$("#serch1-4").show();
	})
	.mouseout(function()
	{
		$("#serch1-4").hide();
		$("#serch1-4").attr("style", "background-image: url('../image/겨울.jpg')");
		$("#serch1-4").show();
	})
	.click(function(){
		document.location = "../firstmain/main.jsp?season=겨울";
	});	
});

function AddReply()
{
	if($("#attach1").val() == "")
	{
		alert("검색어를 입력하세요.");
		$("#attach1").focus();
		return false;
	}
	else
	{
		document.location = "../board/index.jsp?type=T&keyword=" + $("#attach1").val();
		return true;
	}

}

function showPopup() 
{ 
	
	if(confirm("공개 채팅방에 참여하시겠습니까?") == true)
	{
		window.open("chat.jsp", "채팅방", "resizeable").resizeTo(800, 600);
		return;
	}
}
function showPopup1() 
{ 
	alert("로그인시 참여가능합니다.")
	return;
}

function write()
{
	$(".write").css("display","none")
	
}

</script>

	<div id= "memberchange" name = "memberchange">
		<div class="intro_bg">
			<div class="title"></div>
		</div>
	</div>
	<table >
		<tr>
		<td class="attach"></td>
		<%  // 검색된 
		String searchKeys = "";
		%>
		<td><input type="text"  id="attach1" class="attach1" placeholder="검색어를 입력해주세요" value="<%= searchKeys %>"></td><!--  검색어 -->
	</table>
	<table style="margin-top:15px">
	<tr>
		<td>
			<a href="../board/index.jsp"><div class="attach3" style="">전체검색</div></a>
		</td>
		<td>
		<%
			if(login != null )
			{
				%>
				<a href="../board/write.jsp"><div class="attach2">글쓰기</div></a>
			 	<%
			 }else
			 {
				%>
				<a class="write" href="javascript:write();"></a>
			 	<%				 
			 }
			 %>	
		</td><!-- 글쓰기 -->
	</tr>
	</table>
	<table style="margin-top:20px">
		<tr>
		<%
			if(login != null )
			{
				%>
				<td rowspan="3" width="430px" height="430" style="cursor:pointer"><div class="serch" onclick="showPopup();"></div></td> <!-- 채팅방 -->
			 	<%
			 }else
			 {
				%>
				<td rowspan="3" width="430px" height="430"><div class="serch" onclick="showPopup1();"></div></td> <!-- 채팅방 -->
			 	<%				 
			 }
			 %>	
		
			
			<td width="15px" height="15px"><div class="serch2"></div></td>
			<td width="320px" height="210"><div id="serch1-1" class="serch1-1"></div></td><!-- 봄 -->
			<td width="15px"> <div class="serch2"></div></td>
			<td width="320px" height="210"><div id="serch1-2" class="serch1-2"></div></td><!-- 여름 -->
		</tr>
		<tr>
			<td width="15px" height="15px"><div class="serch2"></div></td>
			<td width="15px" height="15px"><div class="serch2"></div></td>
			<td width="15px" height="15px"><div class="serch2"></div></td>
			<td width="15px" height="15px"><div class="serch2"></div></td>
		</tr>
		<tr>
			<td width="15px" height="15px"><div class="serch2"></div></td>
			<td width="320px" height="210"><div id="serch1-3" class="serch1-3"></div></td><!-- 가을 -->
			<td width="15px" height="15px"><div class="serch2"></div></td>
			<td width="320px" height="210"><div id="serch1-4" class="serch1-4"></div></td><!-- 겨울 -->
		</tr>
	</table>
</body>
</html>