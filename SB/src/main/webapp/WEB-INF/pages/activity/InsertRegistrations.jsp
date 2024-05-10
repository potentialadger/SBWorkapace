<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>活動報名表單</title>
    <script>
        function setCurrentTime() {
            var now = new Date();
            var year = now.getFullYear();
            var month = ('0' + (now.getMonth() + 1)).slice(-2);
            var day = ('0' + now.getDate()).slice(-2);
            var hour = ('0' + now.getHours()).slice(-2);
            var minute = ('0' + now.getMinutes()).slice(-2); 
            var datetimeLocal = year + '-' + month + '-' + day + 'T' + hour + ':' + minute;
            document.getElementById('registrationTime').value = datetimeLocal;
        }
        window.onload = setCurrentTime;
    </script>
</head>
<body>
    <div align="center">
        <h1>活動報名</h1>
        <form action="InsertRegistrations" method="post" enctype="multipart/form-data">
            <label for="eventNo">活動編號：</label>
            <input type="number" id="eventNo" name="eventNo" value="<%= request.getParameter("eventNo") %>" required readonly><br>
            <label for="userNo">用戶編號：</label>
            <input type="number" id="userNo" name="userNo" value="<%= request.getParameter("userNo") %>" required readonly><br>
            <label for="participantName">參與者姓名：</label>
            <input type="text" id="participantName" name="participantName" required><br>
            <label for="contactInfo">聯絡電話：</label>
            <input type="text" id="contactInfo" name="contactInfo" required><br>
            <label for="registrationTime">註冊時間：</label>
            <input type="datetime-local" id="registrationTime" name="registrationTime" required readonly><br>
            <button type="submit">提交報名</button>
        </form>
    </div>
</body>
</html>
