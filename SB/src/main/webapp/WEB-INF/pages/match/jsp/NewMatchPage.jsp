<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.match.bean.MatchBean"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">


<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!--FontAwesome圖標字體-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <link rel="stylesheet" href="mycss/MatchPage.css">
    <link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="mycss/MatchPage.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
    
    

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
                <script src="js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->

	
	
	
	<!--組織和定位網頁中的內容-->
	<div class="app-container">



		<!--定位或樣式控制-->
		<div id="menu">
			<!--列出了一個朋友清單。這個清單可能是用來顯示聯繫人列表的-->
			<div id="friendslist">
				<!--包含了一個頂部菜單，裡面包含了三個 <span> 元素，每個 <span> 元素可能用於不同的操作，如顯示好友、聊天、或歷史記錄-->
				<div id="leftmenu">
					<!--<span class="chats"></span>
                        <span class="history"></span>-->


					<!--首頁-->
					<a href="#" class="nav-link icon" id="home"> 
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home" viewBox="0 0 24 24">
           			<path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z" />
           			<path d="M9 22V12h6v10" />
         			</svg>
         			</a> 
         			
         			<!-- 好友 -->
         			<a href="/matchFriends" class="nav-link icon" id="friends">          			
         			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-heart" viewBox="0 0 16 16">
				    <path d="M9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276Z"/>
					</svg>
					
         			<!-- 編輯 -->
         			<a href="/editMatchProfile" class="nav-link icon" id="edit"> 
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-folder" viewBox="0 0 24 24">
		            <path d="M22 19a2 2 0 01-2 2H4a2 2 0 01-2-2V5a2 2 0 012-2h5l2 3h9a2 2 0 012 2z" />
 		            </svg>          
					</a>
				</div>
			</div>
		</div>



		<!--Tinder-->
		<div class="app-main">


			<!--照片-->
			<div class="card-container">
				<div class="carousel" id="userPhotos1"><img src="/localimages/${photos[0]}" alt="" style= "object-fit: cover;"></div>
				<div class="carousel" id="userPhotos2"><img src="/localimages/${photos[1]}" alt="" style= "object-fit: cover;"></div>
				<div class="carousel" id="userPhotos3"><img src="/localimages/${photos[2]}" alt="" style= "object-fit: cover;"></div>
				<div class="carousel" id="userPhotos4"><img src="/localimages/${photos[3]}" alt="" style= "object-fit: cover;"></div>
			</div>  



			<!--按鈕-->
			<div class="tinder">
				<div class="tinder--buttons">
					<form action="/dislike/${userBean.userNo}" method="post">
						<button id="nope" type="submit">
							<i class="fa fa-remove"></i>
						</button>
					</form>
				
					<form action="/like/${userBean.userNo}" method="post">
						<button id="love" type="submit">
							<i class="fa fa-heart"></i>
						</button>
					</form>
				</div>
			</div>
		</div>



		<div class="right-side">
			<div class="chat-container">
				<div class="chat-header">

					<div class="matchsname">${userBean.nickName} ${userBean.userNo}</div>
					
					<div class="tags">
					    <c:forEach var="tagName" items="${tagNames}">
				        	<span class="tag">#${tagName}</span>
					    </c:forEach>
					</div>
					
					<div class="social">
						<a href="#"><i class="fa fa-facebook"></i></a> 
						<a href="#"> <i class="fa fa-twitter"></i></a> 
						<a href="#"> <i class="fa fa-google-plus"></i></a>
						<hr class="hr">
					</div>


					<div class="goal">
						尋找關係<br> 
						
						<span class="goal-text"><c:choose>
								<c:when test="${userBean.goalNo == 1}">不回答</c:when>
								<c:when test="${userBean.goalNo == 2}">網友</c:when>
								<c:when test="${userBean.goalNo == 3}">飯友</c:when>
								<c:when test="${userBean.goalNo == 4}">酒友</c:when>
								<c:when test="${userBean.goalNo == 5}">牌友</c:when>
								<c:when test="${userBean.goalNo == 6}">山友</c:when>
								<c:when test="${userBean.goalNo == 7}">旅伴</c:when>
								<c:when test="${userBean.goalNo == 8}">戀愛伴侶</c:when>
								<c:when test="${userBean.goalNo == 9}">結婚對象</c:when>
								<c:when test="${userBean.goalNo == 10}">朋友關係</c:when>
								<c:when test="${userBean.goalNo == 11}">短暫浪漫</c:when>
								<c:when test="${userBean.goalNo == 12}">匿名網友</c:when>
								<c:when test="${userBean.goalNo == 13}">一起運動</c:when>
								<c:when test="${userBean.goalNo == 14}">一起團購</c:when>
								<c:when test="${userBean.goalNo == 15}">外送拼單</c:when>
								<c:when test="${userBean.goalNo == 16}">不設限</c:when>

								<c:otherwise>其他</c:otherwise>
							</c:choose></span>
						<hr class="hr">
					</div>

					<div class="topic">
						我想聊的話題是
						<hr class="hr">
					</div>

					<div class="aboutMe">
						關於我
						
						
					<div class="info-container">
						<div class="gender">
							性別&nbsp;&nbsp; <span class="gender-text"><c:choose>
									<c:when test="${userBean.gender == 0}">生理女</c:when>
									<c:otherwise>生理男</c:otherwise>
								</c:choose></span>
						</div>

						<div class="birthday">
						    生日&nbsp;&nbsp; <span class="date">${localDateTimeDateFormat.format(userBean.birthday)}</span>
						</div>
						<!-- <div class="starSign">星座 </div> -->

						<div class="bloodType">
						    血型&nbsp;&nbsp; <span class="blood-type-value">${userBean.bloodType}</span>
						</div>
						
						<div class="MBTI">MBTI&nbsp; ${userBean.MBTI}</div>
					</div>
				</div>
			</div>
		</div>		
	</div>
