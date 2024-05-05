<%@ page import="com.forum.bean.ReportsBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>檢舉管理</title>
</head>
<body>
<h1>檢舉管理</h1>
    <br>
    
    <form method="get" action="/reports/AllReports">
        <button type="submit">檢舉紀錄</button>
    </form>

    <form method="get" action="/forumManager.homepage">
    	<button type="submit">首頁</button>
	</form>

    <table>
        <thead>
            <tr>
                <th>檢舉編號</th>
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
                        <td><c:out value="${reports.report_no}" /></td>
                        <td><c:out value="${reports.postsBean.title}" /></td>
                        <td><c:out value="${reports.postsBean.content}" /></td>
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
                    <td colspan="8">尚無資料</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    
</body>
</html>