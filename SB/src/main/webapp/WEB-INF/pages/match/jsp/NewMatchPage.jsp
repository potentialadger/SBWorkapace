<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.match.bean.MatchBean"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--FontAwesome圖標字體-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>



<title>Document</title>
<style>
* {
	margin: 0px;
	padding: 0px;
} /*leftside*/
* {
	box-sizing: border-box;
}

html, body {
	width: 100%;
	height: 100vh;
	margin: 0;
	padding: 0;
	overflow: hidden;
}

button {
	outline: none;
	transition: .2s;
	cursor: pointer;
	&:
	hover
	{
	opacity
	:
	.7;
}

}
body {
	--app-background: #eaebf5;
	--chat-background: #fff;
	--link-color: #c0c1c5;
	--navigation-bg: #fff;
	--navigation-box-shadow: 0 2px 6px 0 rgba(136, 148, 171, 0.2), 0 24px
		20px -24px rgba(71, 82, 107, 0.1);
	--main-color: #3d42df;
	--message-bg: #f3f4f9;
	--message-bg-2: #3d42df;
	--message-text: #2c303a;
	--placeholder-text: #a2a4bc;
	--button-bg: #fff;
}

body.dark {
	--app-background: #262a42;
	--navigation-box-shadow: 0px 0px 8px 0px #282b33;
	--chat-background: #3c3f56;
	--message-bg: #2c3046;
	--message-text: rgba(255, 255, 255, 0.8);
	--placeholder-text: #fff;
	--navigation-bg: #3c3f56;
	--button-bg: #3c3f56;
	--main-color: #6f74ff;
	--message-bg-2: #6f74ff;
	.
	mic
	{
	background-image
	:
	url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-mic-off' viewBox='0 0 24 24'%3E%3Cpath d='M1 1l22 22M9 9v3a3 3 0 005.12 2.12M15 9.34V4a3 3 0 00-5.94-.6'/%3E%3Cpath d='M17 16.95A7 7 0 015 12v-2m14 0v2a7 7 0 01-.11 1.23M12 19v4M8 23h8'/%3E%3C/svg%3E%0A")
	;
}

.camera {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-camera-off' viewBox='0 0 24 24'%3E%3Cpath d='M1 1l22 22M21 21H3a2 2 0 01-2-2V8a2 2 0 012-2h3m3-3h6l2 3h4a2 2 0 012 2v9.34m-7.72-2.06a4 4 0 11-5.56-5.56'/%3E%3C/svg%3E%0A");
}

.maximize {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-maximize' viewBox='0 0 24 24'%3E%3Cpath d='M8 3H5a2 2 0 00-2 2v3m18 0V5a2 2 0 00-2-2h-3m0 18h3a2 2 0 002-2v-3M3 16v3a2 2 0 002 2h3'/%3E%3C/svg%3E%0A");
}

.magnifier {
	color: #fff;
}

.chat-header {
	border-color: var(--message-bg);
}

.btn-close-right {
	color: #fff;
}

}
a {
	text-decoration: none;
}

.app-container {
	background-color: var(--app-background);
	width: 100%;
	height: 100%;
	font-family: 'DM Sans', sans-serif;
	display: flex;
	transition: .2s;
}

/*可以刪*/
.left-side {
	position: relative;
	padding: 16px;
	flex-basis: 120px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100%;
}

.navigation {
	display: flex;
	flex-direction: column;
	background-color: var(--navigation-bg);
	padding: 24px;
	border-radius: 10px;
	box-shadow: var(--navigation-box-shadow);
}

.nav-link+.nav-link {
	margin-top: 32px;
}

.nav-link:hover svg {
	color: #3d42df;
}

.icon svg {
	width: 24px;
	height: 24px;
	color: var(--link-color);
	transition: .2s ease-in;
}

/*右邊欄位*/
.right-side {
	margin-left: auto;
	flex-basis: 400px;
	height: 80%;
	padding: 16px;
	right: 98px; /*調位置*/
	top: 6.39%;
	position: relative;
	transition: all 300ms cubic-bezier(0.190, 1.000, 0.560, 1.000); &. show
	{ display : block;
	transform: translateX(0);
}

}

/*右下的聊天框*/
.chat-container {
	background-color: var(--chat-background);
	border-radius: 10px;
	display: flex; /*將容器設置為使用彈性布局*/
	flex-direction: column; /*將子元素排列方向設置為垂直，這樣子元素會垂直堆疊*/
	height: calc(100% - 72px); /*設置容器的高度為當前視窗高度減去 72px*/
}

.chat-header {
	padding: 16px;
	border-bottom: 1px solid #f5f5f5;
}

.chat-header-button {
	background-color: var(--main-color);
	padding: 12px 16px 12px 40px;
	border: none;
	border-radius: 4px;
	color: #fff;
	background-image:
		url("data:image/svg+xml,%3Csvg viewBox='0 0 512 512' xmlns='http://www.w3.org/2000/svg' fill='%23fff'%3E%3Cpath d='M479.9 187.52l-90.19 68.53v-52.6a20 20 0 00-20-20H20a20 20 0 00-20 20V492a20 20 0 0020 20h349.71a20 20 0 0020-20v-52.6l90.18 68.52c13.05 9.91 32.1.67 32.1-15.92V203.45c0-16.5-18.94-25.92-32.1-15.93zM349.7 472H40V223.45h309.71zM472 451.68l-82.29-62.53V306.3L472 243.77zM87.96 79.24C129.62 28.88 190.86 0 256 0c65.13 0 126.37 28.88 168.03 79.24a20 20 0 01-30.82 25.5A177.6 177.6 0 00256 40a177.6 177.6 0 00-137.21 64.73 20 20 0 11-30.83-25.5zm240.36 32.21a20 20 0 11-21.02 34.03 97.57 97.57 0 00-51.3-14.53 97.6 97.6 0 00-51.31 14.53 20 20 0 11-21.02-34.03A137.53 137.53 0 01256 90.95c25.59 0 50.6 7.09 72.32 20.5zm0 0'/%3E%3C/svg%3E%0A");
	background-repeat: no-repeat;
	background-position: center left 12px;
	background-size: 16px;
	font-size: 14px;
}

