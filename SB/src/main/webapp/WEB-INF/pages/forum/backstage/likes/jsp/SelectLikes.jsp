<%@ page import="com.forum.bean.LikesBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>喜歡紀錄管理</title>

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
        $('#likesTable').DataTable(); // 初始化 DataTables
    });
</script>
</head>
<body>
<h1>喜歡紀錄</h1>
    <br>

     <form method="get" action="/posts/AllPosts">
        <button type="submit">返回</button>
    </form>

    <table id="likesTable">
        <thead>
            <tr>
                <th>文章標題</th>
                <th>文章內容</th>
                <th>案讚會員</th>
                <th>會員信箱</th>
            </tr>
        </thead>

        <tbody>
            <c:if test="${not empty PostsLikesListM}">
                <c:forEach var="postsLikes" items="${PostsLikesListM}">
                    <tr>
                        <td><c:out value="${post.title}" /></td>
                        <td><c:out value="${post.content}" /></td>
                        <td><c:out value="${postsLikes.userBean.userChineseName}" /></td>
                        <td><c:out value="${postsLikes.userBean.email}" /></td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty PostsLikesListM}">
                <tr>
                    <td colspan="4">尚無資料</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    
</body>
</html>