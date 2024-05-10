<%@page import="java.util.List"%>
<%@page import="com.activity.bean.EventRegistrationsBean"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>報名成功的活動</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            color: #333; 
        }

        h2 {
            color: #222;
            font-size: 2.5rem;
            text-align: center;
            margin-top: 20px;
        }

        table {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
        }

        th, td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
            background-color: #ffffff; 
        }

        th {
            background-color: #333;
            color: #fff; 
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd; 
        }

        .button-group a, .button-group button {
            padding: 5px 15px;
            margin: 5px;
            border-radius: 3px; 
            text-decoration: none;
            color: #fff; 
            background-color: #222; 
            border: none;
            display: inline-block; 
            text-align: center;
        }

        .button-group a:hover, .button-group button:hover {
            background-color: #555;
            cursor: pointer;
        }

        h3 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        @media (max-width: 768px) {
            h2 {
                font-size: 2rem;
            }

            .button-group a, .button-group button {
                padding: 5px 10px; 
            }

            table {
                width: 100%; 
            }
        }
    </style>
</head>
<body>
    <div align="center">
        <h2>報名成功的活動</h2>
        <% String message = (String) request.getAttribute("message");
           if (message != null) { %>
            <p style="color: red;"><strong><%= message %></strong></p>
        <% } %>
        <% 
            List<EventRegistrationsBean> registrations = (List<EventRegistrationsBean>) request.getAttribute("registrations");
            if (registrations != null && !registrations.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>活動名稱</th>
                    <th>活動時間</th>
                    <th>活動地點</th>
                </tr>
                <% for (EventRegistrationsBean registration : registrations) { %>
                    <tr>
                        <td><%= registration.getEvent().getTitle() %></td>
                        <td><%= registration.getEvent().getActivityTime().format(dtf) %></td>
                        <td><%= registration.getEvent().getLocation() %></td>
                    </tr>
                <% } %>
            </table>
        <% } else { %>
            <h3>目前沒有報名成功的活動。</h3>
        <% } %>
    </div>
    <div class="button-group" align="center">
        <a href="activityHomepage" class="button">返回活動首頁</a>
    </div>
</body>
</html>
