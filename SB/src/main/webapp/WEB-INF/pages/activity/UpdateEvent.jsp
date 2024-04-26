<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    
    <%DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm"); %>
    <jsp:useBean id="event" scope="request" class="com.activity.bean.EventBean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Event</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f0f0;
    color: #333;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
}

h2 {
    color: #222;
    font-size: 2rem; 
    margin: 10px 0;
}

form {
    background-color: #fff;
    padding: 15px; 
    border-radius: 5px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin: 5px; 
    width: 300px; 
}

label {
    margin-top: 5px; 
    color: #555;
}

input[type="text"],
input[type="datetime-local"],
textarea {
    padding: 6px;
    margin-top: 3px; 
    margin-bottom: 10px; 
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

textarea {
    height: 80px; 
    resize: vertical;
}

input[type="submit"] {
    padding: 10px 20px; 
    margin-top: 10px;
 
}


@media (max-width: 600px) {
    form {
        width: 90%;
    }
}



    </style>
</head>
<body>
 <div align="center">
  <h2>更改活動內容</h2>
	<form method="post" action="UpdateEvent">
	<input type="hidden" name="_method" value="put">
		<label for="eventNo">活動編號:</label><br>
        <input type="text" id="eventNo" name="eventNo" value="${event.eventNo}" readonly ><br>
        <label for="hostUserNo">發起人:</label><br>
        <input type="text" id="hostUserNo" name="hostUserNo" value="${event.hostUserNo}" ><br>
		
		<label for="title">標題:</label><br>
        <input type="text" id="title" name="title" value="${event.title}" ><br>
        <label for="description">描述:</label><br>
        <textarea id="description" name="description">${event.description}</textarea><br>
        <label for="activityTime">活動時間:</label><br>
        <input type="datetime-local" id="activityTime" name="activityTime" value="<%= dtf.format(event.getActivityTime())%>"><br>
        <label for="signupStartTime">報名開始時間:</label><br>
        <input type="datetime-local" id="signupStartTime" name="signupStartTime" value="<%= dtf.format(event.getSignupStartTime())%>"><br>
        <label for="signupEndTime">報名結束時間 :</label><br>
        <input type="datetime-local" id="signupEndTime" name="signupEndTime" value="<%= dtf.format(event.getSignupEndTime())%>"><br>
        <label for="location">地點:</label><br>
        <input type="text" id="location" name="location" value="${event.location}"><br>
        <label for="status">狀態:</label><br>
        <input type="text" id="status" name="status" value="${event.status}"><br>
        <input type="submit" value="確定">
	</form>
	</div>
</body>
</html>