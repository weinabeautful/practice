function xuanzhuan(){
	var login_mid=document.getElementById("login-mid");
	login_mid.style.transform="rotateY(360deg)";
	setTimeout(function(){
		var login_mid=document.getElementById("login-mid");
		login_mid.innerHTML="<form method='post' action='/WebChat/register'><input type='radio' name='sex' id='nanren' value='nan'><input type='radio' name='sex' id='nvren' value='nv'><img src='./img/register.png' class='loginimg'><input id='username' class='shuru' type='text' name='username-register' placeholder='用户名'><br><input id='password' class='shuru' type='password' name='password-register' placeholder='密码'><input id='nicheng-input' class='shuru' type='text' name='name' placeholder='昵称'><div id='allsex'><div id='sex'>性别:</div><div id='male' onclick='clickmale();'></div><div id='female' onclick='clickfemale();'></div></div><input type='submit' value='提交' class='submit' onclick='register();'></form><img src='./img/return.png' onclick='back();' id='return-png'>";
	},1000);
}

function back(){
	var login_mid=document.getElementById("login-mid");
	login_mid.style.transform="rotateY(0deg)";
	setTimeout(function(){
		var login_mid=document.getElementById("login-mid");
		login_mid.innerHTML="<form method='post' action='/WebChat/login'><img src='./img/login.png' class='loginimg'><input id='username' class='shuru' type='text' name='username' placeholder='用户名'><br><input id='password' class='shuru' type='password' name='password' placeholder='密码'><input type='submit' value='登录' class='submit' onclick='login();'><button class='submit' onclick='xuanzhuan();'>注册</button>";
	},1000);
}
function clickmale(){
			document.getElementById("male").style.background="url('./img/nanwa.png')";
			document.getElementById("female").style.background="url('./img/huinv.png')";
			document.getElementById("nanren").click();
}
function clickfemale(){
	document.getElementById("female").style.background="url('./img/nvwa.png')";
	document.getElementById("male").style.background="url('./img/huinv.png')";
	document.getElementById("nvren").click();
}
function login(){
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	if(username==""||password==""){
		alert("用户名和密码不得为空！");
	}
}
function register(){
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	var nicheng=document.getElementById("nicheng-input").value;
	var nanren=document.getElementById("nanren").checked;
	var nvren=document.getElementById("nvren").checked;
	if(username==""||password==""||incheng==""){
		if(nanren==false&&nvren==false){
			alert("以上全部为必选项，不得为空！");
		}
	}
}
function freelogin(){
	document.getElementById("freelogin").click();
}