<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@page import="java.util.*" %>
		<%@page import="com.group.model.Group" %>
			<%@page import="com.group.model.Item" %>
				<%@ page import="java.text.SimpleDateFormat" %>
					<%! public String formatTimeAgo(Date date) { final long SECOND=1000; final long MINUTE=60 * SECOND;
						final long HOUR=60 * MINUTE; final long DAY=24 * HOUR; final long MONTH=30 * DAY; long
						currentTime=System.currentTimeMillis(); long timeDiff=currentTime - date.getTime(); if (timeDiff
						< MINUTE) { return (timeDiff / SECOND) + " 秒前開團" ; } else if (timeDiff < HOUR) { return
						(timeDiff / MINUTE) + " 分鐘前開團" ; } else if (timeDiff < DAY) { return (timeDiff / HOUR)
						+ " 小時前開團" ; } else if (timeDiff < MONTH) { return (timeDiff / DAY) + " 天前開團" ; } else { return
						new SimpleDateFormat("yyyy-MM-dd").format(date); } } %>
						<!DOCTYPE html>
						<html>

						<head>
							<meta charset="UTF-8">
							<title>SB 團購活動</title>
							<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
								rel="stylesheet"
								integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
								crossorigin="anonymous">
							<link rel="stylesheet" href="/mycss/groups.css">
							<link rel="stylesheet"
								href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
						</head>

						<body>
							<div class="container" style="width: 68%;position: relative;">
								<button type="button" class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#newgroup" style="height: 40px;">
									我要開團
								</button>
								<button style="border: none;background: none;padding: 0;"><img
										src="/images/pigbigbro.jpg"
										style="border-radius: 50%;object-fit: cover;width: 70px;height: 70px;margin-left: 1100px;"></button>
								<div class="row">
									<% List<Group> groups = (ArrayList<Group>)
											request.getAttribute("groups");
											for (Group group : groups) { %>
											<div class="col-lg-4 col-md-6 col-12 mt-4 pt-2 position-relative">
												<div class="card service-wrapper rounded border-0 shadow p-4">
													<div class="content mt-4">
														<h5 class="title">
															<%=group.getTitle() %>
														</h5>
														<p class="text-muted mt-3 mb-0">
															<%=group.getDescription() %>
														</p>
														<% Date startDate=group.getStartTime(); String
															timeAgo=formatTimeAgo(startDate); %>

															<p class="link-wrapper"
																style="position: absolute; bottom: 5px; left: 10px; color: gray">
																<%=timeAgo %>
															</p>
															<div class="link-wrapper"
																style="position: absolute; bottom: 10px; right: 10px;">
																<a href="<%= " /group/eachgroup/" + group.getEventNo()
																	%>" class="text-custom">前往團購 <i
																		class="mdi mdi-chevron-right"></i></a>
															</div>
													</div>
												</div>
											</div>
											<% } %>
								</div>
							</div>

							<!-- Modal -->
							<div class="modal fade" id="newgroup" tabindex="-1" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content" style="border-radius: 20px;">
										<div class="modal-body">
											<form id="newgroupform" , method="post" , action="/group/insertgroup">
												<fieldset>
													<legend>團購</legend>
													<ol style="list-style-type: none;">
														<li>
															<label for="gTitle" style="display: flex;">團購標題:</label>
															<input type="text" name="gTitle" id="gTitle"
																placeholder="團購標題" style="width: 411px;">
															<span class="error-message"
																style="display: none; color: red;"></span>
														</li>
														<li>
															<label for="gDescription"
																style="display: flex;">團購簡述:</label>
															<textarea name="gDescription" id="gDescription"
																placeholder="團購描述"
																style="display: flex;justify-content: flex-end;width: 411px;"></textarea>
															<span class="error-message"
																style="display: none; color: red;"></span>
														</li>
														<li>
															<label for:"gEndTime" style="display: flex;">團購截止時間:</label>
															<input type="date" id="gEndTime" name="gEndTime"
																style="width: 411px;">
															<span class="error-message"
																style="display: none; color: red;"></span>
														</li>
														<li>
															<label for="gMinTotalAmount"
																style="display: flex;">成團金額:</label>
															<input type="number" name="gMinTotalAmount"
																id="gMinTotalAmount" placeholder="成團最小金額"
																style="width: 411px;">
														</li>
														<li>
															<label for="gMinTotalQuantity"
																style="display: flex;">成團數量:</label>
															<input type="number" name="gMinTotalQuantity"
																id="gMinTotalQuantity" placeholder="成團最小數量"
																style="width: 411px;">
														</li>
													</ol>
												</fieldset>
												<fieldset>
													<legend>付款細項</legend>
													<ol style="list-style-type: none;">
														<li>
															<label style="display: flex;">
																付款方式:
															</label>
															<label><input type="checkbox" name="payment"
																	value="1">匯款</label>
															<label><input type="checkbox" name="payment"
																	value="2">面交</label>
															<label><input type="checkbox" name="payment"
																	value="3">SB點數</label>
														</li>
														<li class="meetup-address" style="display:none;">
															<label style="display: flex;">
																面交地址:
															</label>
															<select id="city" name="city">
																<option value="">選縣市</option>
															</select>
															<select id="area" name="area" style="display:none;">
																<option value="">請選擇</option>
															</select>
															<br>
															<input type="text" name="address"
																style="display:none; width: 411px;">
														</li>
														<li class="bank-account" style="display:none;">
															<label style="display: flex;">
																匯款帳戶:
															</label>
															<select id="bank" name="bank">
																<option>銀行</option>
															</select>
															<input type="input" name="account" placeholder="帳戶"
																style="width: 411px;">
														</li>
													</ol>
												</fieldset>
												<fieldset>
													<div
														style="display: flex;align-items: center;justify-content: center;">
														<button type="submit" class="btn btn-primary"
															id="submitgroup">開團囉</button>
													</div>
												</fieldset>
										</div>
										</form>
									</div>
								</div>
							</div>

							<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
							<script
								src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
							<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
							<script>
								$(document).ready(function () {
									const url = '/json/taiwancity.json'
									$.ajax({
										url: url,
										type: "get",
										dataType: "json",
										success: function (data) {
											$.each(data, function (key, value) {
												$('#city').append('<option value="' + key + '">' + data[key].CityName + '</option>')
											})
										},
										error: function (data) {
											alert("讀取資料失敗");
										}
									});
									$("#city").change(function () {
										cityvalue = $("#city").val();
										$("#area").empty();
										$("#area").css("display", "inline");
										$.ajax({
											url: url,
											type: "get",
											dataType: "json",
											success: function (data) {
												eachval = data[cityvalue].AreaList;
												$.each(eachval, function (key, value) {
													$('#area').append('<option value="' + key + '">' + eachval[key].AreaName + '</option>')
												});
											},
											error: function () {
												alert("讀取資料失敗");
											}
										});
									});
									$("#area").change(function () {
										cityvalue = $("#city").val();
										areavalue = $("#area").val();
										if (!areavalue) return;
										$.ajax({
											url: url,
											type: "get",
											dataType: "json",
											success: function (data) {
												const cityname = data[cityvalue].CityName; // 取得所選縣市名稱
												const areaname = data[cityvalue].AreaList[areavalue].AreaName; // 取得所選鄉鎮名稱
												const selected = cityname + areaname; // 組合縣市與鄉鎮名稱
												$('input[name="address"]').val(selected).show();
											},
											error: function () {
												alert("讀取資料失敗");
											}
										});
									});
								});
							</script>
							<script>
								$(document).ready(function () {
									const url = '/json/taiwanbank.json'
									$.ajax({
										url: url,
										type: "get",
										dataType: "json",
										success: function (data) {
											$.each(data, function (key, value) {
												$('#bank').append('<option value="' + key + '">' + data[key].code + '-' + data[key].name + '</option>')
											})
											updateAccountInput(data);
										}
									})

									$('#bank').change(function () {
										const url = '/json/taiwanbank.json';
										$.ajax({
											url: url,
											type: "get",
											dataType: "json",
											success: function (data) {
												updateAccountInput(data);
											}
										});
									});

									function updateAccountInput(data) {
										const bankvalue = $('#bank').val();
										if (data[bankvalue]) {
											const bankcode = data[bankvalue].code + data[bankvalue].a;
											$('input[name="account"]').val(bankcode);
										}
									}
								})
							</script>
							<script>
								$(document).ready(function () {
									$('input[name="payment"]').change(function () {
										if ($('input[name="payment"][value="2"]').is(':checked')) {
											$('.meetup-address').show();
										} else {
											$('.meetup-address').hide();
										}

										if ($('input[name="payment"][value="1"]').is(':checked')) {
											$('.bank-account').show();
										} else {
											$('.bank-account').hide();
										}
									})
								})
							</script>
							<script>
								$(document).ready(function () {
									$('#newgroupform').submit(function (e) {
										var gTitle = $('#gTitle').val().trim();
										var gDescription = $('#gDescription').val().trim();
										var gEndTime = $('#gEndTime').val().trim();
										var errorMessages = [];

										if (gTitle === '') {
											errorMessages.push('團購標題');
										}
										if (gDescription === '') {
											errorMessages.push('團購簡述');
										}
										if (gEndTime === '') {
											errorMessages.push('團購截止時間');
										}

										if (errorMessages.length > 0) {
											e.preventDefault();
											Swal.fire({
												title: '錯誤!',
												html: '請填寫所有必填欄位：<br>' + errorMessages.join('、'),
												icon: 'error',
												confirmButtonText: '確定'
											});
										}
									});
								});
							</script>
						</body>

						</html>