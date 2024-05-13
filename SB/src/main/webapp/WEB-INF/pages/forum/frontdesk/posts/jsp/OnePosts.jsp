<%@ page import="com.forum.bean.PostsBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>單筆文章</title>
</head>
<body>
		<tbody>
                <c:forEach var="post" items="${updateSelect}">
                    <tr>
                        <td><c:out value="${post.categoriesBean.title_name}" /></td>
                        <td><c:out value="${post.title}" /></td>
                        <td><c:out value="${post.userBean.userChineseName}" /></td>
                        <td><c:out value="${post.update_date}" /></td>
                        <td><c:out value="${post.content}" /></td>
                        <td><c:out value="${post.view_count}" /></td>
                        <td><c:out value="${post.likesBean.size()}喜歡" /></td>
                        <td><img src="${post.userBean.avatar}" alt="User Avatar"></td>
                        <td><img src="http://localhost:8080/localimages/${post.image_url}"></td>
                        
                    <td>
						<form method="post" action="/likesFrontDesk/likeOrUnlike">
							<input type="hidden" name="user_no" value="${post.userBean.userNo}">
							<input type="hidden" name="post_no" value="${post.post_no}">
								<button type="submit">喜歡</button>
						</form>
					</td>

					<td>
    					<form method="post" action="/postsFrontDesk/DeletePosts" onsubmit="return confirm('您確定要刪除這個帖子嗎？');">
        					<input type="hidden" name="postsNo" value="${post.post_no}">
        					<input type="hidden" name="_method" value="delete">
        						<button type="submit">刪除</button>
    					</form>
					</td>

					<td>
						<form method="get" action="/postsFrontDesk/UpdateSelectPosts">
							<input type="hidden" name="postsNo" value="${post.post_no}">
								<button type="submit">編輯</button>
						</form>
					</td>





                        
					</tr>
                </c:forEach>
        </tbody>
        
        <script>
      
        </script>
</body>
</html>