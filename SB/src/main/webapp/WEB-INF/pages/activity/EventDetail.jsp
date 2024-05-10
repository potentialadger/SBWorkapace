<%@page import="com.activity.bean.EventBean"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"); 
EventBean event = (EventBean) request.getAttribute("event");
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>活動詳情</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f7f6;
            margin-top: 20px;
            font-family: Arial, sans-serif;
            color: #333;
            display: flex;
            justify-content: center;
        }
        .card {
            background: #fff;
            transition: .5s;
            border: 0;
            margin-bottom: 30px;
            border-radius: .55rem;
            position: relative;
            width: 100%;
            box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
        }
        .container {
            max-width: 1000px;
            padding: 20px;
        }
        .card-body {
            padding: 20px;
        }
        .card-body h2 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }
        .card-body p {
            margin: 5px 0;
        }
        .media-img-wrap {
            width: 250px; /* 增大圖片寬度 */
            height: 250px; /* 增大圖片高度 */
            overflow: hidden;
            border-radius: 50%;
            margin-right: 20px;
        }
        .media-img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .signup-button {
            display: inline-block;
            padding: 5px 10px;
            margin-left: 10px;
            border: none;
            border-radius: 3px;
            background-color: #28a745;
            color: #fff;
            text-decoration: none;
            text-align: center;
            cursor: pointer;
        }
        .signup-button:hover {
            background-color: #218838;
        }
        .details-button {
            display: block;
            padding: 10px;
            margin: 10px auto;
            border: none;
            border-radius: 3px;
            background-color: #3b76e1;
            color: #fff;
            text-decoration: none;
            text-align: center;
            cursor: pointer;
            width: 80%;
        }
        .details-button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>活動詳情</h1>
        <div class="card card-lg">
            <div class="card-body">
                <div class="user-activity">
                    <div class="media">
                        <div class="media-img-wrap">
                            <img src="/localimages/<%= event.getImagePath() %>" alt="活動圖片">
                        </div>
                        <div class="media-body">
                            <h2 class="mt-0"><%= event.getTitle() %></h2>
                            <p><strong>描述:</strong> <%= event.getDescription() %></p>
                            <p><strong>活動時間:</strong> <%= event.getActivityTime().format(dtf) %></p>
                            <p><strong>報名開始時間:</strong> <%= event.getSignupStartTime().format(dtf) %></p>
                            <p><strong>報名結束時間:</strong> <%= event.getSignupEndTime().format(dtf) %></p>
                            <p><strong>活動地點:</strong> <%= event.getLocation() %></p>
                            <p>
                                <strong>活動狀態:</strong> <%= event.getStatus() %>
                                <a href="/activityInsertRegistrations?eventNo=<%= event.getEventNo() %>&userNo=<%= event.getHostUserNo() %>" class="signup-button">我要報名</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="activityList" class="details-button">返回活動列表</a>
    </div>
</body>
</html>
