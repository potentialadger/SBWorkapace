<%@ page import="com.forum.bean.PostsBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>首頁</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css"
	integrity="sha256-46r060N2LrChLLb5zowXQ72/iKKNiw/lAmygmHExk/o="
	crossorigin="anonymous" />
<link rel="stylesheet" type="text/css" href="/mycss/forum_front.css">

<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css'>

<!-- Custom fonts for this template-->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-KFckfL5O6jt7sn4JcMm+caq0PeR8xh7Fgvl9PJo2trUBfoYlV/z8sWfvrOG3R8AdooYf2sPecZU6bPKpC/lT9g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
.category:hover {
	background-color: #f0f0f0;
	color: rgba(128, 128, 128, 0.856);
	text-decoration: underline;
}

.category a:visited {
	color: rgba(128, 128, 128, 0.603);
	text-decoration: underline;
}

.category a {
	font-weight: bold;
}

.post-category {
	position: absolute;
	top: 0;
	right: 0;
	background-color: #f0f0f0;
	padding: 2px 5px;
	border-radius: 3px;
	color: #555555cb;
	font-family: Arial Black;
}

.text-muted {
	margin-top: 20px;
}

.input-group.position-relative {
	display: none;
}

.my-search-form {
	display: flex;
	align-items: center;
}

.my-search-form input[type="text"] {
	flex: 1;
	margin-right: 10px;
}

.my-search-form button[type="submit"] {
	width: auto;
}

