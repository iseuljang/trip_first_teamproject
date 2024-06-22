<%@ page language="java" contentType="image/jpeg; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="nl.captcha.Captcha" %>
<%@page import="nl.captcha.Captcha.Builder" %>
<%@page import="nl.captcha.backgrounds.FlatColorBackgroundProducer" %>
<%@page import="java.awt.Color" %>
<%
//자동등록방지 코드를 이미지로 출력한다.
Captcha mCaptcha;
Builder mBuilder;
String  mAnswer;
// 만들어질 이미지의 가로, 세로 크기
mBuilder= new Captcha.Builder(160, 50);
mBuilder.addText();
// 이미지 뒤의 배경색
mBuilder.addBackground(new FlatColorBackgroundProducer(Color.WHITE));
mBuilder.addBorder();
// 이미지 중간에 선 같은게 그어져있는거 만드는거
mBuilder.addNoise();
mCaptcha = mBuilder.build();
// 만들어진 글자 데이터를 mAnswer에 텍스트로 넣음
mAnswer = mCaptcha.getAnswer();

OutputStream mOut = response.getOutputStream();
ImageIO.write(mCaptcha.getImage(),"jpg", mOut);
mOut.close();
//세션에 정답 기록
request.getSession().setAttribute("sign",mAnswer);
%>

   