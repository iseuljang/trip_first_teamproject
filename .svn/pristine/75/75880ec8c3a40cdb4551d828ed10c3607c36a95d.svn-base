<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %> 
<%
//--------------------- 접근제어 ------------------
// 비로그인 상태일시 
if( login == null)
{
	%>
	<script>
	$(document).ready(function(){
		
		alert("로그인을 먼저 하십시오.");
		document.location = "../user/login.jsp"
		return;
	});
	</script>
	<%
	return;
}


%>
<script>
// ------------------ 다음페이지 버튼 ----------------------
function Next()
{
	//console.log($("input[name='ureason']:checked").val());
	
	$("#name").focus();

	// 사용자가 입력한 비밀번호 값 유효성 확인
	if($("#upw").val() == "")
	{
		alert("비밀번호를 입력하세요.");
		$("#upw").focus();
		return;
	}
	
	// 사용자가 입력한 비밀번호 값 유효성 확인
	if($("#upw").val() === null)
	{
		alert("null입니다.");
		$("#upw").focus();
		return;
	}
	
	// 사유항목 체크 여부 확인
	if($("input[name='ureason']:checked").val() == null || $("input[name='ureason']:checked").val() == "")
	{
		alert("사유 항목을 선택해주세요.");
		$(".ureason").focus();
		return;
	}
	
	if(confirm("탈퇴하시겠습니까?") == true)
	{
		$("#retire").submit();
		return;
	}
}
</script>
	<form method="post" name="retire" id="retire" action="retireok.jsp" >   
		<table border="0" width="100%">
			<tr>
				<td width="35%">&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td height="80px">
					<h1 style="font-size : 50px; margin-right : 150px;">정말 여행추천가이드를 떠나실 건가요?</h1>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td></td>
				<td height="60px" style="font-size:24px;">
					계정을 삭제하시려는 사유 항목을 체크해주세요.<br>
					더 나은 서비스 개선을 위해 최선을 다하겠습니다.<br>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td></td>
				<td style="font-size:22px;">
						<input type="radio" name="ureason" class="ureason" checked value="1:개인정보 관련 문제"> 개인정보 관련 문제<br>
						<input type="radio" name="ureason" class="ureason" value="2:다른 계정을 만들었음" > 다른 계정을 만들었음<br>
						<input type="radio" name="ureason" class="ureason" value="3:삭제하고 싶은 내용이 있음"> 삭제하고 싶은 내용이 있음<br>
						<input type="radio" name="ureason" class="ureason" value="4:검색하는데 문제가 있음"> 검색하는데 문제가 있음<br>
						<input type="radio" name="ureason" class="ureason" value="5:기타"> 기타<br>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td></td>
				<td height="80px" colspan="2" style="font-size:20px;">
					사용중인 비밀번호를 입력해주세요<br>
					<input type="password" name="upw" id="upw" class="upw" size="40">&nbsp;&nbsp;&nbsp;
					<input type="button" value="회원탈퇴" class="rbtn" onclick="Next()"><br>
					<span style="color:gray; font-size:15px;">비밀번호를 잊으셨나요?</span>
					&nbsp;&nbsp;&nbsp;
					<a href="../idsearch/pwsearch1.jsp">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td></td>
				<td height="60px">
				</td>
				<td></td>
			</tr>
		</table>
	</form>
	</body>
</html>