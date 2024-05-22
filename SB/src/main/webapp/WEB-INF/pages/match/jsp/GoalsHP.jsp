<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.match.bean.GoalsBean"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- 添加交友目標頁面的 CSS -->
<link rel="stylesheet" href="mycss/GoalsIndex.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>




</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<script src="js/layout/Z_slider.js"></script>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<script src="js/layout/Z_TopBar.js"></script>



				<!-- 主要內容 -->

				<div class="content">
					<h2>搜尋條件</h2>
					<div class="search-container">
						<form action="queryGoalNo" method="get">
							<!-- 用交友目標編號查詢 -->
							<span>交友目標編號</span> <input type="text" id="goalNoInput"
								name="goalNo" placeholder="請輸入交友目標編號">
							<!-- 用交友目標名稱查詢 -->
							<span>交友目標名稱</span> <input type="text" id="goalNameInput"
								name="goalName" placeholder="請輸入交友目標名稱">
							<button class="button select" type="submit">查詢</button>
							<!-- 刷新/查詢全部 -->
							<button class="button refresh"
								onclick="window.location.href='/refreshGoals'">刷新</button>
						</form>
					</div>


					<div class="separator"></div>
					<button type="button" class="button insert" data-bs-toggle="modal"
						data-bs-target="#addModal">新增交友目標</button>
					<!-- 在新增交友目標右邊添加一個批量刪除按鈕 -->
					<button type="button" class="button delete-batch"
						data-bs-toggle="modal" data-bs-target="#deleteBatchModal">批量删除</button>


					<table>
						<thead>
							<tr>
								<!-- 顯示複選框 -->
								<th scope="col"><input type="checkbox" id="selectAll">全選</th>
								<th scope="col">交友目標編號</th>
								<th scope="col">交友目標名稱</th>
								<th scope="col">操作</th>
							</tr>
						</thead>
						<tbody>
							<%
							List<GoalsBean> goals = (List<GoalsBean>) request.getAttribute("goals");
							if (goals != null && !goals.isEmpty()) {
								for (GoalsBean goal : goals) {
							%>
							<tr>
								<!-- 在每一行的 <td> 中添加一個複選框 -->
								<td><input type="checkbox" name="selectedGoals"
									value="<%=goal.getGoalNo()%>"></td>
								<td><%=goal.getGoalNo()%></td>
								<td><%=goal.getGoalName()%></td>
								<td>
									<button type="button" class="button update"
										data-bs-toggle="modal"
										data-bs-target="#updateModal_<%=goal.getGoalNo()%>">修改</button>
									<button type="button" class="button delete"
										data-bs-dismiss="modal" data-bs-toggle="modal"
										data-bs-target="#deleteModal_<%=goal.getGoalNo()%>">删除</button>
								</td>
							</tr>

							<!-- 修改模態框 -->
							<div class="modal fade" id="updateModal_<%=goal.getGoalNo()%>"
								tabindex="-1" aria-labelledby="updateModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="updateModalLabel">修改交友目標</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<form action="updateGoal/<%=goal.getGoalNo()%>" method="post">
											<input type="hidden" name="_method" value="put">
											<div class="modal-body">
												<div class="mb-3">
													<label for="updateGoalNo" class="form-label">交友目標編號</label>
													<input type="text" class="form-control" id="updateGoalNo"
														name="goalNo" value="<%=goal.getGoalNo()%>" readonly>
													<label for="updateGoalName" class="form-label">新的交友目標</label>
													<input type="text" class="form-control" id="updateGoalName"
														name="goalName" value="<%=goal.getGoalName()%>" required>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">取消</button>
												<button type="submit" class="btn btn-primary">修改</button>
											</div>
										</form>
									</div>
								</div>
							</div>

							<!-- 刪除確認模態框 -->
							<div class="modal fade" id="deleteModal_<%=goal.getGoalNo()%>"
								tabindex="-1" aria-labelledby="deleteModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="deleteModalLabel">確認刪除</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											確定要刪除交友目標? "<%=goal.getGoalName()%>" 嗎?
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">取消</button>
											<form action="deleteGoal/<%=goal.getGoalNo()%>" method="post"
												style="display: inline-block;">
												<input type="hidden" name="_method" value="delete">
												<button type="submit" class="btn btn-primary">確定</button>
											</form>
										</div>
									</div>
								</div>
							</div>

							<!-- 批量刪除的模態框 -->
							<div class="modal fade" id="deleteBatchModal" tabindex="-1"
								aria-labelledby="deleteBatchModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="deleteBatchModalLabel">批量删除確認</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<p id="deleteBatchMessage">確定要刪除嗎?</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary"
												onclick="deleteBatchGoals()">確定</button>
										</div>
									</div>
								</div>
							</div>

							<%
							}
							} else {
							%>
							<tr>
								<td colspan="4" class="text-center">
									<div class="alert alert-warning" role="alert">沒有這筆資料</div>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>

				<div class="pagination">
					<span>第</span> <input type="number" value="1"> <span>頁</span>
					<span>共</span> <span>1</span> <span>頁</span> <select>
						<option value="10">10 條/頁</option>
						<option value="20">20 條/頁</option>
						<option value="50">50 條/頁</option>
					</select>
				</div>

				<!-- 新增交友目標模態框 -->
				<div class="modal fade" id="addModal" tabindex="-1"
					aria-labelledby="addModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">

								<!-- 帶有"X"圖標的按鈕 -->
								<h5 class="modal-title" id="addModalLabel">新增交友目標</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form id="addForm">
									<div class="mb-3">
										<label for="addGoalName" class="form-label">交友目標名稱</label> <input
											type="text" class="form-control" id="addGoalName"
											name="goalName" required>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">取消</button>
								<button type="button" class="btn btn-primary"
									onclick="addGoal()">確定</button>
							</div>
						</div>
					</div>
				</div>



				<!-- Goal -->

				<script>
    function addGoal() {
        const goalName = document.getElementById("addGoalName").value; // 修改這一行以獲取新增目標的名稱
        const formData = new FormData();
        formData.append("goalNameParam", goalName);

        fetch("goals", {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (response.ok) {
                // 關閉模態框
                const modal = bootstrap.Modal.getInstance(document.getElementById('addModal'));
                modal.hide();
                
                // 重新加載頁面
            } else {
                alert("Insert Failed");
            }
        })
        .catch(error => {
            console.error('Error:', error);
                location.reload();
        });
    }
    
    
    //----------------------
    
    // 批量刪除
    // 全選/全不選
    document.getElementById('selectAll').addEventListener('change', function() {
        const checkboxes = document.querySelectorAll('input[name="selectedGoals"]');
        checkboxes.forEach(checkbox => {
            checkbox.checked = this.checked;
        });
    });

    // 顯示選中的交友目標列表
	function showSelectedGoals() {
   	    const selectedGoals = document.querySelectorAll('input[name="selectedGoals"]:checked');
   	    const deleteBatchMessage = document.getElementById('deleteBatchMessage');

    	if (selectedGoals.length === 0) {
        	deleteBatchMessage.textContent = '沒有選擇任何交友目標';
   	    } else {
        	deleteBatchMessage.textContent = '確定要刪除嗎?';
    	}
	}

    // 批量刪除選中的交友目標
    function deleteBatchGoals() {
        const selectedGoals = document.querySelectorAll('input[name="selectedGoals"]:checked');
        const goalNos = Array.from(selectedGoals).map(selectedGoal => selectedGoal.value);

        if (goalNos.length === 0) {
            alert('請至少選擇一個交友目標');
            return;
        }

        const formData = new FormData();
        formData.append('goalNos', goalNos);

        fetch('deleteBatchGoals', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (response.ok) {
                // 關閉模態框
                const modal = bootstrap.Modal.getInstance(document.getElementById('deleteBatchModal'));
                modal.hide();

                // 重新加載頁面
                location.reload();
            } else {
                alert('批量刪除失敗');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('發生錯誤');
        });
    }

    // 顯示選中的交友目標列表
    document.getElementById('deleteBatchModal').addEventListener('show.bs.modal', showSelectedGoals);

    </script>


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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
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