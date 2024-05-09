<%@ page import="com.forum.bean.ReportsBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>檢舉管理</title>

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
        $('#reportsTable').DataTable(); // 初始化 DataTables
    });
</script>
</head>
<body>
<h1>檢舉管理</h1>
    <br>
<!--  
    <form method="get" action="/reports/AllReports">
        <button type="submit">檢舉紀錄</button>
    </form>
-->
    <form method="get" action="/posts/AllPosts">
        <button type="submit">返回</button>
    </form>

    <table id="reportsTable">
        <thead>
            <tr>
                <th>文章標題</th>
                <th>文章內容</th>
                <th>檢舉人</th>
                <th>檢舉人信箱</th>
                <th>檢舉原因</th>
                <th>檢舉日期</th>
                <th>刪除</th>
            </tr>
        </thead>

        <tbody>
            <c:if test="${not empty reportsM}">
                <c:forEach var="reports" items="${reportsM}">
                    <tr>
                        <td><c:out value="${post.title}" /></td>
                        <td><c:out value="${post.content}" /></td>
                        <td><c:out value="${reports.userBean.userChineseName}" /></td>
                        <td><c:out value="${reports.userBean.email}" /></td>
                        <td><c:out value="${reports.reason}" /></td>
                        <td><c:out value="${reports.report_date}" /></td>

                        <td>
                            <form method="post" action="/reports/DeleteReports">
                                <input type="hidden" name="postNo" value="${reports.postsBean.post_no}">
                                <input type="hidden" name="reportNo" value="${reports.report_no}">
                                <input type="hidden" name="_method" value="delete">
                                <button type="submit">刪除</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty reportsM}">
                <tr>
                    <td colspan="7">尚無資料</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    
</body>
</html>