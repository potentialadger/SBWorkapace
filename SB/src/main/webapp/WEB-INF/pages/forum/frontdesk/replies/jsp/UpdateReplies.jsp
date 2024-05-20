<%@ page import="com.forum.bean.RepliesBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>編輯回覆:${updateSelect.postsBean.title}</title>

</head>
<body>
<h1>修改資料</h1>
<form method="post" action="/repliesFrontDesk/UpdateReplies">
<input type="hidden" name="_method" value="PUT">
    
   	<input type="hidden" name="reply_no" value="${updateSelect.reply_no}"/><br>
   	
   	<input type="hidden" name="post_no" value="${updateSelect.postsBean.post_no}"/><br>
    
    <input type="hidden" name="user_no" value="${updateSelect.userBean.userNo}"/><br>
    
    <label for="content">內文 :</label><br>
    <input type="text" name="content" value="${updateSelect.content}"/><br>

    <label for="update_date">日期 :</label><br>
    <input type="text" name="update_date" value="${updateSelect.update_date}" readonly/><br>
    
    <input type="submit" value="送出" onclick="return confirmSubmission();"/>
</form>

<button onclick="goBack()">返回</button>
	<script>
		function goBack() {
			window.history.back();
		}
		
		function confirmSubmission() {
		    return confirm("您確定要更改嗎？");
		}
	</script>
</body>
</html>