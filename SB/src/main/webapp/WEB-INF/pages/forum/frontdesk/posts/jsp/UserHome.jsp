<%@ page import="com.forum.bean.PostsBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首頁</title>
<style>
.forum-container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

.search-form {
	margin-bottom: 20px;
}

.forum-posts {
	display: flex;
	flex-direction: column;
}

.post {
	border: 1px solid #ccc;
	margin-bottom: 20px;
	padding: 10px;
}

.post-date {
	font-size: 14px;
	color: #888;
}

.post-title {
	font-size: 18px;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 10px;
}

.post-content {
	font-size: 16px;
	margin-bottom: 10px;
}

.post-image img {
	max-width: 100%;
	height: auto;
	float: right;
	margin-left: 10px;
}

.post-footer {
	font-size: 14px;
	color: #888;
	margin-top: 10px;
}

.post-footer div {
	display: inline-block;
	margin-right: 10px;
}
</style>
</head>
<body>

	<div class="forum-container">
		<form class="search-form" method="get" action="/postsFrontDesk/OnePosts">
			查詢: <input type="text" name="postsBeanKeyword" required>
			<button type="submit">送出</button>
		</form>
		
		<form method="get" action="/postsFrontDesk/AllPosts">
			<button type="submit">全部文章</button>
		</form>

		<div class="forum-posts">
			<c:forEach var="post" items="${postsM}">
				<div class="post">
					<div class="post-date">${post.update_date}</div>
					<div class="post-title">${post.title}</div>
					<div class="post-content">${post.content}</div>
					<div class="post-image">
						<img src="${post.image_url}" alt="Post Image">
					</div>
					<div class="post-footer">
						<div class="post-likes">${post.likesBean.size()}likes</div>
						<div class="post-views">${post.view_count}views</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>