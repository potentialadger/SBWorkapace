<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>重複檢舉警告</title>
</head>
<body>
<h1>重複檢舉</h1>

<form method="get" action="/postsFrontDesk/SelectPosts">
    <input type="hidden" name="postsNo" value="${postNo.post_no}">
    <button type="submit">返回</button>
</form>

</body>
</html>