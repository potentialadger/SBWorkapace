<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>新增文章</title>

<!-- Custom fonts for this template-->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">

<style>

.input-group.position-relative {
	display: none;
}

.container {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 40px;
    color: black !important;
}   
    .forum-form-container {
    display: flex;
    flex-direction: column;
}

</style>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!--<script src="js/test/Z_slider.js"></script>-->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<script src="/js/layout/Z_TopBar.js"></script>

				<!-- 主要內容 -->
				<div class="container">
					<div class="forum-form-container">
						<form method="post" action="/postsFrontDesk/InsertPosts" enctype="multipart/form-data" onsubmit="return confirmPublish()">
							
						<div class="form-group"> <label for="category_no">分類 :</label> 
							<select id="category_no" name="category_no" class="form-control">
									<c:forEach var="category" items="${categoriesList}">
										<option value="${category.category_no}" ${category.category_no == updateSelect.categoriesBean.category_no ? 'selected' : ''}>${category.title_name}</option>
									</c:forEach>
							</select>
						</div>
							
							<div class="form-group">
								<label for="title">新增文章標題 :</label> <input type="text" id="title" name="title" class="form-control" required>
							</div>
							
							<div class="form-group">
								<label for="content">新增文章內容 :</label> <textarea id="content" name="content" class="form-control" rows="15" style="resize: none;" required></textarea>
							</div>
							
							<div class="form-group">
								<label for="image_url">新增圖片：</label> <input type="file" id="image_url" name="image_url" class="form-control-file">
							</div>

							<div class="button-primary-secondary">
								<button type="submit" class="btn btn-primary">發佈</button>
								<button type="button" class="btn btn-secondary" onclick="goBack()">返回</button>
							</div>
						
						</form>
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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
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
        function confirmPublish() {
            return confirm("確定要發佈這篇文章嗎？");
        }
        
		function goBack() {
			window.history.back();
		}
	</script>


</body>

</html>