</div>
		
		

<script>
				
				
				
				'use strict';

				$(document).ready(function() {
				    var currentUserNo;
				    var nope = $('#nope');
				    var love = $('#love');

				    // 獲取當前用戶ID
				    function getCurrentUserNo() {
				        $.ajax({
				            url: '/getCurrentUserNo',
				            type: 'GET',
				            async: false,
				            success: function(userNo) {
				                if (userNo !== null) {
				                    currentUserNo = userNo;
				                } else {
				                    console.log('User not logged in');
				                }
				            },
				            error: function(xhr, status, error) {
				                console.error('Error getting current user ID:', error);
				            }
				        });
				    }

				    getCurrentUserNo();

				    function createButtonListener(love) {
				        return function(event) {
				            var user2No = ${userBean.userNo}; // 獲取當前顯示的用戶編號

				            var url = love ? '/like/' + user2No : '/dislike/' + user2No;

				            $.ajax({
				                url: url,
				                type: 'POST',
				                success: function(response) {
				                    console.log(response);
				                    // 重新載入當前頁面
				                    location.reload();
				                },
				                error: function(xhr, status, error) {
				                    console.error('Error updating match status:', error);
				                }
				            });

				            event.preventDefault();
				        };
				    }

// 				    var nopeListener = createButtonListener(false);
// 				    var loveListener = createButtonListener(true);

// 				    nope.on('click', nopeListener);
// 				    love.on('click', loveListener);
				});
				


// 獲取所有按鈕和內容容器
const buttons = document.querySelectorAll('.nav-link.icon');
const contentContainer = document.querySelector('.content-container');

