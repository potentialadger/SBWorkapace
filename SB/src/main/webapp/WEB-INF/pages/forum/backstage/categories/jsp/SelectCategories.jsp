<%@ page import="com.forum.bean.CategoriesBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分類版管理</title>
</head>
<body>
	<form method="get" action="/CategoriesController/OneCategories">
        查詢: <input type="text" name="categoryKeyword" required>
        <button type="submit">送出</button>
    </form>
    
  	<form action="/forum/backstage/ManagerHome.html">
    	<button type="submit">新增分類</button>
	</form>

    <form method="get" action="/CategoriesController/CategoriesAll">
        <button type="submit">查詢全部</button>
    </form>
	
</body>
</html>