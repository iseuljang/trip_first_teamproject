<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trip.vo.*" %>
<%@ page import="trip.dao.*" %>    
<%@ page import="trip.dto.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>  
<%
// 첨부파일 저장경로
String uploadPath = "D:\\BTEAM\\trip\\src\\main\\webapp\\upload";

//로그인 여부를 세션을 통해 검사한다
userVO login  = (userVO)session.getAttribute("login");
%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>여행추천가이드</title>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="../css/lobby.css">
		<link rel="stylesheet" href="../css/trip.css"/>
	<script src="../js/jquery-3.7.1.js"></script>
	<script>
		window.onload = function()
		{
			$(".header1").click(function()
			{
				document.location = "../firstmain/lobby.jsp";
			});
			
			$(".login")
			.click(function()
			{
				if($("#log_info").is(":visible"))
				{
					$("#log_info").css("display","none");
				}else
				{
					$("#log_info").toggle();
				}
			});
			
			$("#log_info").mouseleave(function()
			{	
				$(this).toggle();
			})	
			
			$("#log_login")
			.mouseover(function()
			{
				$(this).css("background-color", "lightgray");
			})
			.mouseout(function()
			{
				$(this).css("background-color", "");
			})
			.click(function()
			{
				document.location = "../user/login.jsp";
			});	
			
			$("#log_join")
			.mouseover(function()
			{
				$(this).css("background-color", "lightgray");
			})
			.mouseout(function()
			{
				$(this).css("background-color", "");
			})
			.click(function()
			{
				document.location = "../user/join.jsp";
			});	
				
			$("#log_modify")
			.mouseover(function()
			{
				$(this).css("background-color", "lightgray");
			})
			.mouseout(function()
			{
				$(this).css("background-color", "");
			})
			.click(function()
			{
				document.location = "../master/user_info.jsp";
			});	
				
			$("#log_write")
			.mouseover(function()
			{
				$(this).css("background-color", "lightgray");
			})
			.mouseout(function()
			{
				$(this).css("background-color", "");
			}).click(function()
			{
				document.location = "../board/write.jsp";
			});		
			
			$("#log_admin")
			.mouseover(function()
			{
				$(this).css("background-color", "lightgray");
			})
			.mouseout(function()
			{
				$(this).css("background-color", "");
			}).click(function()
			{
				document.location = "../master/masterGonggiwrite.jsp";
			});	
				
			$("#log_logout")
			.mouseover(function()
			{
				$(this).css("background-color", "lightgray");
			})
			.mouseout(function()
			{
				$(this).css("background-color", "");
			}).click(function()
			{
				document.location = "../user/logout.jsp";
			});
			$("#log_book")
			.mouseover(function()
			{
				$(this).css("background-color", "lightgray");
			})
			.mouseout(function()
			{
				$(this).css("background-color", "");
			}).click(function()
			{
				document.location = "../user/bookmark.jsp";
			});
		}
	</script>
	<style>
		.header1
		{
			cursor:pointer; cursor:hand;
		}	
	
		#log_info
		{
			position: absolute;
			background-color: white;
			display: none;
			top: 67px;
			left: 1610px;
			z-index: 1;
			overflow: hidden; 
		}
		
		#log_table
		{	
			border-top: none;
			border-bottom: none;
			background-color: ghostwhite;
  			border-style: hidden;
			border-radius : 10px;
			
		}
		
		.log_td
		{	
			text-align: center;
			width: 200px;
			height: 50px;
			cursor:pointer; cursor:hand;
		}
		
		#log_logout
		{
			border-bottom-left-radius : 10px;
			border-bottom-right-radius : 10px;
		}
		
		#log_login
		{
			border-top-left-radius : 10px;
			border-top-right-radius : 10px;
		}
	</style>
	</head>
	<body>
		<%
			if(login == null)
			{
				%>
					<table>
						<tr>
						<td><div class="header1"></div></td>
						<td><div class="login">≡ 로그인</div></td>
						</tr>	
					</table>
					<div class="hline"></div>
					<div id="log_info">
						<table border="1" id="log_table">
							<tr>
								<td class="log_td" id="log_login">로그인</td>
							</tr>
							<tr>
								<td class="log_td" id="log_join">회원가입</td>
							</tr>
						</table>
					</div>
				<%
			}else if(login.getAdmin().equals("Y"))
			{ 
				%>
					<table>
						<tr>
						<td><div class="header1"></div></td>
						<td><div class="login">≡ 
						
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
							<span style="font-size:30px"><%= icon %></span>
						
						
						<%= login.getUname() %> </div></td>
						</tr>	
					</table>
					<div class="hline"></div>
					<div id="log_info">
						<table border="1" id="log_table">
							<tr>
								<td class="log_td" id="log_modify">내 정보 수정</td>
							</tr>
							<tr>
								<td class="log_td" id="log_book">북마크 보기</td>
							</tr>
							<tr>
								<td class="log_td" id="log_admin">관리자 페이지</td>
							</tr>
							<tr>
								<td class="log_td" id="log_logout">로그아웃</td>
							</tr>
						</table>
					</div>
				<%
				}else
				{
				%>
					<table>
						<tr>
						<td><div class="header1"></div></td>
						<td><div class="login">≡ 
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
							<span style="font-size:30px"><%= icon %></span>
						
						<%= login.getUname() %></div></td>
						</tr>	
					</table>
					<div class="hline"></div>
					<div id="log_info">
						<table border="1" id="log_table">
							<tr>
								<td class="log_td" id="log_modify">내 정보 수정</td>
							</tr>
							<tr>
								<td class="log_td" id="log_book">북마크 보기</td>
							</tr>
							<tr>
								<td class="log_td" id="log_write" onclick="book();">글쓰기</td>
							</tr>
							<tr>
								<td class="log_td" id="log_logout">로그아웃</td>
							</tr>
						</table>
					</div>
				<%
				}
			%>