.chat-area {
	flex: 1;
	overflow-y: auto;
	padding: 16px;
}

.profile-picture {
	border-radius: 8px;
	width: 32px;
	height: 32px;
	overflow: hidden;
	margin-right: 12px;
	flex-shrink: 0; img { width : 100%;
	height: 100%;
	object-fit: cover;
}

}
.message-wrapper {
	display: flex;
}

.name {
	margin: 0;
	line-height: 16px;
	font-size: 12px;
	font-weight: 700;
	color: var(--message-text);
}

.rightmessage {
	margin-top: 8px;
	background-color: var(--message-bg);
	padding: 8px 16px;
	border-radius: 0 12px 12px 12px;
	font-size: 12px;
	line-height: 16px;
	max-width: calc(100% - 32px);
	color: var(--message-text);
}

.message-wrapper {
	padding: 16px 0; &. reverse { flex-direction : row-reverse; . message {
	background-color : var( --message-bg-2);
	color: #fff;
	margin-left: auto;
	border-radius: 16px 0px 16px 16px;
}

.profile-picture {
	margin-right: 0px;
	margin-left: 12px;
}

.name {
	text-align: right;
}

}
}
.message-file {
	border: 1px solid var(--message-bg);
	width: 100%;
	margin-top: 16px;
	border-radius: 4px;
	padding: 8px;
	display: flex; . sketch { border-radius : 4px;
	padding: 2px;
	background-color: #fdeee2;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 32px;
	height: 32px; svg { width : 20px;
	height: 20px;
}

}
}
.file-info {
	flex: 1;
	padding: 0 40px 0 8px;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='%23b8b8b8' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-download' viewBox='0 0 24 24'%3E%3Cpath d='M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4M7 10l5 5 5-5M12 15V3'/%3E%3C/svg%3E%0A");
	background-position: center right 12px;
	background-size: 20px;
	background-repeat: no-repeat;
	font-size: 12px;
}

.file-name {
	color: var(--message-text);
}

.file-size {
	color: #b8b8b8;
}

.mention {
	color: #7c80fd;
}

.chat-typing-area-wrapper {
	padding: 16px;
}

.chat-typing-area {
	display: flex;
	border-radius: 10px;
	padding: 8px;
	box-shadow: var(--navigation-box-shadow);
	background-color: var(--message-bg);
	.
	dark
	&
	{
	box-shadow
	:
	none;
}

}
.chat-input {
	border: none;
	font-size: 14px;
	line-height: 24px;
	outline: none;
	color: var(--message-text);
	flex: 1;
	background-color: transparent;
	&:
	placeholder
	{
	color
	:
	var(
	--placeholder-text
	);
}

}
.send-button {
	color: #fff;
	background-color: var(--main-color);
	border-radius: 8px;
	border: none;
	width: 32px;
	height: 32px;
	display: flex;
	justify-content: center;
	align-items: center; svg { width : 20px;
	height: 20px;
}

}
.app-main {
	flex: 1;
	width: 100%;
	padding: 72px 32px 16px 32px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

/*調整圖片框的大小*/
.video-call-wrapper {
	width: 75%;
	height: 100%;
	border-radius: 16px;
	overflow: hidden;
	display: flex;
	flex-wrap: wrap;
	flex-direction: row; /* 水平排列 */
	box-shadow: 4px 4px 12px -2px rgba(20%, 20%, 40%, 0.5);
	z-index: 2; /* 設置較高的 z-index 值 */ /*想讓陰影出來外面*/
}

.video-participant {
	width: 50%;
	height: 25%;
	position: relative; img { width : 100%;
	height: 100%;
	object-fit: cover;
}

}
.name-tag {
	position: absolute;
	bottom: 12px;
	right: 12px;
	font-size: 12px;
	color: #fff;
	background-color: rgba(0, 15, 47, 0.5);
	border-radius: 4px;
	padding: 4px 12px;
}

.participant-actions {
	position: absolute;
	display: flex;
	left: 12px;
	top: 12px;
}

.btn-mute, .btn-camera {
	width: 32px;
	height: 32px;
	border-radius: 4px;
	background-color: rgba(0, 15, 47, 0.5);
	background-repeat: no-repeat;
	background-position: center;
	background-size: 16px;
	border: none;
}

.btn-mute {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-mic-off' viewBox='0 0 24 24'%3E%3Cpath d='M1 1l22 22M9 9v3a3 3 0 005.12 2.12M15 9.34V4a3 3 0 00-5.94-.6'/%3E%3Cpath d='M17 16.95A7 7 0 015 12v-2m14 0v2a7 7 0 01-.11 1.23M12 19v4M8 23h8'/%3E%3C/svg%3E%0A");
	margin-right: 4px;
}

.btn-camera {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-camera-off' viewBox='0 0 24 24'%3E%3Cpath d='M1 1l22 22M21 21H3a2 2 0 01-2-2V8a2 2 0 012-2h3m3-3h6l2 3h4a2 2 0 012 2v9.34m-7.72-2.06a4 4 0 11-5.56-5.56'/%3E%3C/svg%3E%0A");
}

.video-call-actions {
	display: flex;
	align-items: center;
	padding-top: 64px;
	max-width: 500px;
}

.video-action-button {
	background-repeat: no-repeat;
	background-size: 24px;
	border: none;
	height: 48px;
	margin: 0 8px;
	box-shadow: var(--navigation-box-shadow);
	border-radius: 8px;
	width: 48px;
	cursor: pointer;
	outline: none;
	background-color: var(--button-bg); span { display : block;
	margin: 0 16px;
}

}

/*太陽*/
.participants {
	display: flex;
	background-color: var(--button-bg);
	box-shadow: var(--navigation-box-shadow);
	margin-top: 16px;
	padding: 12px;
	border-radius: 8px;
	max-width: 232px;
	margin-left: auto;
}

.participant-more {
	background-color: #e1e0e1;
	font-size: 14px;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #636181;
	font-weight: 700;
	border-radius: 8px;
	min-width: 32px;
}

.mode-switch {
	z-index: 1;
	position: absolute;
	top: 20px;
	left: 36px;
	background-color: var(--chat-background);
	border: none;
	color: #ddd;
	outline: none;
	cursor: pointer;
	box-shadow: var(--navigation-box-shadow);
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 36px;
	height: 36px;
	transform-origin: center; svg { width : 0;
	height: 24px;
	transition: all .3s ease-in;
	transform-origin: center;
}

.moon {
	opacity: 0;
}

.sun {
	width: 24px;
}

}
.dark .moon {
	opacity: 1;
	width: 24px;
}

.dark .sun {
	opacity: 0;
	width: 0;
}

.expand-btn {
	position: absolute;
	right: 32px;
	top: 24px;
	border: none;
	background-color: var(--chat-background);
	border-radius: 4px;
	padding: none;
	color: var(--message-text);
	width: 40px;
	height: 40px;
	justify-content: center;
	align-items: center;
	display: none;
	&.
	show
	{
	display
	:
	flex;
}

}
.btn-close-right {
	border: none;
	background-color: transparent;
	position: absolute;
	top: 24px;
	right: 24px;
	color: var(--light-font);
	outline: none;
	cursor: pointer;
	display: none;
}

@media screen and (max-width: 900px) {
	.expand-btn {
		display: block;
	}
	.right-side {
		position: absolute;
		right: 0px;
		background-color: var(--chat-background);
		transform: translateX(100%); /*調上下*/
		z-index: 2;
		width: 100%;
		&.
		show
		{
		transform
		:
		translateX(
		0
		);
	}
}

.btn-close-right {
	display: block;
}

}
@media screen and (max-width: 520px) {
	.left-side {
		display: none;
	}
	.app-main {
		padding: 72px 16px 16px 16px;
	}
	.expand-btn {
		right: 16px;
	}
	.mode-switch {
		left: 16px;
	}
	.video-action-button {
		width: 32px;
		height: 32px;
		background-size: 14px;
		margin: 0 4px;
	}
	.video-action-button.endcall {
		background-size: 14px;
		font-size: 12px;
		padding-left: 36px;
	}
	.video-action-button.magnifier svg {
		width: 14px;
	}
	.video-action-button.magnifier span {
		margin: 0 4px;
		font-size: 12px;
	}
}

@media screen and (max-width: 520px) and (max-height: 720px) {
	.video-participant {
		width: 50%;
		height: 33.3%;
	}
}

*, *:before, *:after {
	box-sizing: border-box;
}

body {
	background-color: #f4efef;
}

img {
	max-width: auto;
	height: auto;
}

/*調整輪播大小*/
.card-container {
	position: absolute;
	max-width: 849.5px; /*調框的寬度*/
	width: 25%;
	height: 35%; /*框跟圖片調這個-裡面全部圖片的長寬*/
}

#userPhotos1 {
  top: 20%;
  left: -40%;
}

