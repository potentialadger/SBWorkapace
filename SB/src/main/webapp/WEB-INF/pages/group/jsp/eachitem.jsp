<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.group.model.GroupBean"%>
<%@page import="com.group.model.ItemsBean"%>
<%!@SuppressWarnings("unchecked")%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>商品詳情</title>
<style>
    body { font-family: Arial, sans-serif; }
    .container { display: flex; max-width: 1000px; margin: auto; padding: 20px; border: 1px solid #ccc; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 10px}
    .left-pane { width: 40%; margin-left: 10px}
    .right-pane { width: 60%; padding-left: 20px; display: flex; flex-direction: column; justify-content: space-between; }
    .item-image { width: 400px; height: 266px; object-fit: contain; }
    .item-name { font-size: 24px; margin-bottom: 10px; }
    .item-description { margin-bottom: 20px; }
    .item-price { font-size: 20px; color: green; margin-bottom: 10px; }
    .buy-button { padding: 10px 20px; background-color: #007bff; color: white; border: none; cursor: pointer; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; transition-duration: 0.4s; }
    .buy-button:hover { background-color: #0056b3; }
    .footer { text-align: center; margin-top: 20px; font-size: 14px; color: #777; }
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<div style="position: absolute; top: 10px; left: 10px;">
		<a href="groups.controller"><i class="fa-solid fa-arrow-left"></i></a>
	</div>
<jsp:useBean id="item" scope="request" class="com.group.model.ItemsBean"></jsp:useBean>
<div class="container">
    <div class="left-pane">
        <img src="groupimages/<%=item.getImgpath() %>" alt="<%=item.getItemname() %>" class="item-image">
    </div>
    <div class="right-pane">
        <div>
            <h1 class="item-name"><%=item.getItemname() %></h1>
            <p class="item-description">商品描述: <%=item.getItemdescription() %></p>
        </div>
        <div>
            <p class="item-price">NT$: <%=item.getPrice() %></p>
            <button class="buy-button">參加團購</button>
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
</body>
</html>
