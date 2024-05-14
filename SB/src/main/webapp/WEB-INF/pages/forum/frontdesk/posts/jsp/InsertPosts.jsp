<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>文章資料</title>
</head>
<body>
   <form method="post" action="/postsFrontDesk/InsertPosts" enctype="multipart/form-data" onsubmit="return confirmPublish()">
    <label for="title">新增文章標題 :</label><br>
    <input type="text" id="title" name="title" required /><br>
    
    <label for="content">新增文章內容 :</label><br>
    <textarea id="content" name="content" rows="5" cols="50" required></textarea><br>
    
    <label for="category_no">分類 :</label><br>
    <select id="category_no" name="category_no">
        <c:forEach var="category" items="${categoriesList}">
            <option value="${category.category_no}" ${category.category_no == updateSelect.categoriesBean.category_no ? 'selected' : ''}>${category.title_name}</option>
        </c:forEach>
    </select><br>
    
    <label for="image_url">新增圖片：</label><br>
    <input type="file" id="image_url" name="image_url" /><br>
    
    <input type="submit" value="發佈" />
    
</form>
    <form method="get" action="/postsFrontDesk/AllPosts">
		<button type="submit">返回</button>
	</form>
	
	<script>
    function confirmPublish() {
        return confirm("確定要發佈這篇文章嗎？");
    }
	</script>
</body>
</html>