#userPhotos2 {
  top: -80%;
  right: -62%;
}

#userPhotos3 {
  bottom: 77%;
  left: -40%;
}

#userPhotos4 {
  bottom: 177%;
  right: -62%;
}



/*調整輪播區塊*/

.carousel {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
  border-radius: 16px;
  font-size: 0;
  box-shadow: 4px 4px 12px -2px rgba(20%, 20%, 40%, 0.5);
  z-index: 2;
  background-color: #EAEBF5;
}

.carousel img {
	height: 800px; /* 設定 carousel 區塊高度 */ /*框跟圖片調這個-裡面全部圖片的長寬*/
	overflow: hidden; /* 隱藏超出區塊的部分 */
	object-fit: cover; /* 圖片保持比例填滿容器 */
}

@media screen and (max-width: 1200px) {
	.container {
		max-width: 100%;
	}
}

@media screen and (max-width: 1024px) {
	.carousel img {
		width: 100%;
	}
}

.carousel.removed {
	transform: translateX(-100%) rotateY(-30deg) scale(0.9);
	transition: transform 0.5s;
	opacity: 0;
	pointer-events: none;

	/*transform: translateX(-100vw);*/
}

.carousel.loved {
	transform: translateX(100%) rotateY(30deg) scale(0.9);
	transition: transform 0.5s;
	opacity: 0;
	pointer-events: none;

	/*transform: translateX(100vw);*/
}

/*上面的按紐*/
.nav-link:hover svg { /*按鈕移上去顏色*/
	color: #A2ABB0;
}

.icon svg { /*按鈕大小*/
	width: 35px;
	height: 35px;
	color: var(--link-color);
	transition: .2s ease-in;
}

#home {
	margin-left: 38px;
	position: absolute; /* 將按鈕設為絕對定位 */
	top: 23px; /* 距頂部 20px */
	left: 110px; /* 距左側 0px */
}

#edit {
	margin-left: 38px;
	position: absolute; /* 將按鈕設為絕對定位 */
	top: -9.5px; /* 距頂部 20px */
	left: 190px; /* 距左側 0px */
}

#leftmenu {
	height: 69px;
	width: 290px; /*可以調垂直或是水平*/
	/*border-bottom:1px solid #d8dfe3;/	/*底下的水平線*/
}

#leftmenu span {
	float: left; /*按鈕排列順序*/
	width: 96px;
	height: 100px;
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/top-menu.png")
		-3px -118px no-repeat;
	cursor: pointer; /*滑鼠移上去變手的圖案*/
	position: relative;
	/* 為了使用 left 屬性，需要设置 position 為 relative 或 absolute */
	left: 18px; /* 負值表示向左移動 */
	top: 3px;
}

