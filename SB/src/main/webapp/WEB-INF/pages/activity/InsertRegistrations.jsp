<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>活動報名</title>
</head>

<body>
    <h1>活動報名</h1>
    <c:if test="${not empty errorMessage}">
        <p style="color:red;">${errorMessage}</p>
    </c:if>
    <form action="/InsertRegistrations" method="post">
        <p>活動編號: <input type="text" name="eventNo" value="${event.eventNo}"></p>
        <p>會員編號: <input type="text" name="userNo" value="${hostUserNo}"></p>
        <p>參加者姓名: <input type="text" name="participantName" required></p>
        <p>聯絡電話: <input type="text" name="contactInfo" required></p>
    <input type="hidden" name="registrationTime" value="${LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME)}">
        <button type="submit">提交報名</button>
    </form>
</body>

</html>
