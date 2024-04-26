<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.group.model.GroupBean"%>
<%@page import="com.group.model.ItemsBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SB團購 活動</title>
<style>
#insert {
	background-color: green;
	color: white;
	padding: 2px 10px;
	border: none;
	cursor: pointer;
	border-radius: 20px;
	margin-left: 693px;
	margin-right: 10px;
}

#insert:hover {
	background-color: darkgreen;
}

#searchbtn {
	padding: 10px 10px;
	margin-left: 0;
	border: none;
	background: transparent;
	cursor: pointer;
	font-size: 35px;
	text-decoration: none;
}

#search, select {
	margin: 0;
	border: 1px solid #ccc; 
	padding: 2.5px 10px; 
}

/* 用于确保select、#search、#searchbtn之间没有空隙 */
.search-group * {
	display: inline-block;
	vertical-align: middle; /* 对齐方式 */
}

.search-group {
	white-space: nowrap; /* 防止元素换行 */
}

.controller {
	display: flex;
	justify-content: center;
	height: 50px;
	margin: 5px
}

.group {
	display: flex;
	justify-content: center;
}

.eventbtn {
	text-decoration: none;
}

#select {
	padding: 5px 10px; /* 调整内填充 */
	margin: 5px 0; /* 调整外边距 */
}

#myEventbtn {
	margin-left: 100px
}
</style>
<script src="https://kit.fontawesome.com/f8f71426ea.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="controller">
		<a href="ManagerIndex"><button class="btn btn-primary">回首頁</button></a><br>
		<br>

		<button id="insert">我要開團購</button>
		<select id="select">
			<option value="Title">標題</option>
		</select>
		<nav class="navbar bg-body-tertiary">
			<div class="container-fluid">
				<form class="d-flex" role="search" action="findgroupbysearch" method="get">
					<input name="searchText" class="form-control me-2" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</nav>
		<div id="myEventbtn" class="ms-auto">
			<button id="myEvent" class="btn btn-primary">我的團購</button>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<%
			List<GroupBean> groups = (ArrayList<GroupBean>) request.getAttribute("groups");
			int count = 0;
			for (GroupBean group : groups) {
				if (count % 3 == 0 && count != 0) {
			%>
		</div>
		<div class="row mt-3">
			<%
			}
			count++;
			%>

			<div class="col-md-4 mb-4">
				<div class="card" style="width: 18rem;">
					<%
					String imgPath = "#";
					if (group.getItems() != null && group.getItems().getImgpath() != null) {
						imgPath = group.getItems().getImgpath();
					}
					%>
					<img src="/groupimages/<%=imgPath%>" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=group.getGrouptitle()%></h5>
						<p class="card-text"><%=group.getGroupdescription()%></p>
						<a href="eachitem?groupNo=<%=group.getGroupeventno()%>"
							class="btn btn-primary">商品介紹</a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js"></script>
	<script>
	$(function() {
	    $("#insert").click(function() {
	        Swal.fire({
	            title: '開團購',
				html :`
				    <form id="groupForm" method="put" action="insertgroup">
				      <div style="text-align: left">
				        <div style="display: flex; align-items: center; margin-bottom: 10px">
				          <div style="width: 150px">團購標題:</div>
				          <input name="gtitle" class="swal2-input" placeholder="團購標題" />
				        </div>
				        <div style="display: flex; align-items: center; margin-bottom: 10px">
				          <div style="width: 123px">團購描述:</div>
				          <textarea
				            name="gdescription"
				            class="swal2-input"
				            placeholder="團購描述"
				            style="height: 80px"
				          ></textarea>
				        </div>
				        <div style="display: flex; align-items: center; margin-bottom: 10px">
				          <div style="width: 123px">團購截止時間:</div>
				          <input
				            name="gendtime"
				            type="date"
				            class="swal2-input"
				            style="width: 250px"
				          />
				        </div>
				        <div style="display: flex; align-items: center; margin-bottom: 10px">
				          <div style="width: 165px">付款方式:</div>
				          <label
				            ><input
				              type="checkbox"
				              name="payment"
				              value="1"
				              style="margin-right: 5px"
				            />LinePay</label
				          >&nbsp;
				          <label
				            ><input
				              type="checkbox"
				              name="payment"
				              value="2"
				              style="margin-right: 5px"
				            />匯款</label
				          >
				        </div>
				        <div style="display: flex; align-items: center; margin-bottom: 10px">
				          <div style="width: 150px">成團金額:</div>
				          <input
				            type="number"
				            name="MinTotalAmount"
				            class="swal2-input"
				            placeholder="成團最小金額"
				          />
				        </div>
				        <div style="display: flex; align-items: center; margin-bottom: 10px">
				          <div style="width: 150px">成團數量:</div>
				          <input
				            name="MinTotalQuantity"
				            class="swal2-input"
				            placeholder="成團最少數量"
				          />
				        </div>
				        <br />
				        <div style="display: flex,justify-content: center">
				          <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;確認輸入無誤按下OK輸入商品資訊</h4>
				        </div>
				      </div>
				    </form>`,
					
					  preConfirm: () => {
			                return new Promise((resolve) => {
			                    const form = $("#groupForm");
			                    $.ajax({
			                        url: 'insertgroup', 
			                        type: 'POST', 
			                        data: form.serialize(), 
			                        success: function(response) {
			                            // 成功的回調函數
			                            Swal.fire({
			                            	title:'新增商品',
			                            	html:'<form id="itemForm" method="post" action="insertitem" enctype="multipart/form-data">'
			                            		+'<div style="text-align: left;">'
			                            		+ '<div style="display: flex; align-items: center; margin-bottom: 10px;">'
			                					+ '<div style="width: 150px;">商品名稱:</div>'
			                					+ '<input name="iname" class="swal2-input" placeholder="商品名稱">'
			                					+ '</div>'
			                					+ '<div style="display: flex; align-items: center; margin-bottom: 10px;">'
			                					+ '<div style="width: 150px;">商品價錢:</div>'
			                					+ '<input name="iprice" type="number" class="swal2-input" placeholder="商品價錢">'
			                					+ '</div>'
			                					+ '<div style="display: flex; align-items: center; margin-bottom: 10px;">'
			                					+ '<div style="width: 150px;">商品描述:</div>'
			                					+ '<input name="idescription" class="swal2-input" placeholder="商品描述">'
			                					+ '</div>'
			                					+ '<div style="display: flex; align-items: center; margin-bottom: 10px;">'
			                					+ '<div style="width: 150px;">商品圖片:</div>'
			                					+ '<input name="ipicture" class="swal2-input" type="file">'
			                					+ '</div>'
			                					+ '</div>'
			                					+ '</form>',
			                					 preConfirm: () => {
			                						 $("#itemForm").submit();
			                					 }
			                            });
			                            resolve();
			                        },
			                        error: function(xhr, status, error) {
			                            // 失敗的回調函數
			                            Swal.fire('提交失敗', error, 'error');
			                            resolve();
			                        }
			                    });
			                });
			            }
			        });
			    });
	    $("#myEvent").click(function(){
	    	window.location.href = "mygroup"
	    })
			});
	</script>
</body>
</html>