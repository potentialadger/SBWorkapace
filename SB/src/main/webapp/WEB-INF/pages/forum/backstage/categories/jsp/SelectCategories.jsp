<%@ page import="com.forum.bean.CategoriesBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分類版管理</title>

<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- DataTables JS -->
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

<!-- DataTables initialization -->
<script>
	$(document).ready(function() {
		$('#categoriesTable').DataTable(); // 初始化 DataTables
	});
</script>
</head>
<body>
<h1>分類版管理</h1>

<!--
<br>
<form method="get" action="/CategoriesController/OneCategories">
    查詢: <input type="text" name="categoryKeyword" required>
    <button type="submit">送出</button>
</form>
-->
<!--
<form method="get" action="/CategoriesController/CategoriesAll">
    <button type="submit">查詢全部</button>
</form>
-->

<form method="get" action="/forum.InsertCategories">
    <button type="submit">新增</button>
</form>

<form method="get" action="/forumManager.homepage">
    <button type="submit">首頁</button>
</form>

<table id="categoriesTable">
    <thead>
    <tr>
        <th>分類</th>
        <th>刪除</th>
        <th>文章</th>
    </tr>
    </thead>

    <tbody>
    <c:if test="${not empty CategoriesM}">
        <c:forEach var="category" items="${CategoriesM}">
            <tr>
                <td><c:out value="${category.title_name}"/></td>

                <td>
                    <form method="post" action="/CategoriesController/DeleteCategories">
                        <input type="hidden" name="categoryNo" value="${category.category_no}">
                        <input type="hidden" name="_method" value="delete">
                        <button type="submit">刪除</button>
                    </form>
                </td>
				<td>
					<form method="get" action="/posts/CategoriesPosts">
						<input type="hidden" name="categoryNo" value="${category.category_no}">
						<button type="submit">文章</button>
					</form>
				</td>
					</tr>
        </c:forEach>

    </c:if>
    <c:if test="${noData}">
        <tr>
            <td colspan="3">尚無資料</td>
        </tr>
    </c:if>
    </tbody>
</table>
</body>
</html>