// 為每個按鈕添加點擊事件監聽器
buttons.forEach(button => {
  button.addEventListener('click', () => {
    // 清空內容容器
    contentContainer.innerHTML = '';

    // 根據按鈕的 ID 或類別創建對應的內容
    const content = document.createElement('div');
    switch (button.id) {
      case 'home':
        content.textContent = '這是主頁內容';
        break;
      case 'messages':
        content.textContent = '這是訊息內容';
        break;
      // 其他按鈕對應的內容
    }

    // 將內容添加到容器中
    contentContainer.appendChild(content);

    // 切換內容容器的可見性
    contentContainer.style.display = contentContainer.style.display === 'none' ? 'block' : 'none';
  });
});







  //確保當文檔完全加載完成後才運行 JavaScript 代碼。
  $(document).ready(function(){
  //切換明亮和暗黑模式
  $('button.mode-switch').click(function(){
    $('body').toggleClass('dark');
  });
  
  $(".btn-close-right").click(function () {
    $(".right-side").removeClass("show");
    $(".expand-btn").addClass("show");
  });
  
  $(".expand-btn").click(function () {
    $(".right-side").addClass("show");
    $(this).removeClass("show");
  });
});
      
      
      
      
  //leftbox    
      
        const friendsBtn = $('#leftmenu .friends');
  const chatbox = $('#chatbox');

  let chatboxVisible = false; // 初始狀態為隱藏

  // 為 friends 按鈕添加點擊事件監聽器
  friendsBtn.click(() => {
    // 切換 chatboxVisible 的值
    chatboxVisible = !chatboxVisible;

    // 根據 chatboxVisible 的值顯示或隱藏 chatbox 區塊
    chatbox.toggle(chatboxVisible);
  });
  
  
    //leftbox 
      
      
  
  
 
  
 	/*在載入完畢後，會創建一個隱藏的圖片物件 preloadbg，*/
    var preloadbg = document.createElement("img");
    preloadbg.src = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/timeline1.png";
    
	/*處理搜索欄位 #searchfield 和訊息輸入欄位 #sendmessage input 的焦點事件，當焦點進入時，清空預設的提示文字，焦點離開時，如果輸入為空，則恢復預設的提示文字。*/
      $("#searchfield").focus(function(){
          if($(this).val() == "Search contacts..."){
              $(this).val("");
          }
      });
      $("#searchfield").focusout(function(){
          if($(this).val() == ""){
              $(this).val("Search contacts...");
              
          }
      });
      
      $("#sendmessage input").focus(function(){
          if($(this).val() == "Send message..."){
              $(this).val("");
          }
      });
      $("#sendmessage input").focusout(function(){
          if($(this).val() == ""){
              $(this).val("Send message...");
              
          }
      });
          
      /*對每個 .friend 元素添加點擊事件處理器。當點擊朋友時，會執行以下操作：*/
      $(".friend").each(function(){		

		  /*複製被點擊朋友的頭像，並將其樣式設置為浮動，然後附加到 #chatbox 中。*/
          $(this).click(function(){
              var childOffset = $(this).offset();
              var parentOffset = $(this).parent().parent().offset();
              var childTop = childOffset.top - parentOffset.top;
              var clone = $(this).find('img').eq(0).clone();
              var top = childTop+12+"px";
              
              $(clone).css({'top': top}).addClass("floatingImg").appendTo("#chatbox");									
              
			  /*進行一系列的動畫效果，包括設置 #profile 的樣式和顯示聊天訊息的動畫效果。*/
              setTimeout(function(){$("#profile p").addClass("animate");$("#profile").addClass("animate");}, 100);
              setTimeout(function(){
                  $("#chat-messages").addClass("animate");
                  $('.cx, .cy').addClass('s1');
                  setTimeout(function(){$('.cx, .cy').addClass('s2');}, 100);
                  setTimeout(function(){$('.cx, .cy').addClass('s3');}, 200);			
              }, 150);														
              
			  /*點擊聊天朋友後，顯示相關的聊天內容和資訊*/           /*調整profile頭像位置*/
              $('.floatingImg').animate({
                  'width': "68px",
                  'left':'130px',
                  'top':'20px'
              }, 200);
              
			  /*從被點擊的朋友元素中獲取名字和電子郵件地址*/
              var name = $(this).find("p strong").html();
              var email = $(this).find("p span").html();	
			  
			  /*將獲取到的名字和電子郵件地址分別設置到聊天視窗中的對應元素中，用來顯示朋友的名字和電子郵件地址。*/
              $("#profile p").html(name);
              $("#profile span").html(email);			
              
			  /*這行程式碼用來設置聊天視窗中最後一條訊息的圖像，將其設置為被點擊的朋友的頭像。*/
              $(".message").not(".right").find("img").attr("src", $(clone).attr("src"));	
			  /*這兩行程式碼用來控制朋友列表的淡出效果和聊天視窗的淡入效果，實現在切換朋友時的視覺效果。*/								
              $('#friendslist').fadeOut();
              $('#chatview').fadeIn();
          
              
			  /*實現關閉聊天視窗時的動作*/
			  /*為關閉按鈕 #close 添加了一個點擊事件處理器。使用 unbind("click") 是為了確保在綁定新的點擊事件之前先解除舊的點擊事件，以防止事件重複綁定。*/
              $('#close').unbind("click").click(function(){		
				  /*除了聊天訊息區域、使用者資訊和使用者名稱的動畫效果。*/		
                  $("#chat-messages, #profile, #profile p").removeClass("animate");
				  /*移除了動畫效果中使用的樣式類名，以停止動畫效果。*/
                  $('.cx, .cy').removeClass("s1 s2 s3");
				  /*對浮動的頭像執行動畫效果，將其寬度調整為 40px，並且移回到原始位置，最後在動畫完成後將浮動的頭像移除。*/
                  $('.floatingImg').animate({
                      'width': "40px",
                      'top':top,
                      'left': '12px'
                  }, 200, function(){$('.floatingImg').remove()});				
                  
				  /*使用 setTimeout 函式來延遲執行一段程式碼，在50毫秒後，淡出聊天視窗 #chatview，同時淡入朋友列表 #friendslist。*/
                  setTimeout(function(){
                      $('#chatview').fadeOut();
                      $('#friendslist').fadeIn();				
                  }, 50);
              });
              
          });
      });


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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
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