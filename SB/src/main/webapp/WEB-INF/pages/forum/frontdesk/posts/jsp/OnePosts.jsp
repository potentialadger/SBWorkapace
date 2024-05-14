<%@ page import="com.forum.bean.PostsBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>單筆文章</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

  					<form method="get" action="/postsFrontDesk/AllPosts">
						<button type="submit">返回</button>
					</form>
                
                <c:forEach var="post" items="${updateSelect}">
                    <tr>
                        <td><c:out value="${post.categoriesBean.title_name}" /></td>
                        <td><c:out value="${post.title}" /></td>
                        <td><c:out value="${post.userBean.userChineseName}" /></td>
                        <td><c:out value="${post.update_date}" /></td>
                        <td><c:out value="${post.content}" /></td>
                        <td><c:out value="${post.view_count}" /></td>
                        <td><span id="likesCount${post.post_no}">${post.likesBean.size()}</span> 喜歡</td>
                        <td><img  class="avatar" src="http://localhost:8080/localimages/${post.userBean.avatar} "alt="" style="width:300px">>
                        <td><img src="http://localhost:8080/localimages/${post.image_url}"></td>
                        
                   <td>
    					<button class="like-btn" onclick="likeOrUnlike(${post.post_no})">喜歡</button>
				   </td>
					
				

					<td>
    					<form method="post" action="/postsFrontDesk/DeletePosts" onsubmit="return confirm('您確定要刪除這個帖子嗎？');">
        					<input type="hidden" name="postsNo" value="${post.post_no}">
        					<input type="hidden" name="_method" value="delete">
        					<button type="submit" ${post.userBean.userNo==userNo?"":"hidden"}>刪除</button>
    					</form>
					</td>

					<td>
						<form method="get" action="/postsFrontDesk/UpdateSelectPosts">
							<input type="hidden" name="postsNo" value="${post.post_no}">
								<button type="submit" ${post.userBean.userNo==userNo?"":"hidden"}>編輯</button>
						</form>
					</td>

					</tr>
                </c:forEach>
        
        <script>
        function likeOrUnlike(post_no) {
            $.ajax({
                url: "/likesFrontDesk/likeOrUnlike?post_no=" + post_no, // 修改 AJAX 请求路径
                method: 'POST',
                success: function (response) {
                    var likesCountSpan = document.getElementById('likesCount' + post_no);
                    var currentLikesCount = parseInt(likesCountSpan.innerText);
                    
                 	// 根據響應信息判斷是喜歡還是取消喜歡，並更新喜歡數量
                    if (response === "Liked") {
                    	// 喜歡帖子，喜歡數加1
                        likesCountSpan.innerText = currentLikesCount + 1;
                    } else if (response === "Unliked") {
                    	 // 取消喜歡帖子，喜歡數減1
                        likesCountSpan.innerText = currentLikesCount - 1;
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
        </script>
</body>
</html>