.custom-allposts-button {
    background-color: #4e73df;
    border-color: #4e73df;
    color: #fff;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: 0.25rem;
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out,
        color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.custom-allposts-button:hover {
    background-color: #2151e0;
    border-color: #224abe;
}

.inner-main-header {
    display: flex;
    align-items: center;
}

.custom-form-allposts {
    margin-left: auto;
}

body {
    font-family: Arial, sans-serif;
}

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
				<div class="container">
					<div class="main-body p-0" style="padding-bottom: 1.5rem">
						<div class="inner-wrapper">
							<!-- Inner sidebar -->
							<div class="inner-sidebar">
								<!-- Inner sidebar header -->
								<div class="inner-sidebar-header justify-content-center">
									<form method="get"
										action="/postsFrontDesk/InsertPostsCategories">
										<button class="btn btn-primary has-icon btn-block"
											type="submit" data-toggle="modal" data-target="#threadModal">
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2"
												stroke-linecap="round" stroke-linejoin="round"
												class="feather feather-plus mr-2">
															<line x1="12" y1="5" x2="12" y2="19"></line>
															<line x1="5" y1="12" x2="19" y2="12"></line>
														</svg>
											發文
										</button>
									</form>
								</div>
								<!-- /Inner sidebar header -->

								<!-- Inner sidebar body -->
								<div class="inner-sidebar-body p-0">

									<div class="p-3 h-100" data-simplebar="init">
										<div class="simplebar-wrapper" style="margin: -16px;">
											<div class="simplebar-height-auto-observer-wrapper">
												<div class="simplebar-height-auto-observer"></div>
											</div>
											<div class="simplebar-mask">
												<div class="simplebar-offset"
													style="right: 0px; bottom: 0px;">

													<div class="categories-container">
														<div class="simplebar-content-wrapper"
															style="height: 100%; overflow: hidden;">

															<nav class="nav nav-pills nav-gap-y-1 flex-column">

																<div class="category-header">
																	<input type="text"
																		class="form-control form-control-sm bg-gray-200 border-gray-200 shadow-none mb-4 mt-4"
																		id="searchInput" onkeyup="filterCategories()"
																		placeholder="搜尋分類...">
																	<div class="category-title"></div>
																</div>
																<c:forEach var="category" items="${categoriesM}">
																	<div class="category">
																		<a
																			href="/postsFrontDesk/CategoriesPosts?categoryNo=${category.category_no}"
																			class="nav-link nav-link-faded has-icon"> <c:out
																				value="${category.title_name}" />
																		</a>
																	</div>
																</c:forEach>
															</nav>

														</div>
													</div>
												</div>
											</div>
											<div class="simplebar-placeholder"
												style="width: 234px; height: 292px;"></div>
										</div>
										<div class="simplebar-track simplebar-horizontal"
											style="visibility: hidden;">
											<div class="simplebar-scrollbar"
												style="width: 0px; display: none;"></div>
										</div>
										<div class="simplebar-track simplebar-vertical"
											style="visibility: visible;">
											<div class="simplebar-scrollbar"
												style="height: 151px; display: block; transform: translate3d(0px, 0px, 0px);">
											</div>
										</div>
									</div>
								</div>
								<!-- /Inner sidebar body -->
							</div>
							<!-- /Inner sidebar -->

							<!-- Inner main -->
							<div class="inner-main">
								<!-- Inner main header -->
								<div class="inner-main-header">
									<a
										class="nav-link nav-icon rounded-circle nav-link-faded mr-3 d-md-none"
										href="#" data-toggle="inner-sidebar"><i
										class="material-icons">arrow_forward_ios</i></a> <select
										class="custom-select custom-select-sm w-auto mr-1">
										<option selected="">Latest</option>
										<option value="1">Popular</option>
										<option value="3">Solved</option>
										<option value="3">Unsolved</option>
										<option value="3">No Replies Yet</option>
									</select>

									<form class="my-search-form" method="get"
										action="/postsFrontDesk/OnePosts">
										<input type="text" class="form-control"
											name="postsBeanKeyword" required placeholder="標題查詢...">
										<button type="submit" class="btn btn-primary">送出</button>
									</form>

									<form class="custom-form-allposts" method="get"
										action="/postsFrontDesk/AllPosts">
										<button type="submit" class="custom-allposts-button">全部文章</button>
									</form>
									<!-- <span class="input-icon input-icon-sm ml-auto w-auto">
													<input type="text"
														class="form-control form-control-sm bg-gray-200 border-gray-200 shadow-none mb-4 mt-4"
														placeholder="Search forum" />
												</span> -->
								</div>
								<!-- /Inner main header -->

								<!-- Inner main body -->

								<!-- Forum List -->
								<div
									class="inner-main-body p-2 p-sm-3 collapse forum-content show">
									<!-- <c:if test="${not empty postsM}"> -->
									<c:forEach var="post" items="${postsM}">
										<div class="card mb-2">
											<div class="card-body p-2 p-sm-3">
												<div class="media forum-item">
													<img
														src="http://localhost:8080/localimages/${post.userBean.avatar}"
														class="mr-3" width="50" alt="User"
														style="border-radius: 50%;" />
													<div class="media-body">
														<h5>
															<a
																href="/postsFrontDesk/SelectPosts?postsNo=${post.post_no}"
																class="text-body" style="font-weight: bold;">
																<div
																	style="width: 300px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">
																	${post.title}
																	</div>
															</a>
														</h5>
														<div
															style="width: 200px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">
															${post.content}</div>


														<span class="post-category">${post.categoriesBean.title_name}</span>


														<p class="text-muted">
															<span class="text-secondary font-weight-bold"><fmt:formatDate
																	value="${post.update_date}" pattern="yyyy-MM-dd HH:mm" /></span>
														</p>
													</div>
													<div class="text-muted small text-center align-self-center">
														<span class="d-none d-sm-inline-block"><i
															class="far fa-eye"></i> ${post.view_count}</span> <span><i
															class="far fa-comment ml-2"></i>
															${post.repliesBean.size()}</span> <span><i
															class="fas fa-heart"></i> ${post.likesBean.size()}</span>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
									<!-- </c:if> -->
									<c:if test="${empty postsM}">
										<div class="post">
											<div class="post-content">尚無資料</div>
										</div>
									</c:if>

								</div>
								<!-- /Forum List -->

								<!-- Forum Detail -->
								<div class="inner-main-body p-2 p-sm-3 collapse forum-content">
									<a href="#" class="btn btn-light btn-sm mb-3 has-icon"
										data-toggle="collapse" data-target=".forum-content"><i
										class="fa fa-arrow-left mr-2"></i>Back</a>
									<div class="card mb-2">
										<div class="card-body">
											<div class="media forum-item">
												<a href="javascript:void(0)" class="card-link"> 
												
												<img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="rounded-circle" width="50" alt="User" /> 
													
													<small
													class="d-block text-center text-muted">Newbie</small>
												</a>
												<div class="media-body ml-3">
													<a href="javascript:void(0)" class="text-secondary">Mokrani</a>
													<small class="text-muted ml-2">1 hour ago</small>
													<h5 class="mt-1">Realtime fetching data</h5>
													<div class="mt-3 font-size-sm">
														<p>Hellooo :)</p>
														<p>I'm newbie with laravel and i want to fetch data
															from database in realtime for my dashboard anaytics and i
															found a solution with ajax but it dosen't work if any one
															have a simple solution it will be helpful</p>
														<p>Thank</p>
													</div>
												</div>
												<div class="text-muted small text-center">
													<span class="d-none d-sm-inline-block"><i
														class="far fa-eye"></i> 19</span> <span><i
														class="far fa-comment ml-2"></i> 3</span>
												</div>
											</div>
										</div>
									</div>
									<div class="card mb-2">
										<div class="card-body">
											<div class="media forum-item">
												<a href="javascript:void(0)" class="card-link"> <img
													src="https://bootdey.com/img/Content/avatar/avatar2.png"
													class="rounded-circle" width="50" alt="User" /> <small
													class="d-block text-center text-muted">Pro</small>
												</a>
												<div class="media-body ml-3">
													<a href="javascript:void(0)" class="text-secondary">drewdan</a>
													<small class="text-muted ml-2">1 hour ago</small>
													<div class="mt-3 font-size-sm">
														<p>What exactly doesn't work with your ajax calls?</p>
														<p>Also, WebSockets are a great solution for realtime
															data on a dashboard. Laravel offers this out of the box
															using broadcasting</p>
													</div>
													<button class="btn btn-xs text-muted has-icon">
														<i class="fa fa-heart" aria-hidden="true"></i>1
													</button>
													<a href="javascript:void(0)" class="text-muted small">Reply</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /Forum Detail -->

								<!-- /Inner main body -->
							</div>
							<!-- /Inner main -->
						</div>

						<!-- New Thread Modal -->

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
		function filterCategories() {
			var input, filter, categories, category, txtValue;
			input = document.getElementById('searchInput');
			filter = input.value.toUpperCase();
			categories = document.getElementsByClassName('category');
			for (var i = 0; i < categories.length; i++) {
				category = categories[i].getElementsByTagName('a')[0];
				txtValue = category.textContent || category.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					categories[i].style.display = '';
				} else {
					categories[i].style.display = 'none';
				}
			}
		}
	</script>
	<script>
		// 獲取所有類別元素
		var categories = document.querySelectorAll('.category');

		// 為每個類別元素添加事件監聽器
		categories.forEach(function(category) {
			// 監聽滑鼠移入事件
			category.addEventListener('mouseenter', function() {
				category.classList.add('hovered'); // 添加反灰樣式
			});

			// 監聽滑鼠移出事件
			category.addEventListener('mouseleave', function() {
				category.classList.remove('hovered'); // 移除反灰樣式
			});
		});
		</script>

		</body>

		</html>
	