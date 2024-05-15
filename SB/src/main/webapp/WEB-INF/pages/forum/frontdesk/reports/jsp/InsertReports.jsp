<%@ page import="com.forum.bean.ReportsBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>檢舉資料</title>
</head>
<body>
   <form method="post" action="/reportsFrontDesk/InsertReports" onsubmit="return confirmSubmission()">
	<input type="hidden" name="post_no" value="${reportsPosts.post_no}"> 
    <!--<input type="hidden" name="user_no" value="${userData.userNo}">-->
    <label for="reason">檢舉原因 :</label><br>
    <textarea id="reason" name="reason" rows="5" cols="50" required></textarea><br>
    
    <input type="submit" value="提交" />
       
</form>

   <script>
        function confirmSubmission() {
            return confirm("您確定要檢舉嗎？");
        }
    </script>
    
</body>
</html>