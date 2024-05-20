<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.match.bean.MatchBean"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css

*{
  box-sizing:border-box;
 /* outline:1px solid ;*/
}
body{
background: #ffffff;
background: linear-gradient(to bottom, #ffffff 0%,#e1e8ed 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='pruple',GradientType=0 );
    height: 100%;
        margin: 0;
        background-repeat: no-repeat;
        background-attachment: fixed;

}
.image {
  height: 100px;
  width: auto;
}
.main-content__checkmark {
  font-size:4.0625rem !important;
  line-height:1 !important;
  color:#24b663;
}
.wrapper-1{
  width:100%;
  height:100vh;
  display: flex;
flex-direction: column;
}
.wrapper-2{
  padding :30px;
  text-align:center;
}
.wrapper-4{
  padding :30px;
  text-align:center;
}
h1{
  font-family: 'Kaushan Script', cursive;
  font-size:4em;
  letter-spacing:3px;
  color: #a976b2 ;
  margin:0;
  margin-bottom:20px;
}
.wrapper-4 p{
  margin:0;
  font-size:1.3em;
  color:#000;
  font-family: 'Source Sans Pro', sans-serif;
  letter-spacing:1px;
}
.wrapper-2 p{
  margin:0;
  font-size:1.3em;
  color:#aaa;
  font-family: 'Source Sans Pro', sans-serif;
  letter-spacing:1px;
}
.go-home{
  text-align: center;
  color:#fff;
  background:#a976b2;
  border:none;
  padding:10px 50px;
  margin:30px 0;
  border-radius:30px;
  text-transform:capitalize;
  box-shadow: 4px 8px 40px 8px #a976b275;
  margin-top: 280px;
  cursor: pointer;
}
.footer-like{
  margin-top: auto;
  background:#a976b233;
  padding:6px;
  text-align:center;
}
.footer-like p{
  margin:0;
  padding:4px;
  color:#000;
  font-family: 'Source Sans Pro', sans-serif;
  letter-spacing:1px;
}
.footer-like p a{
  text-decoration:none;
  color:#a976b2;
  font-weight:600;
}
iframe {
  margin-top:  20px;
  border: none;
  margin-bottom: 10px;
}

@media (min-width:360px){
  h1{
    font-size:4.5em;
  }
  .go-home{
    margin-bottom:20px;
  }
}

.fa-face-kiss-wink-heart {
  font-size: 10em; /* 調整元素大小 */
  position: relative;
  top: 140px;
  margin-left: -20px;/
}

h2, p {
  text-align: center; /* 文本水平置中 */
  position: relative;
  top: 220px;
}


@media (min-width:600px){
  .content{
  max-width:1000px;
  margin:0 auto;
}
  .wrapper-1{
  height: 750px;
  max-width:750px;                        /*調框的大小*/
  margin:0 auto;
  margin-top:50px;
  box-shadow: 4px 8px 40px 8px #a976b275;
}

}


</style>


</head>
<body>

 <div class=content>
  <div class="wrapper-1">
    <div class="wrapper-2">
      <img src="https://tulipex.com/wp-content/uploads/2019/06/Tulipex-Logo-Op.png" alt="" class="image">
      <h1>配對成功!</h1>
      <i class="fa-regular fa-face-kiss-wink-heart fa-2xl" style="color: #e4aac6 ;"></i>
            
      <h2>Deposit on it's way</h2>
      <p>Please be patient as it goes through blockchain confirmation</p>
	  <button class="go-home" onclick="window.location.href='/newMatchPage'">
      回去配對頁面
      </button>
      </div>

      <div class="footer-like">
      <p>Email not received?
<!--        <a href="#">Click here to send again</a> -->
      </p>
    </div>
</div>
</div>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Source+Sans+Pro" rel="stylesheet">	


<script>

$( document ).ready(function() {
	  // perform some jQuery when page is loaded
	  
	$("h1").hover(function() { 
	  // when user is hovering the h1
	  $( this ).addClass("animated infinite pulse"); 
	  // we add pulse animation and to infinite
	}, function() {
	  // when user no longer hover on the h1
	  $( this ).removeClass("animated infinite pulse");
	  // we remove the pulse
	});
	});

</script>




</body>
</html>