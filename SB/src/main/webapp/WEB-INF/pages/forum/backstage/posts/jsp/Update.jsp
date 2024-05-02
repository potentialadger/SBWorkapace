<%@ page import="com.forum.bean.PostsBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改資料</title>
</head>
<body>
<h1>修改資料</h1>
<form method="post" action="/posts/UpdatePosts">
<input type="hidden" name="_method" value="PUT">
    
   	<input type="hidden" name="post_no" value="${updateSelect.post_no}"/><br>
    
    <input type="hidden" name="user_no" value="${updateSelect.userBean.userNo}"/><br>
    
   	<label for="category_no">分類 :</label><br>
	<select name="category_no">
    <c:forEach var="category" items="${categoriesList}">
    <option value="${category.category_no}" ${category.category_no == updateSelect.categoriesBean.category_no ? 'selected' : ''}>${category.title_name}</option>
    </c:forEach>
	</select><br>
    
    <label for="title">標題 :</label><br>
    <input type="text" name="title" value="${updateSelect.title}"/><br>
    
    <label for="content">內文 :</label><br>
    <input type="text" name="content" value="${updateSelect.content}"/><br>
    
    <label for="image_url">圖片 :</label><br>
    <input type="text" name="image_url" value="${updateSelect.image_url}"/><br>
    
    <label for="update_date">日期 :</label><br>
    <input type="text" name="update_date" value="${updateSelect.update_date}" readonly/><br>
    
     <label for="view_count">瀏覽次數 :</label><br>
    <input type="text" name="view_count" value="${updateSelect.view_count}" readonly/><br>
    
    <input type="submit" value="修改" />
</form>
</body>
</html>