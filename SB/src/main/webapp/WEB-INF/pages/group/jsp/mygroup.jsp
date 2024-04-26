<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.group.model.GroupBean"%>
<%@page import="com.group.model.ItemsBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Group</title>
<style>
td {
	text-align: center;
	border
	="1"
}

th {
	text-align: center;
	border
	="1"
}

tr {
	text-align: center;
	border
	="1"
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body style="background-color: #fdf5e6">
	<div style="position: absolute; top: 10px; left: 10px;">
		<a href="groups.controller"><i class="fa-solid fa-arrow-left"></i></a>
	</div>
	<div align="center">
		<h2>你的團購</h2>
		<table border="1">
			<tr style="background-color: #a8fefa">
				<th>活動編號
				<th>活動標題
				<th>活動描述
				<th>截團時間
				<th>最小成團金額
				<th>最小成團數量
				<th>付款方式
				<th>修改
				<th>刪除 <%
				List<GroupBean> groups = (ArrayList<GroupBean>) request.getAttribute("groups");
				for (GroupBean group : groups) {
				%>
			<tr>
				<td><%=group.getGroupeventno()%>
				<td><%=group.getGrouptitle()%>
				<td><%=group.getGroupdescription()%> <%
 Date endTime = group.getEndtime();
 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 String formattedEndTime = sdf.format(endTime);
 %>
				<td><%=formattedEndTime%>
				<td><%=group.getMintotalamount()%>
				<td><%=group.getMintotalquantity()%> <%
 String paymentMethodDisplay = "";

 switch (group.getPaymentmethod()) {
 	case 1 :
 		paymentMethodDisplay = "LinePay";
 		break;
 	case 2 :
 		paymentMethodDisplay = "匯款";
 		break;
 	case 12 :
 		paymentMethodDisplay = "LinePay, 匯款";
 		break;
 	default :
 		paymentMethodDisplay = "未知支付方式";
 		break;
 }
 %>
				<td><%=paymentMethodDisplay%>
				<td><button class="update btn btn-primary btn-lg"
						data-groupeventno="<%=group.getGroupeventno()%>"
						data-grouptitle="<%=group.getGrouptitle()%>"
						data-groupdescription="<%=group.getGroupdescription()%>"
						data-groupendtime="<%=formattedEndTime%>"
						data-groupmintotalamount="<%=group.getMintotalamount()%>"
						data-groupmintotalquantity="<%=group.getMintotalquantity()%>"
						data-grouppaymentmethod="<%=paymentMethodDisplay%>"
						data-bs-toggle="modal" data-bs-target="#exampleModal">
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
													value="<%=group.getGrouptitle()%>" />
												
											</div>
											<div
												style="display: flex; align-items: center; margin-bottom: 10px">
												<div style="width: 150px">團購描述:</div>
												<textarea name="gdescription" class="swal2-input"
													style="height: 80px"><%=group.getGroupdescription()%></textarea>
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
						data-groupeventno="<%=group.getGroupeventno()%>">
						<i class="fa-solid fa-xmark"></i>
					</button> <%
 }
 %>
		</table>
		<h3>
			共<%=groups.size()%>筆團購
		</h3>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://kit.fontawesome.com/f8f71426ea.js"
		crossorigin="anonymous"></script>
	<script>
		$(function() {
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
		})
	</script>
	<script>
	$(document).ready(function() {
	    $('button.update').on('click', function() {
	       
	        var groupeventno = $(this).data('groupeventno');
	        var grouptitle = $(this).data('grouptitle');
	        var groupdescription = $(this).data('groupdescription');
	        var groupendtime = $(this).data('groupendtime');
	        var groupmintotalamount = $(this).data('groupmintotalamount');
	        var groupmintotalquantity = $(this).data('groupmintotalquantity');
	        var grouppaymentmethod = $(this).data('grouppaymentmethod');

	      
	        $('.modal-body').find('[name="gtitle"]').val(grouptitle);
	        $('.modal-body').find('[name="gdescription"]').val(groupdescription);
	        $('.modal-body').find('[name="gendtime"]').val(groupendtime.split(' ')[0]);
	        $('.modal-body').find('[name="MinTotalAmount"]').val(groupmintotalamount);
	        $('.modal-body').find('[name="MinTotalQuantity"]').val(groupmintotalquantity);

	        $('.modal-body').find('[name="payment"]').prop('checked', false);
	        if (grouppaymentmethod.includes("LinePay")) {
	            $('.modal-body').find('[name="payment"][value="1"]').prop('checked', true);
	        }
	        if (grouppaymentmethod.includes("匯款")) {
	            $('.modal-body').find('[name="payment"][value="2"]').prop('checked', true);
	        }

	        $('.modal-body').data('groupeventno', groupeventno);
	    });

	  
	    $('#updatesubmit').off('click').on('click', function() {
	        var isPayment1Checked = $('.modal-body').find('[name="payment"][value="1"]').prop('checked');
	        var isPayment2Checked = $('.modal-body').find('[name="payment"][value="2"]').prop('checked');

	        var paymentmethod = 0;
	        if (isPayment1Checked && isPayment2Checked) {
	            paymentmethod = 12;
	        } else if (isPayment1Checked) {
	            paymentmethod = 1;
	        } else if (isPayment2Checked) {
	            paymentmethod = 2;
	        }

	       
	        var formData = {
	            groupeventno: $('.modal-body').data('groupeventno'),
	            grouptitle: $('.modal-body').find('[name="gtitle"]').val(),
	            groupdescription: $('.modal-body').find('[name="gdescription"]').val(),
	            endtime: $('.modal-body').find('[name="gendtime"]').val(),
	            mintotalamount: $('.modal-body').find('[name="MinTotalAmount"]').val(),
	            mintotalquantity: $('.modal-body').find('[name="MinTotalQuantity"]').val(),
	            paymentmethod: paymentmethod
	        };

	    
	        $.ajax({
	            url: 'UpdateGroup',
	            type: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify(formData),
	            success: function(response) {
	                location.reload();
	            },
	            error: function(xhr, status, error) {
	                console.error("更新失败:", error);
	            }
	        });
	    });
	});

	</script>
</body>
</html>