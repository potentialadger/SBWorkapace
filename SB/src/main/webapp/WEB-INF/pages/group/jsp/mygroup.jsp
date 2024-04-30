<%@page import="java.text.SimpleDateFormat" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<%@page import="java.util.*" %>
			<%@page import="com.group.model.Group" %>
				<%@page import="com.group.model.Item" %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8">
						<title>My Group</title>

						<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
							rel="stylesheet"
							integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
							crossorigin="anonymous">
						<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
						<link rel="stylesheet" href="/style/mygroup.css">
					</head>

					<body>
						<div style="position: absolute; top: 10px; left: 10px;">
							<a href="groups.controller"><i class="fa-solid fa-arrow-left"></i></a>
						</div>
					<div class="container">
						<h2>你的團購</h2>
						<table id="table_id" class="display">
							<tr>
								<th>活動編號
								<th>活動標題
								<th>活動描述
								<th>截團時間
								<th>最小成團金額
								<th>最小成團數量
								<th>付款方式
								<th>修改
								<th>刪除 <% List<Group> groups = (ArrayList<Group>)
											request.getAttribute("groups");
											for (Group group : groups) {
											%>
							<tr>
								<td>
									<%=group.getEventno()%>
								<td>
									<%=group.getTitle()%>
								<td>
									<%=group.getDescription()%>
										<% Date endTime=group.getEndtime(); SimpleDateFormat sdf=new
											SimpleDateFormat("yyyy-MM-dd"); String formattedEndTime=sdf.format(endTime);
											%>
								<td>
									<%=formattedEndTime%>
								<td>
									<%=group.getMintotalamount()%>
								<td>
									<%=group.getMintotalquantity()%>
										<% String paymentMethodDisplay="" ; switch (group.getPaymentmethod()) { case 1 :
											paymentMethodDisplay="LinePay" ; break; case 2 : paymentMethodDisplay="匯款" ;
											break; case 12 : paymentMethodDisplay="LinePay, 匯款" ; break; default :
											paymentMethodDisplay="未知支付方式" ; break; } %>
								<td>
									<%=paymentMethodDisplay%>
								<td><button class="update btn btn-primary btn-lg"
										data-groupeventno="<%=group.getEventno()%>"
										data-grouptitle="<%=group.getTitle()%>"
										data-groupdescription="<%=group.getDescription()%>"
										data-groupendtime="<%=formattedEndTime%>"
										data-groupmintotalamount="<%=group.getMintotalamount()%>"
										data-groupmintotalquantity="<%=group.getMintotalquantity()%>"
										data-grouppaymentmethod="<%=paymentMethodDisplay%>" data-bs-toggle="modal"
										data-bs-target="#exampleModal">
										<i class="fa-solid fa-pen-to-square"></i>
									</button> <!-- Modal -->
														<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">修改團購</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body" style="text-align: left">
									
										
											
											<div
												style="display: flex; align-items: center; margin-bottom: 10px">
												<div style="width: 150px">團購標題:</div>
												<input name="gtitle" class="swal2-input"
													value="<%=group.getTitle()%>" />
												
											</div>
											<div
												style="display: flex; align-items: center; margin-bottom: 10px">
												<div style="width: 150px">團購描述:</div>
												<textarea name="gdescription" class="swal2-input"
													style="height: 80px"><%=group.getDescription()%></textarea>
											</div>
											<div
												style="display: flex; align-items: center; margin-bottom: 10px">
												<div style="width: 150px">團購截止時間:</div>
												<input name="gendtime" type="date" class="swal2-input"
													style="width: 250px" value="<%=formattedEndTime%>" />
											</div>
											<div
												style="display: flex; align-items: center; margin-bottom: 10px">
												<div style="width: 150px">付款方式:</div>
												<label><input type="checkbox" name="payment"
													value="1" style="margin-right: 5px" />LinePay</label>&nbsp;
												<label><input type="checkbox" name="payment"
													value="2" style="margin-right: 5px" />匯款</label>
											</div>
											<div
												style="display: flex; align-items: center; margin-bottom: 10px">
												<div style="width: 150px">成團金額:</div>
												<input type="number" name="MinTotalAmount"
													class="swal2-input" value="<%=group.getMintotalamount()%>" />
											</div>
											<div
												style="display: flex; align-items: center; margin-bottom: 10px">
												<div style="width: 150px">成團數量:</div>
												<input name="MinTotalQuantity" class="swal2-input"
													value="<%=group.getMintotalquantity()%>" />
											</div>
										</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">關閉</button>
									<button id="updatesubmit" class="btn btn-primary">確認修改</button>
								</div>
								
								</div>
							</div>
						</div>
								<td><button class="delete btn btn-primary btn-lg"
										data-groupeventno="<%=group.getEventno()%>">
										<i class="fa-solid fa-xmark"></i>
									</button>
									<% } %>
						</table>
						<h3>
							共<%=groups.size()%>筆團購
						</h3>
						</div>

						<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
							integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
							crossorigin="anonymous"></script>
						<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
						<script src="https://kit.fontawesome.com/f8f71426ea.js" crossorigin="anonymous"></script>
						<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
						<script>
							$(function () {
								$("button.delete").on("click", function () {
									let groupEventNo = $(this).data("groupeventno");
									if (confirm("確定要刪除這筆資料嗎?")) {
										$.ajax({
											url: 'DeleteGroup?groupEventNo=' + groupEventNo,
											type: 'delete',
											data: {
												groupEventNo: groupEventNo
											},
											success: function (response) {
												console.log(groupEventNo)
												location.reload();
											}
										})
									}
								})

								$('.update').on('click', function () {
									var groupeventno = $(this).data('groupeventno');
									var grouptitle = $(this).data('grouptitle');
									var groupdescription = $(this).data('groupdescription');
									var groupendtime = $(this).data('groupendtime');
									var groupmintotalamount = $(this).data('groupmintotalamount');
									var groupmintotalquantity = $(this).data('groupmintotalquantity');
									var grouppaymentmethod = $(this).data('grouppaymentmethod');

									$('#exampleModal').find('[name="gtitle"]').val(grouptitle);
									$('#exampleModal').find('[name="gdescription"]').val(groupdescription);
									$('#exampleModal').find('[name="gendtime"]').val(groupendtime);
									$('#exampleModal').find('[name="MinTotalAmount"]').val(groupmintotalamount);
									$('#exampleModal').find('[name="MinTotalQuantity"]').val(groupmintotalquantity);

									$('#exampleModal').find('[name="payment"]').prop('checked', false);
									$('#exampleModal').find('[name="payment"]').each(function () {
										if (grouppaymentmethod.includes($(this).val())) {
											$(this).prop('checked', true);
										}
									});

									$("#updatesubmit").on("click", function () {
										// 获取所有选中的支付方式复选框
										var paymentMethods = $('#exampleModal').find('[name="payment"]:checked').map(function () {
											return parseInt($(this).val());
										}).get();

										// 计算合成值
										var paymentMethodValue = 0;
										if (paymentMethods.includes(1)) paymentMethodValue += 1;
										if (paymentMethods.includes(2)) paymentMethodValue += 2;

										var formData = {
											groupeventno: $('#exampleModal').find('[data-groupeventno]').data('groupeventno'), // 确保这个也是正确获取
											gtitle: $('#exampleModal').find('[name="gtitle"]').val(),
											gdescription: $('#exampleModal').find('[name="gdescription"]').val(),
											gendtime: $('#exampleModal').find('[name="gendtime"]').val(),
											mintotalamount: $('#exampleModal').find('[name="MinTotalAmount"]').val(),
											mintotalquantity: $('#exampleModal').find('[name="MinTotalQuantity"]').val(),
											paymentmethod: paymentMethodValue
										};

										console.log(formData);

										$.ajax({
											url: 'UpdateGroup',
											type: 'PUT',
											contentType: 'application/json',
											data: JSON.stringify(formData),
											success: function (response) {
												location.reload();
											},
											error: function (xhr, status, error) {
												console.error("更新失败:", error);
											}
										});
									});
								});

							})
						</script>
						<script>
							$(document).ready(function () {
								$('#table_id').DataTable();
							});
						</script>

					</body>

					</html>