<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" href="mycss/MatchSuccessPeople.css">
	
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
                <script src="js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->
                
                
                	<section id="team" class="team team-bg py-5">
		<div class="container">

			<div class="section-title">
				<p class="main-team-subheading">配對成功</p>
				<p class="main-team-heading">好友</p>
			</div>

			<div class="row">

			<c:forEach var="matchData" items="${matchedUsersData}">
						  <div class="col-lg-6 mt-4 mt-lg-0">
							<div class="member d-flex align-items-start">
							  <div class="pic">
							  	<img src="https://th.bing.com/th/id/OIP.1E2uPdWprrqMH39OUUPqdwHaHa?rs=1&pid=ImgDetMain" class="img-fluid" alt=""></div>
							  	  <div class="member-info">
									<p class="member-heading">${matchData.nickName}</p>
								
				                <span>尋找關係&nbsp;
				                    <c:choose>
				                        <c:when test="${matchData.goalNo == 1}">不回答</c:when>
				                        <c:when test="${matchData.goalNo == 2}">網友</c:when>
				                        <c:when test="${matchData.goalNo == 3}">飯友</c:when>
				                        <c:when test="${matchData.goalNo == 4}">酒友</c:when>
				                        <c:when test="${matchData.goalNo == 5}">牌友</c:when>
				                        <c:when test="${matchData.goalNo == 6}">山友</c:when>
				                        <c:when test="${matchData.goalNo == 7}">旅伴</c:when>
				                        <c:when test="${matchData.goalNo == 8}">戀愛伴侶</c:when>
				                        <c:when test="${matchData.goalNo == 9}">結婚對象</c:when>
				                        <c:when test="${matchData.goalNo == 10}">朋友關係</c:when>
				                        <c:when test="${matchData.goalNo == 11}">短暫浪漫</c:when>
				                        <c:when test="${matchData.goalNo == 12}">匿名網友</c:when>
				                        <c:when test="${matchData.goalNo == 13}">一起運動</c:when>
				                        <c:when test="${matchData.goalNo == 14}">一起團購</c:when>
				                        <c:when test="${matchData.goalNo == 15}">外送拼單</c:when>
				                        <c:when test="${matchData.goalNo == 16}">不設限</c:when>
				                        <c:otherwise>未知</c:otherwise>
				                    </c:choose>
				                </span>
				                <p class="member-para">
				                    性別&nbsp;&nbsp; <c:choose>
				                        <c:when test="${matchData.gender == 1}">男</c:when>
				                        <c:when test="${matchData.gender == 0}">女</c:when>
				                        <c:otherwise>未知</c:otherwise>
				                    </c:choose>
				                </p>
				                
								<p class="member-para">血型&nbsp;&nbsp; ${matchData.bloodType}</p>
								<p class="member-para">MBTI&nbsp; ${matchData.MBTI}</p>
								<p class="member-para">生日&nbsp; ${localDateTimeDateFormat.format(matchData.birthday)}</p>								
								
								<div class="social">
								  <a href=""><i class="fab fa-twitter team-icon"></i></a>
								  <a href=""><i class="fab fa-facebook-f team-icon"></i></a>
								  <a href=""><i class="fab fa-instagram team-icon"></i></a>
								  <a href=""> <i class="fab fa-linkedin-in team-icon"></i> </a>
								</div>
							  </div>
							</div>
						  </div>
				</c:forEach>

			</div>
		</div>
	</section>
	

                  

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
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>


</body>

</html>