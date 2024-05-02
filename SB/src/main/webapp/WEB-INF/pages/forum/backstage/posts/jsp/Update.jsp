<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改資料</title>
</head>
<body>
<h1>修改資料</h1>
<form method="post" action="/posts/UpdatePosts">
    <input type="hidden" name="_method" value="PUT">
    <label for="post_no">文章編號 :</label><br>
    <input type="text" id="post_no" name="post_no" value="${update.post_no}" readonly/><br>    
    <label for="user_no">會員 :</label><br>
    <input type="text" id="user_no" name="user_no" value="${update.user_no}" readonly/><br>    
    <label for="category_no">分類 :</label><br>
    <input type="text" id="category_no" name="category_no" value="${update.category_no}"/><br>   
    <label for="title">文章標題 :</label><br>
    <input type="text" id="title" name="title" value="${update.title}"/><br>    
    <label for="content">文章內容 :</label><br>
    <textarea id="content" name="content" rows="6" cols="50">${update.content}</textarea><br>    
    <label for="creation_date">創建日期 :</label><br>
    <input type="text" id="creation_date" name="creation_date" value="${update.creation_date}"readonly/><br>    
    <label for="view_count">瀏覽次數 :</label><br>
    <input type="text" id="view_count" name="view_count" value="${update.view_count}"readonly/><br>   
    <label for="like_count">喜歡次數 :</label><br>
    <input type="text" id="like_count" name="like_count" value="${update.like_count}"readonly/><br>   
    <label for="status">文章狀態 :</label><br>
    <input type="text" id="status" name="status" value="${update.status}"/><br>    
    <input type="submit" value="修改" />
</form>
</body>
</html>