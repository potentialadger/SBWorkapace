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
    <form method="get" action="/posts/OnePosts">
        查詢: <input type="text" name="postsBeanKeyword" required>
       	<button type="submit">送出</button>
    </form>   

    <form method="get" action="/posts/AllPosts">
        <button type="submit">查詢全部</button>
    </form>

    <form method="get" action="/forumManager.homepage">
    	<button type="submit">首頁</button>
	</form>
	
	<form method="get" action="/posts/InsertPostsCategories">
    	<button type="submit">新增</button>
	</form>

    <table>
        <thead>
            <tr>
                <!--<th>文章編號</th>-->
                <th>會員名稱</th>
                <th>會員信箱</th>
                <th>分類</th>
                <th>文章標題</th>
                <th>文章內容</th>
                <th>日期</th>
                <th>圖片</th>
                <th>瀏覽次數</th>
                <th>刪除</th>
            </tr>
        </thead>

        <tbody>
            <c:if test="${not empty postsM}">
                <c:forEach var="posts" items="${postsM}">
                    <tr>
                        <!--<td><c:out value="${posts.post_no}" /></td>-->
                        <td><c:out value="${posts.userBean.userChineseName}" /></td>
                        <td><c:out value="${posts.userBean.email}" /></td>
                        <td><c:out value="${posts.categoriesBean.title_name}" /></td>
                        <td><c:out value="${posts.title}" /></td>
                        <td><c:out value="${posts.content}" /></td>
                        <td><c:out value="${posts.update_date}" /></td>
                        <td><img src="http://localhost:8080/localimages/${posts.image_url}"  style="max-width: 200px; max-height: 200px;"></td>
                        <td><c:out value="${posts.view_count}" /></td>
                        
                        <td>
                            <form method="post" action="/posts/DeletePosts">
                                <input type="hidden" name="postsNo" value="${posts.post_no}">
                                <input type="hidden" name="_method" value="delete">
                                <button type="submit">刪除</button>
                            </form>
                        </td>
                        
                        <td>
							<form method="get" action="/reports/SelectReportsPosts">
							 <input type="hidden" name="postsNo" value="${posts.post_no}">
    						<button type="submit">檢舉</button>
							</form>
						</td>
                    	<td>
							<form method="post" action="/replies/InsertReplies">
							<input type="hidden" name="user_no" value="${posts.userBean.userNo}">
							<input type="hidden" name="post_no" value="${posts.post_no}"> 
							<h2>回覆表單：</h2>
							<textarea name="content" rows="4" cols="50" required></textarea><br>
							<input type="submit" value="提交回覆">
							</form>
						</td>
						<td>
						<form method="get" action="/posts/UpdateSelectPosts">
         				<input type="hidden" name="postsNo" value="${posts.post_no}">
         				<button type="submit">修改</button>
 						</form>
 						</td>
 						<td>
   						<form method="post" action="/likes/likeOrUnlike">
        				<input type="hidden" name="user_no" value="${posts.userBean.userNo}">
        				<input type="hidden" name="post_no" value="${posts.post_no}">
        				<button type="submit">喜歡</button>
    					</form>
						</td>
					</tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty postsM}">
                <tr>
                    <td colspan="10">尚無資料</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    
</body>
</html>