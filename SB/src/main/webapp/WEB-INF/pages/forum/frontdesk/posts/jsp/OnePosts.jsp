<%@ page import="com.forum.bean.PostsBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>內文</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel='stylesheet' href='https://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
	<link rel="stylesheet" type="text/css" href="/mycss/forum_OnePosts.css">
	

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!--        <script src="js/test/Z_slider.js"></script>-->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <script src="/js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->

                <div class="container bootstrap snippets bootdey">
                    <div class="col-md-8">
                      <div class="box box-widget">
                        
                    <c:forEach var="post" items="${updateSelect}">
                        
                        <div class="box-header with-border">
                          <div class="user-block">
                           
                            <img class="img-circle" src="http://localhost:8080/localimages/${post.userBean.avatar}" alt="">
                            
                            <span class="username"><c:out value="${post.userBean.userChineseName}" /></span>
                            
                            <span class="description"><fmt:formatDate value="${post.update_date}" pattern="yyyy-MM-dd HH:mm" /></span>
                          
                          </div>
                         
                          <div class="box-tools">
                          
                           <form method="post" action="/postsFrontDesk/DeletePosts" onsubmit="return confirm('您確定要刪除這個帖子嗎？');">
                				<input type="hidden" name="postsNo" value="${post.post_no}">
                				<input type="hidden" name="_method" value="delete">
                					<button type="submit" ${post.userBean.userNo==userNo?"":"hidden"}>刪除</button>
           				   </form>
           				   
           				    <form method="get" action="/postsFrontDesk/UpdateSelectPosts">
               				   <input type="hidden" name="postsNo" value="${post.post_no}">
                					<button type="submit" ${post.userBean.userNo==userNo?"":"hidden"}>編輯</button>
            				</form>
                          
                          </div>
                          
                        </div>
                        
                        <div class="box-body">
                       	
                       	<c:out value="${post.title}" />
                    
                          <div class="attachment-block clearfix">
                            
                            <img class="attachment-img" src="http://localhost:8080/localimages/${post.image_url}">
                         
                         </div>
                          
                        <div class="forum-botton">
                          
                          <form method="get" action="/reportsFrontDesk/SelectReportsPosts">
                			<input type="hidden" name="postsNo" value="${post.post_no}">
               					 <button type="submit" class="forum-btn"><i class="fas fa-flag"></i>檢舉</button>
            			  </form>
                          
                          <button type="button" class="forum-btn" onclick="likeOrUnlike(${post.post_no})"><i class="fa fa-thumbs-o-up"></i>喜歡</button>
                          
                          <span id="likesCount${post.post_no}">${post.likesBean.size()}</span>
                        
                          <div class="watch-comments">
    						<div><i class="fas fa-eye"></i> <c:out value="${post.view_count}" /></div>
    						<div><i class="fas fa-comment"></i> <c:out value="${post.repliesBean.size()}"/></div>
						  </div>
                        
                        </div>
                        
                   	</div>
                   	
                        <div class="box-footer">
                          
                          <form id="replyForm" method="post" action="/repliesFrontDesk/InsertReplies">
                          	<input type="hidden" name="user_no" value="${post.userBean.userNo}">
        					<input type="hidden" name="post_no" value="${post.post_no}">
                            
                            <img class="img-responsive img-circle img-sm" src="http://localhost:8080/localimages/${post.userBean.avatar}" alt="">
                            
                            <div class="img-push">
                              <input id="replyContent" name="content" type="text" class="form-control input-sm" placeholder="Press enter to post comment">
                         	  <button type="button" class="submit-reply" onclick="submitReply()">提交回覆</button>
                            </div>
                         	
                          </form>
                        
                         </div>
                   
                   </c:forEach>
                        
                        
                        <div class="box-footer box-comments">
                          
                          <c:if test="${not empty repliesM}">
                          	<c:forEach var="replies" items="${repliesM}">
                          
                          <div class="box-comment">
                            
                            <img class="img-circle img-sm" src="http://localhost:8080/localimages/${replies.userBean.avatar}" alt="">
                            
                            <div class="comment-text">
                              
                              <span class="username">
                              <c:out value="${replies.userBean.userChineseName}" />
                              
                              <span class="text-muted pull-right"><fmt:formatDate value="${replies.update_date}" pattern="yyyy-MM-dd HH:mm" /></span>
                              
                              </span>
                              
                              <c:out value="${replies.content}" />
                              
                            
                            </div>
                          
                              <div class="delete-and-edit-replies">
                              
                              <button class="delete-btn" data-reply-id="${replies.reply_no}" onclick="confirmDelete(this)">刪除</button>
                              
                              <form method="get" action="/repliesFrontDesk/UpdateSelectReplies">
                    			<input type="hidden" name="repliesNo" value="${replies.reply_no}">
                    				<button type="submit">編輯</button>
                			  </form>
                              
                              </div>
                          
                          </div>
                              
                           </c:forEach>
    					</c:if>
                        
                     <c:if test="${empty repliesM}">
       					 <div>
            				<div colspan="5">尚無回覆</div>
        				</div>
   					</c:if>
                        
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
    
    <script>
	
    //喜歡
    function likeOrUnlike(post_no) {
        $.ajax({
            url: "/likesFrontDesk/likeOrUnlike?post_no=" + post_no,
            method: 'POST',
            success: function (response) {
                var likesCountSpan = document.getElementById('likesCount' + post_no);
                var currentLikesCount = parseInt(likesCountSpan.innerText);
                if (response === "Liked") {
                    likesCountSpan.innerText = currentLikesCount + 1;
                } else if (response === "Unliked") {
                    likesCountSpan.innerText = currentLikesCount - 1;
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
    
	//回覆
    function submitReply() {
        $.ajax({
            url: "/repliesFrontDesk/InsertReplies",
            method: 'POST',
            data: {
                user_no: $("#replyForm input[name='user_no']").val(),
                post_no: $("#replyForm input[name='post_no']").val(),
                content: $("#replyContent").val()
            },
            success: function (response) {
                // 在這裡處理成功提交回覆後的邏輯

                // 清空回覆內容輸入框
                $("#replyContent").val('');
                
                // 重新整理頁面以顯示新回覆
                location.reload();
            },
            error: function (error) {
                console.log(error);
            }
        });
        
    }
       
		//刪除回覆
        function deleteReply(button) {
         	// 這裡改為使用 'reply-id' 而不是 'reply-no'
            var replyNo = $(button).data('reply-id'); 
            $.ajax({
                url: "/repliesFrontDesk/DeleteReplies",
                method: 'POST', // 或 'DELETE'，根據您的後端設定
                data: { repliesNo: replyNo },
                success: function (response) {
                	// 刪除成功後，直接移除回覆的部分
                    $(button).closest('.reply').remove(); // 刪除整個回應 div
                    
                    location.reload();
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
        
        //確定是否刪除回覆
        function confirmDelete(button) {
            var replyNo = $(button).data('reply-id');
            var confirmation = confirm('您確定要刪除此回覆嗎？');
            if (confirmation) {
                deleteReply(button); // 如果用戶確定刪除，則調用刪除回覆的函數
            }
        }
        
        function editReply(replyId) {
            // 獲取回覆內容的 div 元素
            var replyContentDiv = document.getElementById('replyContent_' + replyId);
            
            // 獲取回覆的原始內容
            var originalContent = replyContentDiv.innerText.trim();
            
            // 將原始內容替換為可編輯的文本框
            replyContentDiv.innerHTML = '<textarea id="editedReplyContent_' + replyId + '" rows="4" cols="50">' + originalContent + '</textarea>';
            
            // 添加保存按鈕
            replyContentDiv.innerHTML += '<button onclick="saveEditedReply(' + replyId + ')">保存</button>';
        }
		
</script>


</body>

</html>