/*調整左邊欄位裡面按鈕的位置*/
#leftmenu span.friends {
	margin-bottom: -1px;
}

#leftmenu span.chats {
	background-position: -95px 25px;
	cursor: pointer;
}

#leftmenu span.chats:hover {
	background-position: -95px -46px;
	cursor: pointer;
}

#leftmenu span.history {
	background-position: -190px 24px;
	cursor: pointer;
}

#leftmenu span.history:hover {
	background-position: -190px -47px;
	cursor: pointer;
}

/*右邊欄位裡面*/
.matchsname {
	text-align: center;
	font-family: "Poppins", sans-serif;
	font-size: 37px;
	font-weight: 700;
	line-height: 3; /*行與行之間的垂直間距*/
	transition: all .3s ease; /*在屬性值變化時平滑過渡*/
}

.chat-header {
	overflow-y: auto; /* 垂直滾輪 */
	background-color: 0;
}

.chat-header .social {
	float: left;
	width: 100%;
	text-align: center;
}

.chat-header .social a {
	text-decoration: none;
}

.chat-header .social i {
	display: inline-block;
	font-size: 16px;
	color: #006da0;
	text-align: center;
	border: 1px solid #006da0;
	width: 30px;
	height: 30px;
	line-height: 30px;
	border-radius: 50%;
	margin: 0 5px;
}

.chat-header .social i:hover {
	background-color: #006da0;
	color: #fff;
}

.hr {
	width: 65%;
	margin: 0 auto; /* 0 上下邊距，auto 左右邊距自動調整使其置中 */
	margin-top: 25px;
	border-top: 1px solid rgba(0, 0, 0, 0.1); /* 使用 rgba() 函數設置顏色和透明度 */
}

@font-face {
	font-family: 'cwTeXYen';
	font-style: normal;
	font-weight: 500;
	src: url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.eot);
	src: url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.eot?#iefix)
		format('embedded-opentype'),
		url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.ttf)
		format('truetype');
}

.goal {
	text-align: center;
	font-family: "cwTeXYen", sans-serif;
	font-size: 24px;
	font-weight: 100;
	line-height: 3; /*行與行之間的垂直間距*/
	transition: all .3s ease; /*在屬性值變化時平滑過渡*/
}

.topic {
	text-align: center;
	font-family: "cwTeXYen", sans-serif;
	font-size: 24px;
	font-weight: 100;
	line-height: 3; /*行與行之間的垂直間距*/
	transition: all .3s ease; /*在屬性值變化時平滑過渡*/
}

.aboutMe {
	text-align: center;
	font-family: "cwTeXYen", sans-serif;
	font-size: 24px;
	font-weight: 100;
	line-height: 3; /*行與行之間的垂直間距*/
	transition: all .3s ease; /*在屬性值變化時平滑過渡*/
}

.gender {
	margin-right: 140px; /* 向右移動 20 像素 */
	font-size: 21px;
}

.birthday {
	margin-right: 140px; /* 向右移動 20 像素 */
	font-size: 21px;
}

.starSign {
	margin-right: 140px; /* 向右移動 20 像素 */
	font-size: 21px;
}

.bloodType {
	margin-right: 140px; /* 向右移動 20 像素 */
	font-size: 21px;
}

.MBTI {
	margin-right: 140px; /* 向右移動 20 像素 */
	font-size: 18px;
}

/*愛心跟X*/
.tinder {
	padding-top: 0px;
}

.tinder--buttons {
  position: relative;
  text-align: center;
  margin-top: 850px;
  margin-bottom: 100px;
}

#nope {
  position: absolute;
  top: 50%;
  left: 30%;
  transform: translate(-60%, 10%);
}

#love {
  position: absolute;
  top: 50%;
  right: 30%;
  transform: translate(200%, 10%);
}

.tinder--buttons button {
	border-radius: 50%;
	line-height: 70px; /*愛心X長*/
	width: 70px; /*愛心X寬*/
	border: 0;
	background-color: var(--button-bg);
	display: inline-block;
	margin: 0 8px;
	box-shadow: var(--navigation-box-shadow);
}

.tinder--buttons button:focus {
	outline: 0;
}

.tinder--buttons i {
	font-size: 32px;
	vertical-align: middle;
}

.fa-heart {
	color: #FFACE4;
}

.fa-remove {
	color: #CDD6DD;
}

/*左邊的好友欄*/
#chatbox {
	width: 330px; /*調整朋友框的大小*/
	background: #fff;
	border-radius: 16px;
	overflow: hidden;
	height: 535px;
	position: absolute;
	top: 100px; /*調整朋友框的位置*/
	left: 13.4%;
	margin-left: -155px;
}

#friendslist {
	position: absolute;
	top: 0;
	left: 5%;
	width: 330px;
	height: 535px;
}

.friend { /*朋友列表裡面的位置調整*/
	bottom: 0px;
	left: 10px;
	height: 80px;
	border-bottom: 1px solid #e7ebee;
	position: relative;
	vertical-align: top;
}

.friend:hover {
	background: #f1f4f6;
	cursor: pointer;
}

.friend img {
	width: 50px; /*改頭像大小  記得	height:80px;也要改*/
	border-radius: 50%;
	margin: 15px;
	float: left;
}

.floatingImg {
	width: 40px;
	border-radius: 50%;
	position: absolute;
	top: 0;
	left: 12px;
	border: 3px solid #fff;
}

.friend p {
	padding: 28px 0 0 0; /*改名字位置*/
	float: left;
	width: 220px;
}

.friend p strong {
	font-weight: 600;
	font-size: 17px;
	color: #597a96;
}

.friend p span {
	font-size: 13px;
	font-weight: 400;
	color: #aab8c2;
}

