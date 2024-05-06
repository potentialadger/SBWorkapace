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
							<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
						</head>

						<body>
							<div class="container" style="width: 68%">
								<button type="button" class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#newgroup">
									開團囉
								</button>
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
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal"
												aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form id="newgroupform" , method="put" , action="/insertgroup">
												<div>
													團購標題:
													<input type="text" name="gtitle" placeholder="團購標題">
												</div>
												<div>
													團購描述:
													<input type="text" name="gdescription" placeholder="團購描述">
												</div>
												<div>
													團購截止時間:
													<input type="date" name="gendtime">
												</div>
												<div>
													付款方式:
													<label><input type="checkbox" name="payment" value="1">匯款</label>
													<label><input type="checkbox" name="payment" value="2">面交</label>
													<label><input type="checkbox" name="payment" value="3">SB點數</label>
												</div>
												<div>
													成團金額:
													<input type="number" name="gmintotalamount" placeholder="成團最小金額">
												</div>
												<div>
													成團數量:
													<input type="number" name="gmintotalquantity" placeholder="成團最小數量">
												</div>
												<div class="meetup-address" style="display:none;">
													面交地址:
													<select id="city" name="city">
														<option value="">選縣市</option>
													</select>
													<select id="area" name="area" style="display:none;">
														<option value="">請選擇</option>
													</select>
												</div>
												<div class="bank-account" style="display:none;">
													匯款帳戶:
													<select id="bank" name="bank">
														<option>銀行</option>
													</select>
													<input type="input" placeholder="帳戶">
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary">Save changes</button>
										</div>
									</div>
								</div>
							</div>

							<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
							<script
								src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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
										cityvalue = $("#city").val();  // 取得使用者選擇的縣市
										$("#area").empty(); // 清空上次的值
										$("#area").css("display", "inline"); // 顯示第二層選單
										$.ajax({
											url: url,
											type: "get",
											dataType: "json",
											success: function (data) {
												eachval = data[cityvalue].AreaList; // 取得所選縣市的鄉鎮資料
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
										cityvalue = $("#city").val();  // 縣市
										areavalue = $("#area").val();  // 鄉鎮
										$.ajax({
											url: url,
											type: "get",
											dataType: "json",
											success: function (data) {
												const cityname = data[cityvalue].CityName; // 取得所選縣市名稱
												const areaname = data[cityvalue].AreaList[areavalue].AreaName; // 取得所選鄉鎮名稱
												const selected = cityname + "-" + areaname; // 組合縣市與鄉鎮名稱
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
										}
									})
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
						</body>

						</html>