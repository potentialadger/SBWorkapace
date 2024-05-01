<%@ page import="com.forum.bean.PostsBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章資料查詢</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    form {
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
    <br>
    <form style="float: left;" method="get" action="/posts/OnePosts">
        輸入文章編號: <input type="text" name="postNo" required>
        <button type="submit">查詢單筆資料</button>
    </form>

    <form method="get" action="/posts/PostAll">
        <button type="submit">查詢全部資料</button>
    </form>

    <a href="/forum.homepage"><button>回首頁</button></a>

    <table>
        <thead>
            <tr>
                <th>文章編號</th>
                <th>會員</th>
                <th>分類</th>
                <th>文章標題</th>
                <th>文章內容</th>
                <th>創建日期</th>
                <th>瀏覽次數</th>
                <th>喜歡次數</th>
                <th>文章狀態</th>
                <th>刪除</th>
                <th>修改</th>
            </tr>
        </thead>

        <tbody>
            <c:if test="${not empty posts}">
                <c:forEach var="post" items="${posts}">
                    <tr>
                        <td><c:out value="${post.post_no}" /></td>
                        <td><c:out value="${post.user_no}" /></td>
                        <td><c:out value="${post.category_no}" /></td>
                        <td><c:out value="${post.title}" /></td>
                        <td><c:out value="${post.content}" /></td>
                        <td><c:out value="${post.creation_date}" /></td>
                        <td><c:out value="${post.view_count}" /></td>
                        <td><c:out value="${post.like_count}" /></td>
                        <td><c:out value="${post.status}" /></td>

                        <td>
                            <form method="post" action="/posts/DeletePosts">
                                <input type="hidden" name="postno" value="${post.post_no}">
                                <input type="hidden" name="_method" value="delete">
                                <button type="submit">刪除</button>
                            </form>
                        </td>
                        <td>
                            <form method="get" action="/posts/SelectUpdatePosts">
                                <input type="hidden" name="postNo" value="${post.post_no}">
                                <button type="submit">修改</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty posts}">
                <tr>
                    <td colspan="11">尚無資料</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    
</body>
</html>