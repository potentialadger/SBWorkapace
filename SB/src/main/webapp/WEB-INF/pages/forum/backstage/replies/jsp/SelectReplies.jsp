<%@ page import="com.forum.bean.RepliesBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>回覆管理</title>

<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css"
    href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">

<!-- 引入 jQuery -->
<script type="text/javascript" charset="utf8"
    src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 引入 DataTables JS -->
<script type="text/javascript" charset="utf8"
    src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

<!-- DataTables initialization -->
<script>
    $(document).ready(function() {
        $('#repliesTable').DataTable(); // 初始化 DataTables
    });
</script>
</head>
<body>
<h1>回覆管理</h1>

<!--  
    <br>
    <form method="get" action="/replies/OneReplies">
        查詢: <input type="text" name="repliesBeanKeyword" required>
       	<button type="submit">送出</button>
    </form>   
-->

<!-- 
    <form method="get" action="/replies/AllReplies">
        <button type="submit">查詢全部</button>
    </form>
-->

    
    <form method="get" action="/posts/AllPosts">
        <button type="submit">所有文章</button>
    </form>


    <table id="repliesTable">
        <thead>
            <tr>
                <th>文章標題</th>
                <th>回覆內容</th>
                <th>日期</th>
                <th>會員名稱</th>
                <th>會員信箱</th>
            </tr>
        </thead>

        <tbody>
            <c:if test="${not empty repliesM}">
                <c:forEach var="replies" items="${repliesM}">
                    <tr>
                        
                        <td><c:out value="${post.title}" /></td>
                        <td><c:out value="${replies.content}" /></td>
                        <td><c:out value="${replies.update_date}" /></td>
                        <td><c:out value="${replies.userBean.userChineseName}" /></td>
                        <td><c:out value="${replies.userBean.email}" /></td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty repliesM}">
                <tr>
                    <td colspan="5">尚無資料</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    
</body>
</html>