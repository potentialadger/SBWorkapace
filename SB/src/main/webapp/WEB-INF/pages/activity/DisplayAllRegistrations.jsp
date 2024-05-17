<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.activity.bean.EventRegistrationsBean" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"); %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>報名成功的活動</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        .btn-circle {
            width: 40px;
            height: 40px;
            padding: 0;
            border-radius: 50%;
            text-align: center;
            font-size: 18px;
            line-height: 1.5;
        }
        .btn-info { background-color: #36b9cc; }
        .btn-danger { background-color: #e74a3b; }
    </style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <script src="js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->
                <div align="center">
                    <h2>報名成功的活動</h2>
                    <% 
                        List<EventRegistrationsBean> registrations = (List<EventRegistrationsBean>) request.getAttribute("registrations");
                        if (registrations != null && !registrations.isEmpty()) {
                    %>
                    <table>
                        <thead>
                            <tr>
                                <th>活動編號</th>
                                <th>會員編號</th>
                                <th>報名者姓名</th>
                                <th>連絡電話</th>
                                <th>報名時間</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (EventRegistrationsBean registration : registrations) { %>
                                <tr>
                                    <td><%= registration.getEventNo() %></td>
                                    <td><%= registration.getUserNo() %></td>
                                    <td><%= registration.getParticipantName() %></td>
                                    <td><%= registration.getContactInfo() %></td>
                                    <td><%= registration.getRegistrationTime().format(dtf) %></td>
                                    <td>
                                        <div class="button-group">
                                            <a href="getRegistrationsDataForUpdate?registrationID=<%= registration.getRegistrationID() %>" class="btn btn-info btn-circle">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <form method="post" action="/DeleteRegistrations" style="display:inline;">
                                                <input type="hidden" name="_method" value="delete">
                                                <input type="hidden" name="registrationID" value="<%= registration.getRegistrationID() %>">
                                                <button type="submit" class="btn btn-danger btn-circle">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <% } else { %>
                        <h3>目前沒有可顯示的活動。</h3>
                    <% } %>
                </div>
                <!-- 主要內容結尾 -->

            </div>
            <!-- End of Main Content -->

            <!-- footer -->
            <script src="js/layout/Z_footer.js"></script>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <script src="js/layout/Z_Logout Modal.js"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>

</body>

</html>
