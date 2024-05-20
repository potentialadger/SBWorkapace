<%@ page import="com.forum.bean.ReportsBean" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>

                <meta charset="utf-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <meta name="description" content="">
                <meta name="author" content="">

                <title>檢舉:${reportsPosts.title}</title>

                <!-- Custom fonts for this template-->
                <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
                <link
                    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                    rel="stylesheet">

                <!-- Custom styles for this template-->
                <link href="/css/sb-admin-2.min.css" rel="stylesheet">

                <style>
                    .input-group.position-relative {
                        display: none;
                    }

                    .reports-container {
                        background-color: #fff;
                        padding: 20px;
                        border-radius: 8px;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                        margin-bottom: 40px;
                        width: 800px;
                        margin-left: auto;
                        margin-right: auto;
                        color: black !important;
                    }

                    .submit-button {
                        background-color: #3761d4;
                        color: white;
                        padding: 10px 20px;
                        border: none;
                        border-radius: 5px;
                        cursor: pointer;
                        transition: background-color 0.3s;
                    }

                    .submit-button:hover {
                        background-color: #4b59d8;
                    }
                     .button-container {
    					
                </style>

            </head>

            <body id="page-top">

                <!-- Page Wrapper -->
                <div id="wrapper">

                    <!--        <script src="js/test/Z_slider.js"></script>-->

                    <!-- Content Wrapper -->
                    <div id="content-wrapper" class="d-flex flex-column">

                        <!-- Main Content -->
                        <div id="content">

                            <!-- Topbar -->
                            <script src="/js/layout/Z_TopBar.js"></script>

                            <!-- 主要內容 -->

                            <div class="reports-container">
                                <div class="forum-form-container">
                                    
                                    <form id="myForm" method="post" action="/reportsFrontDesk/InsertReports" onsubmit="return confirmSubmission()">
                                        
                                        <input type="hidden" name="post_no" value="${reportsPosts.post_no}">
                                        
                                        <input type="hidden" name="user_no" value="${userData.userNo}">
                                        
                                        <label for="reason">檢舉原因 :</label>
                                        
                                        <textarea id="reason" name="reason" required style="width: 100%; height: 400px; resize: none;"></textarea>
                                       
                                    </form>
                                       	
                                    <input type="button" onclick="submitMyForm()" value="提交" class="submit-button" />

                                    <button onclick="goBack()" class="submit-button">返回</button>
                                
                                </div>
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

                <!-- Page level custom scripts -->
                <script src="/js/demo/chart-area-demo.js"></script>
                <script src="/js/demo/chart-pie-demo.js"></script>

                <script>
                    function confirmSubmission() {
                        return confirm("您確定要檢舉嗎？");
                    }

                    function goBack() {
                        window.history.back();
                    }
                    
                    function submitMyForm() {
                        var form = document.getElementById("myForm");
                        form.submit();
                    }
                </script>


            </body>

            </html>