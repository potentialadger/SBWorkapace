<%@page import="com.activity.bean.EventBean"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>活動詳情</title>
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
<!-- <img src="/localimages/20240429145742_4204.jpg"> -->
    <div align="center">
        <h2>活動詳情</h2>
               <table>
            <tr>
                <th>活動<br>編號</th>
                <th>發起人</th>
                <th>標題</th>
                <th>描述</th>
                <th>活動時間</th>
                <th>報名開始時間</th>
                <th>報名結束時間 </th>
                <th>活動地點</th>
                <th>活動狀態</th>
                 <th>活動圖片</th>
                 
                <th>修改</th>
                <th>刪除</th>
            </tr>
            <%
            List<EventBean> events = (ArrayList<EventBean>)request.getAttribute("events");
                            for(EventBean event : events){
            %>
                <tr>
                <td><%= event.getEventNo() %></td>
                <td><%= event.getHostUserNo() %></td>
                <td><%= event.getTitle() %></td>
                <td><%= event.getDescription() %></td>
                <td><%= event.getActivityTime()  %></td>
                <td><%= event.getSignupStartTime() %></td>
                <td><%= event.getSignupEndTime() %></td>
                <td><%= event.getLocation() %></td>
                <td><%= event.getStatus() %></td>
                <td> <img style="width : 100px" src="/localimages/<%= event.getImagePath() %>"></td>
                    <div class="button-group">
                    <td><a href="getEventDataForUpdate?eventNo=<%=event.getEventNo()%>">修改</a></td>
                    </div>
                    <div class="button-group">
                    <td>
                     <form method="post" action="/DeleteEvent">
        					<input type="hidden" name="_method" value="delete">
        					<input type="hidden" name="eventNo" value="<%=event.getEventNo()%>">
        					<input type="submit" value="刪除">
<%--                         	<a href="DeleteEvent?eventNo=<%=event.getEventNo()%>">刪除</a> --%>
                      </form>
                    </td>
                    </div>
                </tr>
            <% } %>
        </table>
        
    </div>
  <div class="button-group">
    <a href="activityHomepage" class="button">返回活動首頁</a>
</div>


</body>
</html>