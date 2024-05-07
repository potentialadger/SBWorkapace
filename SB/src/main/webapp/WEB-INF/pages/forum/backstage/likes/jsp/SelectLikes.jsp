<%@ page import="com.forum.bean.LikesBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>喜歡紀錄管理</title>
</head>
<body>
<h1>喜歡紀錄</h1>
    <br>

    <form method="get" action="/forumManager.homepage">
    	<button type="submit">首頁</button>
	</form>

    <table>
        <thead>
            <tr>
                <th>紀錄編號</th>
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
                        <td><c:out value="${postsLikes.like_no}" /></td>
                        <td><c:out value="${postsLikes.postsBean.title}" /></td>
                        <td><c:out value="${postsLikes.postsBean.content}" /></td>
                        <td><c:out value="${postsLikes.userBean.userChineseName}" /></td>
                        <td><c:out value="${postsLikes.userBean.email}" /></td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty PostsLikesListM}">
                <tr>
                    <td colspan="5">尚無資料</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    
</body>
</html>