.friend .status { /*登陸狀態*/
	background: #26c281;
	border-radius: 50%;
	width: 9px;
	height: 9px;
	position: absolute;
	top: 31px; /*調點點的位置*/
	right: 35px;
}

.friend .status.away {
	background: #ffce54;
}

.friend .status.inactive {
	background: #eaeef0;
}

#search {
	background: #e3e9ed
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/search.png")
		-11px 0 no-repeat;
	height: 60px;
	width: 330px; /*要跟#chatbox一樣*/
	position: absolute;
	bottom: 0;
	left: 0;
}

#searchfield {
	background: #e3e9ed;
	margin: 21px 0 0 55px;
	border: none;
	padding: 0;
	font-size: 16px;
	font-family: "Open Sans", sans-serif;
	font-weight: 400px;
	color: #8198ac;
}

#searchfield:focus {
	outline: 0;
}

#chatview {
	width: 330px; /*要跟#friendslist一樣*/
	height: 535px;
	position: absolute;
	top: 0;
	left: 0;
	display: none;
	background: #fff;
}

#profile {
	height: 153px;
	overflow: hidden;
	text-align: center;
	color: #fff;
	/*width:330px;      /*profile資料的位置會改?*/
}

.p1 #profile {
	background: #fff
		url("https://watermark.lovepik.com/photo/40030/3639.jpg_wh1200.jpg") 0
		0 no-repeat;
}

#profile .avatar { /*頭像調位置要在js調   $('.floatingImg').animate({   */
	width: 68px;
	border: 3px solid #fff;
	margin: 23px 0 0;
	border-radius: 50%;
}

#profile  p {
	font-weight: 600;
	font-size: 19px;
	margin: 118px 0 -1px;
	opacity: 0;
	-webkit-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-moz-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-ms-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-o-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
}

#profile  p.animate { /*profile字體的位置*/
	margin-top: 97px;
	opacity: 1;
	-webkit-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-moz-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-ms-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-o-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
}

#profile  span {
	font-weight: 400;
	font-size: 14px; /*email字體大小*/
}

#chat-messages {
	opacity: 0;
	margin-top: 30px;
	width: 335px; /*裡面聊天區塊的大小*/
	height: 320px;
	overflow-y: scroll;
	overflow-x: hidden;
	padding-right: 20px;
	-webkit-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-moz-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-ms-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-o-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	/* 隱藏滾動條 */
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none; /* Firefox */
}

#chat-messages.animate { /*整個聊天內容*/
	opacity: 1;
	margin-top: 0;
}

#chat-messages label {
	color: #aab8c2;
	font-weight: 600;
	font-size: 15px; /*日期*/
	text-align: center;
	margin: 15.5px 0;
	width: 330px;
	display: block;
}

#chat-messages div.message {
	padding: 0 0 30px 58px;
	clear: both;
	margin-bottom: 59px; /*調整bubble的間距*/
}

#chat-messages div.message.right {
	padding: 0 58px 30px 0;
	margin-right: -19px;
	margin-left: 19px;
}

#chat-messages .message img {
	float: left;
	margin-left: -45px;
	border-radius: 50%;
	width: 35px; /*聊天區塊頭像大小*/
	height: 35px;
	margin-top: 12px;
}

#chat-messages div.message.right img {
	float: right;
	margin-left: 0;
	margin-right: -45px;
}

.message .bubble { /*消息的框*/
	background: #F3F4F9;
	font-size: 15.5px; /*訊息字體大小*/
	font-weight: 600;
	padding: 12px 13px;
	border-radius: 5px 5px 5px 0px;
	color: #8495a3;
	position: relative;
	float: left;
}

#chat-messages div.message.right .bubble {
	float: right;
	border-radius: 5px 5px 0px 5px;
}

.bubble .corner {
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/bubble-corner.png")
		0 0 no-repeat;
	position: absolute;
	width: 7px;
	height: 7px;
	left: -5px;
	bottom: 0;
}

div.message.right .corner {
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/bubble-cornerR.png")
		0 0 no-repeat;
	left: auto;
	right: -5px;
}

.bubble span {
	color: #aab8c2;
	font-size: 12.5px; /*時間大小*/
	position: absolute;
	right: 0;
	bottom: -22px;
}

#sendmessage {
	height: 60px;
	border-top: 1px solid #e7ebee;
	position: absolute;
	bottom: 0;
	right: 0px;
	width: 330px;
	background: #fff;
	/*padding-bottom:50px;*/
}

#sendmessage input {
	background: #fff;
	margin: 21px 0 0 21px;
	border: none;
	padding: 0;
	font-size: 15.5px;
	font-family: "Open Sans", sans-serif;
	font-weight: 320px;
	color: #aab8c2;
}

#sendmessage input:focus {
	outline: 0;
}

#sendmessage button {
	background: #fff
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/send.png") 0
		-41px no-repeat;
	width: 30px;
	height: 30px;
	position: absolute;
	right: 15px;
	top: 23px;
	border: none;
}

#sendmessage button:hover {
	cursor: pointer;
	background-position: 0 0;
}

#sendmessage button:focus {
	outline: 0;
}

#close {
	position: absolute;
	top: 8px;
	opacity: 0.8;
	right: 10px;
	width: 20px;
	height: 20px;
	cursor: pointer;
}

#close:hover {
	opacity: 1;
}

.cx, .cy {
	background: #fff;
	position: absolute;
	width: 0px;
	top: 15px;
	right: 15px;
	height: 3px;
	-webkit-transition: all 250ms ease-in-out;
	-moz-transition: all 250ms ease-in-out;
	-ms-transition: all 250ms ease-in-out;
	-o-transition: all 250ms ease-in-out;
	transition: all 250ms ease-in-out;
}

