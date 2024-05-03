<%@ page import="com.forum.bean.PostsBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章管理</title>
</head>
<body>
<h1>文章管理</h1>
    <br>
    <form method="get" action="/replies/OneReplies">
        查詢: <input type="text" name="repliesBeanKeyword" required>
       	<button type="submit">送出</button>
    </form>   

    <form method="get" action="/replies/AllReplies">
        <button type="submit">查詢全部</button>
    </form>

    <form method="get" action="/forumManager.homepage">
    	<button type="submit">首頁</button>
	</form>

    <table>
        <thead>
            <tr>
                <th>回覆編號</th>
                <th>會員名稱</th>
                <th>會員信箱</th>
                <th>文章標題</th>
                <th>內容</th>
                <th>日期</th>
                <th>刪除</th>
            </tr>
        </thead>

        <tbody>
            <c:if test="${not empty repliesM}">
                <c:forEach var="replies" items="${repliesM}">
                    <tr>
                        <td><c:out value="${replies.reply_no}" /></td>
                        <td><c:out value="${replies.userBean.userChineseName}" /></td>
                        <td><c:out value="${replies.userBean.email}" /></td>
                        <td><c:out value="${replies.postsBean.title}" /></td>
                        <td><c:out value="${replies.content}" /></td>
                        <td><c:out value="${replies.update_date}" /></td>

                        <td>
                            <form method="post" action="/replies/DeleteReplies">
                                <input type="hidden" name="repliesNo" value="${replies.reply_no}">
                                <input type="hidden" name="_method" value="delete">
                                <button type="submit">刪除</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty postsM}">
                <tr>
                    <td colspan="7">尚無資料</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    
</body>
</html>