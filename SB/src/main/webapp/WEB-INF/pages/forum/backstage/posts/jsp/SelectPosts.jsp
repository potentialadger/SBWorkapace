<%@ page import="com.forum.bean.PostsBean" %>
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

    <title>文章管理</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
	
	<!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css"
	    href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
	    
	<link rel="stylesheet" type="text/css" href="/mycss/forumBackstage.css">
	
	<style>

	/* 調整圖片的寬度和高度 */
	img {
    width: 100px; /* 設置圖片的寬度為 */
    height: 100px; /* 設置圖片的高度為 */
	}
	
	</style>
	
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <script src="/js/layout/Z_slider.js"></script>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <script src="/js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->
               
               <!--  
				    <br>
				    <form method="get" action="/posts/OnePosts">
				        查詢: <input type="text" name="postsBeanKeyword" required>
				        <button type="submit">送出</button>
				    </form>   
				-->
				
				 <!-- 
				    <form method="get" action="/posts/AllPosts">
				        <button type="submit">查詢全部</button>
				    </form>
				-->
               
               
               		<h1>文章</h1> 
					
					<div class="right-align">
				     <form method="get" action="/CategoriesController/CategoriesAll" class="right-align">
				        <button type="submit" class="btn-green">返回</button>
				    </form>
				   	</div>
				    
				    <div class="table-container">
				    <table id="postsTable">
				        <thead>
				   
				            <tr>
				                <th>分類</th>
				                <th>文章標題</th>
				                <th>文章內容</th>
				                <th>圖片</th>
				                <th>日期</th>
				                <th>會員名稱</th>
				                <th>會員信箱</th>
				                <th>瀏覽次數</th>
				                <th>回覆</th>
				                <th>檢舉紀錄</th>
				                <th>喜歡紀錄</th>
				            </tr>
				        </thead>
				        <tbody>
				            <c:if test="${not empty postsM}">
				                <c:forEach var="posts" items="${postsM}">
				                    <tr>
				                        <td><c:out value="${categories.title_name}" /></td>
				                        <td><c:out value="${posts.title}" /></td>
				                        <td class="content" data-toggle="modal" data-target="#contentModal" onclick="showcontent(this)">${posts.content}</td>
				                        <td><img src="http://localhost:8080/localimages/${posts.image_url}" alt="無圖片"></td>
				                        <td><c:out value="${posts.update_date}" /></td>
				                        <td><c:out value="${posts.userBean.userChineseName}" /></td>
				                        <td><c:out value="${posts.userBean.email}" /></td>
				                        <td><c:out value="${posts.view_count}" /></td>
				                        
				                     <td>
										<form method="get" action="/replies/PostsReplies">
										<input type="hidden" name="postsNo" value="${posts.post_no}">
										<button type="submit" class="btn-blue">回覆</button>
										</form>
									</td>
									
									 <td>
										<form method="get" action="/reports/PostsReports">
										<input type="hidden" name="postsNo" value="${posts.post_no}">
										<button type="submit" class="btn-red">檢舉</button>
										</form>
									</td>
				
										<td>
											<form method="get" action="/likes/PostsLikes">
												<input type="hidden" name="postsNo" value="${posts.post_no}">
												<button type="submit" class="btn-yellow">喜歡</button>
											</form>
										</td>
										
									</tr>
				                </c:forEach>
				            </c:if>
				            <c:if test="${empty postsM}">
				                <tr>
				                    <td colspan="11">尚無資料</td>
				                </tr>
				            </c:if>
				        </tbody>
				    </table>
				    
				    <div class="modal fade" id="contentModal" tabindex="-1"
                            aria-labelledby="contentModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="contentModalLabel">文章內容</h5>
                                        <button type="button" class="btn-close" data-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- 顯示完整內容 -->
                                    </div>
                                </div>
                            </div>
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
    
    <!-- 引入 jQuery -->
	<script type="text/javascript" charset="utf8"
	    src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
	<!-- 引入 DataTables JS -->
	<script type="text/javascript" charset="utf8"
	    src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
	
	<!-- DataTables initialization -->
	<script>
	    $(document).ready(function() {
	        $('#postsTable').DataTable(); // 初始化 DataTables
	    });
	</script>
	
	<script>
	function showcontent(e) {
    let content = e.innerHTML
    let body = document.querySelector(".modal-body")
    body.innerHTML = content;
	}
	</script>


</body>

</html>