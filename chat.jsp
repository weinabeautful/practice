<%@ page language="java" import="java.util.*" import="model.users" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta chatset="utf-8">
    <title>Chat</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="chat.css">

  </head>
  
  <body onbeforeunload="closesession();">
		     <div id="top"></div>
	<div id="bottom">
		<div id="right">
			<div class="message_room">
				<div class="name_around">
					<div class="name_right">危娜</div>
					<div class="time">16:21</div>
				</div>
				<div class="facenv_right"></div><div class="weiba_right"></div><div class="bubble_right">窗前明月光，疑是地上霜。举头望明月，低头思故乡。</div>
			</div>
			<div class="message_room">
				<div class="name_around">
					<div class="name_left">刘胜利</div>
				</div>
				<div class="facenan_left"></div><div class="weiba_left"></div><div class="bubble_left">窗前明月光，疑是地上霜。举头望明月，低头思故乡。</div>
			</div>
		</div>
		<div id="left">
			<h3>在线成员</h3>
			<%
				ArrayList<users> onlineusers=(ArrayList<users>)application.getAttribute("onlineusers");
				if(onlineusers==null){
						System.out.println("application为空！");
				}
				if(onlineusers!=null&&onlineusers.size()!=0){
				System.out.println("从application中成功取出onlineusers!");
					for(int i=0;i<onlineusers.size();i++){
						users user=onlineusers.get(i);
						String sex=user.getSex();
						String nicheng=user.getNicheng();
						out.print("<div class='users'><div class='"+sex+"'></div>"+nicheng+"</div>");
					}
				}
				users user=(users)session.getAttribute("user");
				String nicheng=user.getNicheng();
				String sex=user.getSex();
			%>
		</div>
		<div id="input">
				<input type="text" name="message" id="message">
				<img src="./img/send.png" id="send" onclick="sendMessage();">
		</div>
	</div>
	<script type="text/javascript">
	var nicheng='<%=nicheng%>';
	var sex='<%=sex%>';
	function sendMessage(){
		var message=document.getElementById("message").value;
		if(message==""){
			alert("输入不得为空！");
		}else{
			var allMessage=document.getElementById("right").innerHTML;
			document.getElementById("right").innerHTML=allMessage+"<div class='message_room'><div class='name_around'><div class='name_right'>"+nicheng+"</div></div><div class='face"+sex+"_right'></div><div class='weiba_right'></div><div class='bubble_right'>"+message+"</div></div>";
			document.getElementById("message").value="";
			
			var xmlHttpReq=new XMLHttpRequest();
			if(xmlHttpReq=null){
			alert("发送失败！");
			}else{
				xmlHttpReq.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xmlHttpReq.open("post","WebChat/getMessage.java",true);
				xmlHttpReq.send("message="+messge);
				xmlHttpReq.onreadystatechange = function () {
  					 // 这步为判断服务器是否正确响应
  					if (xhr.readyState == 4 && xhr.status == 200) {
   							 console.log(xhr.responseText);
  					} 
				}
			}
	}}
	
	function closesession(){
		var xmlHttpReq=null;
		xmlHttpReq=new XMLHttpRequest();
		if(xmlHttpReq!=null){
			xmlHttpReq.open("get","/WebChat/closesession",false);
			xmlHttpReq.send();
			alert("发送成功！");
		}
	}
	setInterval(function(){
			var req=new XMLHttpRequest();
			if(req!=null){
				reqMessage(req);
			}
		},1200);
	function reqMessage(req){
			req.open("get","WebChat/sendMessage.java",true);
			req.send();
			req.onreadystatechange=function(){
				if(req.readyState==4&&req.status==200){
				var responseText=xmlHttpRequest.responseText;
				var json=eval("["+responseText+"]");
					document.getElementById("right").innerHTML=document.getElementById("right").innerHTML+"<div class='message_room'><div class='name_around'><div class='name_left'>"+json[0].nicheng+"</div></div><div class='face"+json[0].sex+"_left'></div><div class='weiba_left'></div><div class='bubble_left'>"+json[0].message+"</div></div>";
				}
			}
	}
	
	</script>
  </body>
</html>
