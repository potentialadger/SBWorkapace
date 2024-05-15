<%@ page import="com.activity.bean.EventBean" %>
<%@ page import="com.activity.bean.EventRegistrationsBean" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"); 
EventBean event = (EventBean) request.getAttribute("event");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <script src="/js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->
                <div align="center">
                    <h2>活動詳情</h2>
                    <% if (event != null) { %>
                        <div>
                            <img src="/localimages/<%= event.getImagePath() %>" alt="活動圖片" style="width: 300px;">
                            <h2><%= event.getTitle() %></h2>
                            <p><strong>描述:</strong> <%= event.getDescription() %></p>
                            <p><strong>活動時間:</strong> <%= event.getActivityTime().format(dtf) %></p>
                            <p><strong>報名開始時間:</strong> <%= event.getSignupStartTime().format(dtf) %></p>
                            <p><strong>報名結束時間:</strong> <%= event.getSignupEndTime().format(dtf) %></p>
                            <p><strong>活動地點:</strong> <%= event.getLocation() %></p>
                            <p>
                                <strong>活動狀態:</strong> <%= event.getStatus() %>
                                <a href="/activityInsertRegistrations?eventNo=<%= event.getEventNo() %>&userNo=<%= event.getHostUserNo() %>">我要報名</a>
                            </p>
                        </div>
                    <% } else { %>
                        <p>抱歉，無法載入活動詳情。</p>
                    <% } %>
                    <a href="activityList">返回活動列表</a>
                </div>
                <!-- 主要內容結尾 -->
            </div>
            <!-- End of Main Content -->

            <!-- footer -->
            <script src="/js/layout/Z_footer.js"></script>
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <script src="/js/layout/Z_Logout Modal.js"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/vendor/chart.js/Chart.min.js"></script>
    <script src="/js/demo/chart-area-demo.js"></script>
    <script src="/js/demo/chart-pie-demo.js"></script>
</body>
</html>
