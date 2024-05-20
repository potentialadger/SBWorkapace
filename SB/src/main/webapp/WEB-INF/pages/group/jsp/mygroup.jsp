<%@page import="com.group.dto.GroupDto" %>
	<%@page import="java.text.SimpleDateFormat" %>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
			<%@page import="java.util.*" %>
				<%@page import="com.group.dto.GroupDto" %>
					<%@page import="com.group.model.Item" %>
						<%@page import="com.group.dto.OrderDto" %>
							<!DOCTYPE html>
							<html>

							<head>
								<meta charset="UTF-8">
								<title>My Group</title>
								<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
									rel="stylesheet"
									integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
									crossorigin="anonymous">
								<link rel="stylesheet"
									href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
							</head>

							<body>
								<div style="position: absolute; top: 10px; left: 10px;">
									<a href="/group/groups"><i class="fa-solid fa-arrow-left"></i></a>
								</div>
								<div class="container">

									<div class="row g-3">
										<div class="col-12 col-sm-8"></div>
										<div class="my-5">
											<h3>團購資料</h3>
										</div>

										<!-- 頁籤 -->
										<ul class="nav nav-tabs" id="tab" role="tablist">
											<li class="nav-item" role="presentation">
												<button class="nav-link active" id="profileTab" data-bs-toggle="tab"
													data-bs-target="#profileTabPane" type="button" role="tab"
													aria-controls="profileTabPane" aria-selected="true">
													我的團購
												</button>
											</li>
											<li class="nav-item" role="presentation">
												<button class="nav-link" id="photosTab" data-bs-toggle="tab"
													data-bs-target="#photosTabPane" type="button" role="tab"
													aria-controls="photosTabPane" aria-selected="false">
													我的訂單
												</button>
											</li>
										</ul>

										<div class="tab-content" id="tabContent">
											<!-- 我的團購 -->
											<div class="tab-pane fade show active" id="profileTabPane" role="tabpanel"
												aria-labelledby="profileTab" tabindex="0">
												<table id="group_id" class="display" style="width: 100%;">
													<tr>
														<th>活動編號</th>
														<th>活動標題</th>
														<th>活動描述</th>
														<th>截團時間</th>
														<th>最小成團金額</th>
														<th>最小成團數量</th>
														<th>付款方式</th>
														<th>修改</th>
														<th>刪除</th>
													</tr>
													<% List<GroupDto> groups = (ArrayList<GroupDto>)
															request.getAttribute("groups");
															for (GroupDto group : groups) { %>
															<tr>
																<td>
																	<%=group.getEventNo()%>
																</td>
																<td>
																	<%=group.getgTitle()%>
																</td>
																<td>
																	<%=group.getgDescription()%>
																</td>
																<% Date endTime=group.getgEndTime(); SimpleDateFormat
																	sdf=new SimpleDateFormat("yyyy-MM-dd"); String
																	formattedEndTime=sdf.format(endTime); %>
																	<td>
																		<%=formattedEndTime%>
																	</td>
																	<td>
																		<%=group.getgMinTotalAmount()%>
																	</td>
																	<td>
																		<%=group.getgMinTotalQuantity()%>
																	</td>
																	<% String paymentMethodDisplay="" ; switch
																		(group.getPaymentMethod()) { case 1:
																		paymentMethodDisplay="匯款" ; break; case 2:
																		paymentMethodDisplay="面交" ; break; case 3:
																		paymentMethodDisplay="SB點數" ; break; case 12:
																		paymentMethodDisplay="匯款, 面交" ; break; case 13:
																		paymentMethodDisplay="匯款, SB點數" ; break; case
																		23: paymentMethodDisplay="面交, SB點數" ; break;
																		case 123: paymentMethodDisplay="匯款, 面交, SB點數" ;
																		break; default: paymentMethodDisplay="未知支付方式" ;
																		break; } %>
																		<td>
																			<%=paymentMethodDisplay%>
																		</td>
																		<td>
																			<button
																				class="update btn btn-primary btn-lg"
																				data-groupeventno="<%=group.getEventNo()%>"
																				data-grouptitle="<%=group.getgTitle()%>"
																				data-groupdescription="<%=group.getgDescription()%>"
																				data-groupendtime="<%=formattedEndTime%>"
																				data-groupmintotalamount="<%=group.getgMinTotalAmount()%>"
																				data-groupmintotalquantity="<%=group.getgMinTotalQuantity()%>"
																				data-grouppaymentmethod="<%=paymentMethodDisplay%>"
																				data-bs-toggle="modal"
																				data-bs-target="#exampleModal">
																				<i
																					class="fa-solid fa-pen-to-square"></i>
																			</button>
																		</td>
																		<td>
																			<button
																				class="delete btn btn-primary btn-lg"
																				data-groupeventno="<%=group.getEventNo()%>">
																				<i class="fa-solid fa-xmark"></i>
																			</button>
																		</td>
															</tr>
															<% } %>
												</table>
												<h3>共<%=groups.size()%>筆團購</h3>
											</div>

											<!-- 我的訂單 -->
											<div class="tab-pane fade" id="photosTabPane" role="tabpanel"
												aria-labelledby="photosTab" tabindex="0">
												<table id="order_id" class="display" style="width: 100%">
													<tr>
														<th>活動編號</th>
														<th>活動標題</th>
														<th>成立時間</th>
														<th>付款方式</th>
														<th>商品細節</th>
													</tr>
													<% List<OrderDto> orders = (ArrayList<OrderDto>)
															request.getAttribute("orders");
															for (OrderDto order : orders) { %>
															<tr>
																<td>
																	<%=order.getEventNo() %>
																</td>
																<td>
																	<%=order.getEventTitle() %>
																</td>
																<% Date setTime=order.getSetTime(); SimpleDateFormat
																	sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
																	String formattedSetTime=sdf.format(setTime); %>
																	<td>
																		<%=formattedSetTime%>
																	</td>
																	<% String paymentMethodDisplay="" ; switch
																		(order.getPaymentMethod()) { case 1:
																		paymentMethodDisplay="匯款" ; break; case 2:
																		paymentMethodDisplay="面交" ; break; case 3:
																		paymentMethodDisplay="SB點數" ; break; case 12:
																		paymentMethodDisplay="匯款, 面交" ; break; case 13:
																		paymentMethodDisplay="匯款, SB點數" ; break; case
																		23: paymentMethodDisplay="面交, SB點數" ; break;
																		case 123: paymentMethodDisplay="匯款, 面交, SB點數" ;
																		break; default: paymentMethodDisplay="未知支付方式" ;
																		break; } %>
																		<td>
																			<%=paymentMethodDisplay%>
																		</td>
																		<td>
																			<button class="btn btn-primary btn-lg">
																				<i class="fa-solid fa-chevron-down"></i>
																			</button>
																		</td>
															</tr>
															<% } %>
												</table>
											</div>
										</div>
									</div>
								</div>

								<!-- Modal -->
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
												<div style="display: flex; align-items: center; margin-bottom: 10px">
													<div style="width: 150px">團購標題:</div>
													<input name="gtitle" class="swal2-input" />
												</div>
												<div style="display: flex; align-items: center; margin-bottom: 10px">
													<div style="width: 150px">團購描述:</div>
													<textarea name="gdescription" class="swal2-input"
														style="height: 80px"></textarea>
												</div>
												<div style="display: flex; align-items: center; margin-bottom: 10px">
													<div style="width: 150px">團購截止時間:</div>
													<input name="gendtime" type="date" class="swal2-input"
														style="width: 250px" />
												</div>
												<div style="display: flex; align-items: center; margin-bottom: 10px">
													<div style="width: 150px">成團金額:</div>
													<input type="number" name="MinTotalAmount" class="swal2-input" />
												</div>
												<div style="display: flex; align-items: center; margin-bottom: 10px">
													<div style="width: 150px">成團數量:</div>
													<input name="MinTotalQuantity" class="swal2-input" />
												</div>
												<!-- Hidden input field for groupeventno -->
												<input type="hidden" name="groupeventno" />
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">關閉</button>
												<button id="updatesubmit" class="btn btn-primary">確認修改</button>
											</div>
										</div>
									</div>
								</div>

								<script
									src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
									integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
									crossorigin="anonymous"></script>
								<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
								<script src="https://kit.fontawesome.com/f8f71426ea.js"
									crossorigin="anonymous"></script>
								<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
								<script>
									$(document).ready(function () {
										$("button.delete").on("click", function () {
											let groupEventNo = $(this).data("groupeventno");
											if (confirm("確定要刪除這筆資料嗎?")) {
												$.ajax({
													url: '/group/bannedgroup/' + groupEventNo,
													type: 'post',
													success: function (response) {
														console.log(groupEventNo)
														location.reload();
													}
												})
											}
										});

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
											$('#exampleModal').find('[name="groupeventno"]').val(groupeventno); // Set the hidden input field

											$('#exampleModal').find('[name="payment"]').prop('checked', false);
											$('#exampleModal').find('[name="payment"]').each(function () {
												if (grouppaymentmethod.includes($(this).val())) {
													$(this).prop('checked', true);
												}
											});
										});

										$('#updatesubmit').on('click', function () {
											var paymentMethods = $('#exampleModal').find('[name="payment"]:checked').map(function () {
												return parseInt($(this).val());
											}).get();

											var paymentMethodValue = 0;
											if (paymentMethods.includes(1)) paymentMethodValue += 1;
											if (paymentMethods.includes(2)) paymentMethodValue += 2;

											var formData = {
												eventNo: $('#exampleModal').find('[name="groupeventno"]').val(), // Read the hidden input field
												gTitle: $('#exampleModal').find('[name="gtitle"]').val(),
												gDescription: $('#exampleModal').find('[name="gdescription"]').val(),
												gEndTime: $('#exampleModal').find('[name="gendtime"]').val(),
												gMinTotalAmount: $('#exampleModal').find('[name="MinTotalAmount"]').val(),
												gMinTotalQuantity: $('#exampleModal').find('[name="MinTotalQuantity"]').val()
											};

											console.log(formData);

											$.ajax({
												url: '/group/updategroup',
												type: 'post',
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
								</script>
							</body>

							</html>