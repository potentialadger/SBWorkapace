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
					</tr>
                </c:forEach>
        </tbody>
</body>
</html>