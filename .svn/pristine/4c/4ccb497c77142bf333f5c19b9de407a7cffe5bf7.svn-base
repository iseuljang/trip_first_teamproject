<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>
		<link rel="stylesheet" type="text/css" href="../css/pwsearch1.css">
		<script>
		$(document).ready(function()
		{
			$("#attach1").focus();
			
			$("#attach1").keyup(function(event){
				if(event.keyCode == 13)
				{
					search();	
				}
			});
			
			$("#attach2").click(function(event){
				
					search();	
				
			});
		});	
		
		// --------------- 다음 페이지 버튼 ----------------
		function next()
		{
			if($("#attach1").val() == "")
			{
				alert("아이디를 입력하세요.");
				$("#attach1").focus();
				return;
			}else
			{
				$("#pwsearch").submit();
				return;
			}
		}
		</script>s
	</head>
	<body>
		<div id= "memberchange" name = "memberchange">
			<div class="intro_bg">
				<div class="header"></div>
			</div>
		</div>
		<div class="hline1"></div>		
		<div class="str">
			비밀번호를 찾고자 하는<br>
			아이디를 입력해주세요
		</div>
		<form id="pwsearch" name="pwsearch" method="post" action="pwsearch2.jsp">
			<table border="0">
				<tr>
					<td class="attach"></td>
					<td><input type="text" id="attach1" class="attach1" name= "id" placeholder="아이디를 입력해주세요"></td>
				</tr>
			</table>
		</form>
		<div id="attach2" class="attach2" onclick="next();">다 음</div>
		<p class="str1">아이디가 기억나지 않는다면 ?<a href="idsearch.jsp" ><em style="color:blue; cursor: pointer;">아이디 찾기</em></a>
	</body>
</html>