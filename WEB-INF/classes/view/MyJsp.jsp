<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Chat</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="chat.css">


  </head>
  
  <body>
			<div id="top"></div>
	<div id="bottom">
		<div id="right">
			<div class="message_room">
				<div class="name_around">
					<div class="name_right">危娜</div>
					<div class="time">16:21</div>
				</div>
				<div class="face_right"></div><div class="weiba_right"></div><div class="bubble_right">窗前明月光，疑是地上霜。举头望明月，低头思故乡。</div>
			</div>
			<div class="message_room">
				<div class="name_around">
					<div class="name_left">刘胜利</div>
				</div>
				<div class="face_left"></div><div class="weiba_left"></div><div class="bubble_left">窗前明月光，疑是地上霜。举头望明月，低头思故乡。</div>
			</div>
		</div>
		<div id="left">
			<h3>在线</h3>
			<div class="users">
				<div id="weina"></div>危娜
			</div>
			<div class="users">
				<div class="wawa"></div>刘胜利
			</div>
			<div class="users">
				<div class="waixingren"></div>???
			</div>
		</div>
		<div id="input">
				<input type="text" name="message" id="message"><img src="" id="send">
				<img src="./img/send.png" id="send">
		</div>
	</div>
  </body>
</html>
