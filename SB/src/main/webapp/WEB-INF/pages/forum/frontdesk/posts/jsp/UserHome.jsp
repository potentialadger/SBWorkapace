<%@ page import="com.forum.bean.PostsBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首頁</title>
<style>
.forum-container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

.search-form {
	margin-bottom: 20px;
}

.forum-posts {
	display: flex;
	flex-direction: column;
}

.post {
	border: 1px solid #ccc;
	margin-bottom: 20px;
	padding: 10px;
}

.post-date {
	font-size: 14px;
	color: #888;
}

.post-title {
	font-size: 18px;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 10px;
}

.post-content {
	font-size: 16px;
	margin-bottom: 10px;
}

.post-image img {
	max-width: 100%;
	height: auto;
	float: right;
	margin-left: 10px;
}

.post-footer {
	font-size: 14px;
	color: #888;
	margin-top: 10px;
}

.post-footer div {
	display: inline-block;
	margin-right: 10px;
}

.post-date-container {
	display: flex;
	flex-direction: row;
}

.post-date-container .post-date {
	margin-right: 20px;
}

.categories-container {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	margin-bottom: 20px;
}

.category {
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<div class="categories-container">
		<div class="category-header">
			<input type="text" id="searchInput" onkeyup="filterCategories()" placeholder="搜尋分類...">
			<div class="category-title">分類</div>
		</div>
		<c:forEach var="category" items="${categoriesM}">
			<div class="category">
				<a
					href="/postsFrontDesk/CategoriesPosts?categoryNo=${category.category_no}">
					<c:out value="${category.title_name}" />
				</a>
			</div>
		</c:forEach>
	</div>

	<div class="forum-container">
		<form class="search-form" method="get"
			action="/postsFrontDesk/OnePosts">
			查詢: <input type="text" name="postsBeanKeyword" required>
			<button type="submit">送出</button>
		</form>

		<form method="get" action="/postsFrontDesk/AllPosts">
			<button type="submit">全部文章</button>
		</form>

		<div class="forum-posts">
			<c:if test="${not empty postsM}">
				<c:forEach var="post" items="${postsM}">
					<div class="post">
						<div class="post-date-container">
							<div class="post-date">${post.categoriesBean.title_name}</div>
							<div class="post-date">${post.update_date}</div>
						</div>
						<a
							href="/postsFrontDesk/SelectPosts?postsNo=${post.post_no}&title=${post.title}"
							class="post-title">${post.title}</a>
						<div class="post-content">${post.content}</div>
						<div class="post-image">
							<img src="${post.image_url}" alt="Post Image">
						</div>
						<div class="post-footer">
							<div class="post-likes">${post.likesBean.size()}likes</div>
							<div class="post-replies">${post.repliesBean.size()}
								replies</div>
							<div class="post-views">${post.view_count}views</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${empty postsM}">
				<div class="post">
					<div class="post-content">尚無資料</div>
				</div>
			</c:if>
		</div>
	</div>

	<script>
	function filterCategories() {
	    var input, filter, categories, category, txtValue;
	    //通過元素的 ID 獲取一個 HTML 元素，這個元素是一個輸入框，其 ID 是 searchInput(在上面的input)
	    input = document.getElementById('searchInput');
	   //將輸入框中的值轉換成大寫，並賦值給 filter 變數(都轉成大寫以便做比較)
	    filter = input.value.toUpperCase();
	    //透過 div的id 去取到此div裡面的東西 他會是一個集合(所有分類)
	    categories = document.getElementsByClassName('category');
	    for (var i = 0; i < categories.length; i++) {
	    	//這行程式碼是為了從每個分類元素中取 <a> 標籤，以實現為每個分類都創建一個超連結
			//意思是i=1 會存放一筆分類 我再從這筆分類去取超連結<a>標籤
			//getElementsByTagName方法不需要<符號，因為它是用來選取指定標籤名的HTML元素 getElementsByTagName (按標籤名稱取得元素)
			//即使我的categories[i]中只有一筆分類=只有一個超連結 我仍然要加[0](通常是在有很多超連結的狀況下取第1個)
	        //categories=list category也是 categories[i]也是 getElementsByTagName('a')[0]也是
			category = categories[i].getElementsByTagName('a')[0];
	        	//textContent 和 innerText 都用於獲取元素中的文本內容 怕瀏覽器不支持其中一個 所以都用
				//取出文本內容的目的是為了將分類的名稱顯示在前端
	            txtValue = category.textContent || category.innerText;
	        	//類似關鍵字的模糊查詢功能 根據用戶輸入的搜尋關鍵字來遍歷所有分類，並將不匹配該關鍵字的分類隱藏起來（設置 display: 'none'），而將匹配的分類顯示出來（設置 display: ''）
	        	//將txtValue(現有的分類)轉為大寫與filter(使用者輸入)比對 來查詢有沒有她要的分類
	        	//意思是再txtValue 中有我本來的分類(資料庫存在的)假設 0為工作(第一個) 1為藝術(第二個) 如果使用者輸入的資訊 再txtValue 中找不到 就等於-1
	        	//就算輸入的內容不完全相同，indexOf 也會返回一個大於 -1 的值 就是模糊查詢 所以要用indexOf
	        	if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        		//如果找到了匹配的關鍵字，則將該分類元素顯示出來 通過 display 屬性為空字符串，可以將元素顯示出來
	                categories[i].style.display = '';
	            } else {
	            	//如果沒有找到匹配的關鍵字，則將該分類元素隱藏起來 通過 display 屬性設置為 'none'，可以將元素隱藏起來
	                categories[i].style.display = 'none';
	            }
	    	}
	}
	</script>
</body>
</html>