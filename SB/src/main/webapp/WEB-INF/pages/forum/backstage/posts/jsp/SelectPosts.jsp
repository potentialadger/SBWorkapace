<%@ page import="com.forum.bean.PostsBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章管理</title>

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
        $('#postsTable').DataTable(); // 初始化 DataTables
    });
</script>
</head>
<body>
<h1>文章管理</h1>

<!--  
    <br>
    <form method="get" action="/posts/OnePosts">
        查詢: <input type="text" name="postsBeanKeyword" required>
        <button type="submit">送出</button>
    </form>   
-->

 <!-- 
    <form method="get" action="/posts/AllPosts">
        <button type="submit">查詢全部</button>
    </form>
-->

     <form method="get" action="/CategoriesController/CategoriesAll">
        <button type="submit">返回</button>
    </form>
    
    <table id="postsTable">
        <thead>
            <tr>
                <th>分類</th>
                <th>文章標題</th>
                <th>文章內容</th>
                <th>日期</th>
                <th>會員名稱</th>
                <th>會員信箱</th>
                <th>瀏覽次數</th>
                <th>回覆</th>
                <th>檢舉紀錄</th>
                <th>喜歡紀錄</th>
            </tr>
        </thead>

        <tbody>
            <c:if test="${not empty postsM}">
                <c:forEach var="posts" items="${postsM}">
                    <tr>
                        <td><c:out value="${categories.title_name}" /></td>
                        <td><c:out value="${posts.title}" /></td>
                        <td><c:out value="${posts.content}" /></td>
                        <td><c:out value="${posts.update_date}" /></td>
                        <td><c:out value="${posts.userBean.userChineseName}" /></td>
                        <td><c:out value="${posts.userBean.email}" /></td>
                        <td><c:out value="${posts.view_count}" /></td>
                        
                     <td>
						<form method="get" action="/replies/PostsReplies">
						<input type="hidden" name="postsNo" value="${posts.post_no}">
						<button type="submit">回覆</button>
						</form>
					</td>
					
					 <td>
						<form method="get" action="/reports/PostsReports">
						<input type="hidden" name="postsNo" value="${posts.post_no}">
						<button type="submit">檢舉紀錄</button>
						</form>
					</td>

						<td>
							<form method="get" action="/likes/PostsLikes">
								<input type="hidden" name="postsNo" value="${posts.post_no}">
								<button type="submit">喜歡紀錄</button>
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