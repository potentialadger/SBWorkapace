<%@ page import="com.forum.bean.PostsBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首頁</title>
</head>
<body>
	<div>
		<form method="get" action="/OnePosts/postsFrontDesk">
			查詢: <input type="text" name="postsBeanKeyword" required>
			<button type="submit">送出</button>
		</form>

		<table>

			<thead>
				<tr>
					<th>分類</th>
					<th>文章標題</th>
					<th>文章內容</th>
					<th>日期</th>
					<th>會員名稱</th>
					<th>瀏覽次數</th>
					<th>喜歡次數</th>
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
							<td><c:out value="${posts.view_count}" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>