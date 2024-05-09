<%@page import="com.activity.bean.EventBean"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"); %>
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
        .file_manager .file a:hover .hover,
        .file_manager .file .file-name small {
            display: block;
        }
        .file_manager .file {
            padding: 0 !important;
            position: relative;
            border-radius: .55rem;
            overflow: hidden;
            background-size: cover;
            background-position: top;
        }
        .file_manager .file .image,
        .file_manager .file .icon {
            max-height: 180px;
            overflow: hidden;
            background-size: cover;
            background-position: top;
        }
        .file_manager .file .hover {
            position: absolute;
            right: 10px;
            top: 10px;
            display: none;
            transition: all 0.2s ease-in-out;
        }
        .file_manager .file a:hover .hover {
            transition: all 0.2s ease-in-out;
        }
        .file_manager .file .icon {
            padding: 15px 10px;
            display: table;
            width: 100%;
        }
        .file_manager .file .icon i {
            display: table-cell;
            font-size: 30px;
            vertical-align: middle;
            color: #777;
            line-height: 100px;
        }
        .file_manager .file .file-name {
            padding: 10px;
            border-top: 1px solid #f7f7f7;
        }
        .file_manager .file .file-name small .date {
            float: right;
        }
        .folder {
            padding: 20px;
            display: block;
            color: #777;
        }
        @media only screen and (max-width: 992px) {
            .file_manager .nav-tabs {
                padding-left: 0;
                padding-right: 0;
            }
            .file_manager .nav-tabs .nav-item {
                display: inline-block;
            }
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
        a:hover {
            text-decoration: none;
        }
        ul {
            list-style: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }
        li {
            margin: 10px;
            padding: 0;
            width: calc(25% - 20px);
            background-color: #fff;
            border-radius: .55rem;
            box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
        }
        img {
            display: block;
            width: 100%;
            border-bottom: 1px solid #f7f7f7;
        }
        .file-name {
            padding: 10px;
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
        .media-body {
            word-wrap: break-word;
            overflow: hidden;
        }
        .card-body {
            overflow: hidden;
            padding: 20px;
        }
        .card-body h2 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }
        .card-body p {
            margin: 5px 0;
        }
        .container {
            max-width: 1000px; /* 調整這裡的寬度 */
            padding: 20px;
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
                            <div class="avatar avatar-lg">
                                <img src="/localimages/<%= ((EventBean) request.getAttribute("event")).getImagePath() %>" alt="活動圖片" class="avatar-img rounded-circle">
                            </div>
                        </div>
                        <div class="media-body">
                            <h2 class="mt-0"><%= ((EventBean) request.getAttribute("event")).getTitle() %></h2>
                            <p><strong>描述:</strong> <%= ((EventBean) request.getAttribute("event")).getDescription() %></p>
                            <p><strong>活動時間:</strong> <%= ((EventBean) request.getAttribute("event")).getActivityTime().format(dtf) %></p>
                            <p><strong>報名開始時間:</strong> <%= ((EventBean) request.getAttribute("event")).getSignupStartTime().format(dtf) %></p>
                            <p><strong>報名結束時間:</strong> <%= ((EventBean) request.getAttribute("event")).getSignupEndTime().format(dtf) %></p>
                            <p><strong>活動地點:</strong> <%= ((EventBean) request.getAttribute("event")).getLocation() %></p>
                            <p>
                                <strong>活動狀態:</strong> <%= ((EventBean) request.getAttribute("event")).getStatus() %>
                                <% if ("開放報名".equals(((EventBean) request.getAttribute("event")).getStatus())) { %>
                                    <a href="/activityInsertRegistrations?eventno=<%= ((EventBean) request.getAttribute("event")).getEventNo() %>" class="signup-button">我要報名</a>
                                <% } %>
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