.cx.s1, .cy.s1 {
	right: 0;
	width: 20px;
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cy.s2 {
	-ms-transform: rotate(50deg);
	-webkit-transform: rotate(50deg);
	transform: rotate(50deg);
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cy.s3 {
	-ms-transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cx.s1 {
	right: 0;
	width: 20px;
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cx.s2 {
	-ms-transform: rotate(140deg);
	-webkit-transform: rotate(140deg);
	transform: rotate(140deg);
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cx.s3 {
	-ms-transform: rotate(135deg);
	-webkit-transform: rotate(135deg);
	transform: rotate(135deg);
	-webkit-transition: all 100ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

#chatview, #sendmessage {
	overflow: hidden;
	border-radius: 6px;
}




</style>


</head>

<body>
	<!--連結到 Google Fonts 的程式碼片段-->
	<link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">

	<!--組織和定位網頁中的內容-->
	<div class="app-container">

		<!--一個按鈕，用來在明亮模式和暗黑模式之間切換-->
		<button class="mode-switch">
			<svg class="sun" fill="none" stroke="#fbb046" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-sun" viewBox="0 0 24 24">
				<defs/>
				<circle cx="12" cy="12" r="5" />
				<path d="M12 1v2M12 21v2M4.22 4.22l1.42 1.42M18.36 18.36l1.42 1.42M1 12h2M21 12h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42" /></svg>
			<svg class="moon" fill="none" stroke="#ffffff" stroke-linecap="round"
				stroke-linejoin="round" stroke-width="2"
				class="feather feather-moon" viewBox="0 0 24 24">
				<defs />
				<path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z" /></svg>
		</button>





		<!--Test-->
		
		<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>



		<!--定位或樣式控制-->
		<div id="menu">
			<!--列出了一個朋友清單。這個清單可能是用來顯示聯繫人列表的-->
			<div id="friendslist">
				<!--包含了一個頂部菜單，裡面包含了三個 <span> 元素，每個 <span> 元素可能用於不同的操作，如顯示好友、聊天、或歷史記錄-->
				<div id="leftmenu">
					<span class="friends"></span>
					<!--<span class="chats"></span>
                        <span class="history"></span>-->


					<!--首頁-->
					<a href="#" class="nav-link icon" id="home"> <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home" viewBox="0 0 24 24">
           			<path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z" />
           			<path d="M9 22V12h6v10" />
         			</svg>
					</a> <a href="" class="nav-link icon" id="edit"> <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-folder" viewBox="0 0 24 24">
            <path d="M22 19a2 2 0 01-2 2H4a2 2 0 01-2-2V5a2 2 0 012-2h5l2 3h9a2 2 0 012 2z" />
          </svg>
          
					</a>
				</div>
			</div>
		</div>



		<!--Tinder-->
		<div class="app-main">


			<!--照片-->
			<div class="card-container">
				<div class="carousel" id="userPhotos1"><img src="/localimages/${photos[0]}" alt="" style="width: 461px; height: 367.63px; object-fit: cover;"></div>
				<div class="carousel" id="userPhotos2"><img src="/localimages/${photos[1]}" alt="" style="width: 461px; height: 367.63px; object-fit: cover;"></div>
				<div class="carousel" id="userPhotos3"><img src="/localimages/${photos[2]}" alt="" style="width: 461px; height: 367.63px; object-fit: cover;"></div>
				<div class="carousel" id="userPhotos4"><img src="/localimages/${photos[3]}" alt="" style="width: 461px; height: 367.63px; object-fit: cover;"></div>
			</div>  



			<!--按鈕-->
			<div class="tinder">
				<div class="tinder--buttons">
					<form action="" method="get">
					<button id="nope" type="submit">
						<i class="fa fa-remove"></i>
					</button>
				</form>
					<button id="love" type="submit">
						<i class="fa fa-heart"></i>
					</button>
				</div>
			</div>
		</div>







		<!--網頁的右側相關的內容，比如側邊欄、資訊面板或者其他相關元素-->
		<div class="right-side">
			<!--聊天框-->
			<!--容納聊天的相關內容-->
			<div class="chat-container">
				<!--標題聊天的區域-->
				<div class="chat-header">
					<!--用於打開或關閉聊天視窗，其中顯示了 "Live Chat" 這個文本。-->

					<div class="matchsname">${userBean.nickName}</div>
					<div class="social">
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"> <i
							class="fa fa-twitter"></i></a> <a href="#"> <i
							class="fa fa-google-plus"></i></a>
						<hr class="hr">
					</div>

					<div class="goal">
						尋找關係 <span><c:choose>
								<c:when test="${userBean.goalNo == 1}">不回答</c:when>
								<c:when test="${userBean.goalNo == 2}">網友</c:when>
								<c:when test="${userBean.goalNo == 3}">飯友</c:when>
								<c:when test="${userBean.goalNo == 4}">酒友</c:when>
								<c:when test="${userBean.goalNo == 5}">牌友</c:when>
								<c:when test="${userBean.goalNo == 6}">山友</c:when>
								<c:when test="${userBean.goalNo == 7}">旅伴</c:when>
								<c:when test="${userBean.goalNo == 8}">戀愛伴侶</c:when>
								<c:when test="${userBean.goalNo == 9}">結婚對象</c:when>
								<c:when test="${userBean.goalNo == 10}">朋友關係</c:when>
								<c:when test="${userBean.goalNo == 11}">短暫浪漫</c:when>
								<c:when test="${userBean.goalNo == 12}">匿名網友</c:when>
								<c:when test="${userBean.goalNo == 13}">一起運動</c:when>
								<c:when test="${userBean.goalNo == 14}">一起團購</c:when>
								<c:when test="${userBean.goalNo == 15}">外送拼單</c:when>
								<c:when test="${userBean.goalNo == 16}">不設限</c:when>

								<c:otherwise>其他</c:otherwise>
							</c:choose></span>
						<hr class="hr">
					</div>

					<div class="topic">
						我想聊的話題是
						<hr class="hr">
					</div>

					<div class="aboutMe">
						關於我

						<div class="gender">
							性別 <span><c:choose>
									<c:when test="${userBean.gender == 0}">生理女</c:when>
									<c:otherwise>生理男</c:otherwise>
								</c:choose></span>
						</div>

						<div class="birthday">生日 ${userBean.birthday}</div>

						<!-- <div class="starSign">
          星座 
          </div> -->

						<div class="bloodType">血型 ${userBean.bloodType}</div>

						<div class="MBTI">MBTI ${userBean.MBTI}</div>
					</div>
				</div>



				<!--  
        <button class="chat-header-button">
         Live Chat
        </button>
      </div>-->


				<!--容納聊天視窗或者聊天對話框的內容。在這個元素中，你可以放置聊天訊息、輸入框、發送按鈕等相關元素，以呈現一個完整的聊天介面。-->
				<!--       <div class="chat-area">
         <div class="message-wrapper">
          <div class="profile-picture">
            <img src="https://images.unsplash.com/photo-1576110397661-64a019d88a98?ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80" alt="pp">
          </div>
          <div class="message-content">
            <p class="name">Tim Russel</p>-->
				<!--顯示實際的訊息內容。在這個訊息中，可能包含了一個新的設計文件的連結，具有 CSS 類名為 "message-file"。該連結的內容包含了一個 SVG 圖示和相關的文件信息-->
				<!--              <div class="rightmessage">New design document⬇️</div>
            <div class="message-file">
              <div class="icon sketch">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                  <path fill="#ffd54f" d="M96 191.02v-144l160-30.04 160 30.04v144z"/>
                  <path fill="#ffecb3" d="M96 191.02L256 16.98l160 174.04z"/>
                  <path fill="#ffa000" d="M0 191.02l256 304 256-304z"/>
                  <path fill="#ffca28" d="M96 191.02l160 304 160-304z"/>
                  <g fill="#ffc107">
                    <path d="M0 191.02l96-144v144zM416 47.02v144h96z"/>
                  </g>
                </svg>
              </div>
              <div class="file-info">
                <div class="file-name">NewYear.sketch</div>
                <div class="file-size">120 MB</div>
              </div>
            </div>
          </div>
        </div>

        </div>-->
				<!--顯示一個「擴展」的圖示-->
				<!--    </div>
  <button class="expand-btn">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"/></svg>
    </button>-->





				<script>
				
				
				
				'use strict';

				$(document).ready(function() {
				    var currentUserNo;
				    var nope = $('#nope');
				    var love = $('#love');

				    // 獲取當前用戶ID
				    function getCurrentUserNo() {
				        $.ajax({
				            url: '/getCurrentUserNo',
				            type: 'GET',
				            async: false,
				            success: function(userNo) {
				                if (userNo !== null) {
				                    currentUserNo = userNo;
				                } else {
				                    console.log('User not logged in');
				                }
				            },
				            error: function(xhr, status, error) {
				                console.error('Error getting current user ID:', error);
				            }
				        });
				    }

				    getCurrentUserNo();

				    function createButtonListener(love) {
				        return function(event) {
				            var user2No = ${userBean.userNo}; // 獲取當前顯示的用戶編號

				            var url = love ? '/like/' + user2No : '/dislike/' + user2No;

				            $.ajax({
				                url: url,
				                type: 'POST',
				                success: function(response) {
				                    console.log(response);
				                    // 重新載入當前頁面
				                    location.reload();
				                },
				                error: function(xhr, status, error) {
				                    console.error('Error updating match status:', error);
				                }
				            });

				            event.preventDefault();
				        };
				    }

				    var nopeListener = createButtonListener(false);
				    var loveListener = createButtonListener(true);

				    nope.on('click', nopeListener);
				    love.on('click', loveListener);
				});
				
    
    
    
/*				'use strict';

				$(document).ready(function() {
				    var currentUserNo;
				    var nope = $('#nope');
				    var love = $('#love');

				    // 獲取當前用戶ID
				    function getCurrentUserNo() {
				        $.ajax({
				            url: '/getCurrentUserNo',
				            type: 'GET',
				            async: false,
				            success: function(userNo) {
				                if (userNo !== null) {
				                    currentUserNo = userNo;
				                } else {
				                    console.log('User not logged in');
				                }
				            },
				            error: function(xhr, status, error) {
				                console.error('Error getting current user ID:', error);
				            }
				        });
				    }

				    getCurrentUserNo();

				    function createButtonListener(love) {
				        return function(event) {
				            var user2No = ${userBean.userNo}; // 獲取當前顯示的用戶編號

				            var url = love ? '/like/' + user2No : '/dislike/' + user2No;

				            $.ajax({
				                url: url,
				                type: 'POST',
				                success: function(response) {
				                    console.log(response);
				                    // 重新載入當前頁面
				                    location.reload();
				                },
				                error: function(xhr, status, error) {
				                    console.error('Error updating match status:', error);
				                }
				            });

				            event.preventDefault();
				        };
				    }

				    var nopeListener = createButtonListener(false);
				    var loveListener = createButtonListener(true);

				    nope.on('click', nopeListener);
				    love.on('click', loveListener);
				});*/
				
				

				
				

// 獲取所有按鈕和內容容器
const buttons = document.querySelectorAll('.nav-link.icon');
const contentContainer = document.querySelector('.content-container');

// 為每個按鈕添加點擊事件監聽器
buttons.forEach(button => {
  button.addEventListener('click', () => {
    // 清空內容容器
    contentContainer.innerHTML = '';

    // 根據按鈕的 ID 或類別創建對應的內容
    const content = document.createElement('div');
    switch (button.id) {
      case 'home':
        content.textContent = '這是主頁內容';
        break;
      case 'messages':
        content.textContent = '這是訊息內容';
        break;
      // 其他按鈕對應的內容
    }

    // 將內容添加到容器中
    contentContainer.appendChild(content);

    // 切換內容容器的可見性
    contentContainer.style.display = contentContainer.style.display === 'none' ? 'block' : 'none';
  });
});







  //確保當文檔完全加載完成後才運行 JavaScript 代碼。
  $(document).ready(function(){
  //切換明亮和暗黑模式
  $('button.mode-switch').click(function(){
    $('body').toggleClass('dark');
  });
  
  $(".btn-close-right").click(function () {
    $(".right-side").removeClass("show");
    $(".expand-btn").addClass("show");
  });
  
  $(".expand-btn").click(function () {
    $(".right-side").addClass("show");
    $(this).removeClass("show");
  });
});
      
      
      
      
  //leftbox    
      
        const friendsBtn = $('#leftmenu .friends');
  const chatbox = $('#chatbox');

  let chatboxVisible = false; // 初始狀態為隱藏

  // 為 friends 按鈕添加點擊事件監聽器
  friendsBtn.click(() => {
    // 切換 chatboxVisible 的值
    chatboxVisible = !chatboxVisible;

    // 根據 chatboxVisible 的值顯示或隱藏 chatbox 區塊
    chatbox.toggle(chatboxVisible);
  });
  
  
    //leftbox 
      
      
  
  
 
  
 	/*在載入完畢後，會創建一個隱藏的圖片物件 preloadbg，*/
    var preloadbg = document.createElement("img");
    preloadbg.src = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/timeline1.png";
    
	/*處理搜索欄位 #searchfield 和訊息輸入欄位 #sendmessage input 的焦點事件，當焦點進入時，清空預設的提示文字，焦點離開時，如果輸入為空，則恢復預設的提示文字。*/
      $("#searchfield").focus(function(){
          if($(this).val() == "Search contacts..."){
              $(this).val("");
          }
      });
      $("#searchfield").focusout(function(){
          if($(this).val() == ""){
              $(this).val("Search contacts...");
              
          }
      });
      
      $("#sendmessage input").focus(function(){
          if($(this).val() == "Send message..."){
              $(this).val("");
          }
      });
      $("#sendmessage input").focusout(function(){
          if($(this).val() == ""){
              $(this).val("Send message...");
              
          }
      });
          
      /*對每個 .friend 元素添加點擊事件處理器。當點擊朋友時，會執行以下操作：*/
      $(".friend").each(function(){		

		  /*複製被點擊朋友的頭像，並將其樣式設置為浮動，然後附加到 #chatbox 中。*/
          $(this).click(function(){
              var childOffset = $(this).offset();
              var parentOffset = $(this).parent().parent().offset();
              var childTop = childOffset.top - parentOffset.top;
              var clone = $(this).find('img').eq(0).clone();
              var top = childTop+12+"px";
              
              $(clone).css({'top': top}).addClass("floatingImg").appendTo("#chatbox");									
              
			  /*進行一系列的動畫效果，包括設置 #profile 的樣式和顯示聊天訊息的動畫效果。*/
              setTimeout(function(){$("#profile p").addClass("animate");$("#profile").addClass("animate");}, 100);
              setTimeout(function(){
                  $("#chat-messages").addClass("animate");
                  $('.cx, .cy').addClass('s1');
                  setTimeout(function(){$('.cx, .cy').addClass('s2');}, 100);
                  setTimeout(function(){$('.cx, .cy').addClass('s3');}, 200);			
              }, 150);														
              
			  /*點擊聊天朋友後，顯示相關的聊天內容和資訊*/           /*調整profile頭像位置*/
              $('.floatingImg').animate({
                  'width': "68px",
                  'left':'130px',
                  'top':'20px'
              }, 200);
              
			  /*從被點擊的朋友元素中獲取名字和電子郵件地址*/
              var name = $(this).find("p strong").html();
              var email = $(this).find("p span").html();	
			  
			  /*將獲取到的名字和電子郵件地址分別設置到聊天視窗中的對應元素中，用來顯示朋友的名字和電子郵件地址。*/
              $("#profile p").html(name);
              $("#profile span").html(email);			
              
			  /*這行程式碼用來設置聊天視窗中最後一條訊息的圖像，將其設置為被點擊的朋友的頭像。*/
              $(".message").not(".right").find("img").attr("src", $(clone).attr("src"));	
			  /*這兩行程式碼用來控制朋友列表的淡出效果和聊天視窗的淡入效果，實現在切換朋友時的視覺效果。*/								
              $('#friendslist').fadeOut();
              $('#chatview').fadeIn();
          
              
			  /*實現關閉聊天視窗時的動作*/
			  /*為關閉按鈕 #close 添加了一個點擊事件處理器。使用 unbind("click") 是為了確保在綁定新的點擊事件之前先解除舊的點擊事件，以防止事件重複綁定。*/
              $('#close').unbind("click").click(function(){		
				  /*除了聊天訊息區域、使用者資訊和使用者名稱的動畫效果。*/		
                  $("#chat-messages, #profile, #profile p").removeClass("animate");
				  /*移除了動畫效果中使用的樣式類名，以停止動畫效果。*/
                  $('.cx, .cy').removeClass("s1 s2 s3");
				  /*對浮動的頭像執行動畫效果，將其寬度調整為 40px，並且移回到原始位置，最後在動畫完成後將浮動的頭像移除。*/
                  $('.floatingImg').animate({
                      'width': "40px",
                      'top':top,
                      'left': '12px'
                  }, 200, function(){$('.floatingImg').remove()});				
                  
				  /*使用 setTimeout 函式來延遲執行一段程式碼，在50毫秒後，淡出聊天視窗 #chatview，同時淡入朋友列表 #friendslist。*/
                  setTimeout(function(){
                      $('#chatview').fadeOut();
                      $('#friendslist').fadeIn();				
                  }, 50);
              });
              
          });
      });
      
      
     


      
      
    </script>
			</div>
		</div>
</body>
</html>