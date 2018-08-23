<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- 기능추가 -->
<script>

$(function(){
	printUserName = function(user){
		$("input[name='userName']").val($(user).parent().next().text());	
	}
});





// $(function() {
// 	var $button = $("button");
// 	var $inputText = $("input[type='text']");
// 	var $userList = $("")
// 	var userNum = 1;
	
// 	//auto trigger when enter keypress
// 	$inputText.bind("keydown", function(event) {
// 		if(event.which == 13 && $(this).val() != "") {// enter key code
// 			if($("input[type='radio']:checked").length == 1) {
// 				$button.eq(2).click();
// 			} else {
// 				$button.eq(1).click();
// 			}
// 		}
// 	});
	
// 	//List
// 	$button.eq(0).bind("click", function() {
// 		if($("tbody").children("tr").length !== 0) {
// 			$("tbody").children("tr").remove();
// 			userNum = 1;
// 		} else {
// 			dialogActive("Message", "There are no added person.");
// 		}
// 	});
	
// 	//Add
// 	$button.eq(1).bind("click", function() {
// 		if(!$inputText.val() == "") {
// 			var today = new Date();
// 			var dd = today.getDate();
// 			var mm = today.getMonth()+1;
// 			var yyyy = today.getFullYear();
			
// 			var $newRow = $("<tr><td><label><input type='radio' name='num'/><span></span> "+ userNum++ +"</label></td><td>"+ $inputText.val() +"</td><td>"+ yyyy+"-"+mm+"-"+dd +"</td></tr>");
// 			$("tbody").append($newRow);
// 		} else {
// 			dialogActive("Message", "Input name, please.");
// 		}
// 	});
	
// 	//Update
// 	$button.eq(2).bind("click", function() {
// 		if($("input[type='radio']:checked").length == 1 && !$inputText.val() == "") {
// 			var today = new Date();
// 			var dd = today.getDate();
// 			var mm = today.getMonth()+1;
// 			var yyyy = today.getFullYear();

// 			$("input[type='radio']:checked").parents("td").next().text($inputText.val());
// 			$("input[type='radio']:checked").parents("td").next().next().text(yyyy+"-"+mm+"-"+dd);
// 		} else {
// 			if($inputText.val() == "")
// 				dialogActive("Message", "Input name, please.");
// 			else
// 				dialogActive("Message", "Please select the person you want to update.");
// 		}
// 	});
	
// 	//Delete
// 	$button.eq(3).bind("click", function() {
// 		if($("input[type='radio']:checked").length == 1) {
// 			$("input[type='radio']:checked").parents("tr").remove();
// 			$("input[type='text']").val("");
// 		} else {
// 			dialogActive("Message", "Please select the person you want to delete.");
// 		}
// 	});
	
	//show modal
	var dialogActive = function(hMsg, bMsg) {
		var $body = $(".dialog-body");
		var $header = $(".dialog-header");
		var $dialog = $(".dialog");
		
		var zoom = (window.outerWidth - (window.outerWidth*0.1)) / window.innerWidth;
		
		$header.css({
			fontSize:(16 / zoom) + "px",
			display:"run-in",
			color:"#6E6E6E"
		});
		$body.css({
			fontSize: (24 / zoom) + "px",
			display:"run-in"
		});
		
		$header.html(hMsg);
		$body.html(bMsg);
		
		var height = $body.innerHeight + $header.innerHeight;
		var width = window.innerWidth / 5 * 2;
		
		$dialog.css({
	    	left: "calc( 50% - "+width/2+"px )",
		    top: -height+"px",
		    width:width+"px",
		    height: height+"px",
		    maxHeight:window.innerHeight / 5 * 2+"px"
	    });

		$(".dialog-bg").fadeTo(100, 1);
		$(".dialog-bg").css("display", "block");
		$dialog.css("display", "block");
		
		$dialog.animate({
			top:10
		}, {
			duration:250,
			
			//Element가 움직일 때, 움직이는 방식을 정한다.
			//예를 들면, 부드럽게 시작해서 부드럽게 끝나기가 있다.
			easing:"swing",
			
			//animation이 완료되었을때 실행할 함수이다.
			complete:function() {
			}
		});
	}
	
	//hide modal
	$(".dialog-bg").bind("click", function() {
		
		$(".dialog").animate({
			top:-150
		}, {
			duration:250,
			
			//Element가 움직일 때, 움직이는 방식을 정한다.
			//예를 들면, 부드럽게 시작해서 부드럽게 끝나기가 있다.
			easing:"swing",
			
			//animation이 완료되었을때 실행할 함수이다.
			complete:function() {
				$(".dialog-bg").fadeTo(100, 0);
				$(".dialog-bg").css("display", "none");
			}
		});
	});
	
	//text입력 창에 선택한 row의 사용자 이름을 입력
	$("tbody").on("click", function() {
		var text = $("input[type='radio']:checked").parents("td").next().text();
		$inputText.val(text);
	});
	
/* 	//footnote를 생성하길 희망하는 개체에 마우스가 hover됐을때,
	//이 함수를 호출하면, 마우스의 좌표에 footnote를 띄운다.
	var ShowFn = function(obj, msg) {
		var cx = obj.offset().left;
		var cy = obj.offset().top;
		var cwidth = obj.width();
		var cheight = obj.height();
		
		var ox = cx + cwidth / 2;
		var oy = cy + cheight;
		
		var x = ox - $(".footnote").width() / 2 - 10;
		var y = oy + 10;
		
		$(".footnote").css({
			left:x+"px",
			top:y+"px",
			visibility:"visible"
		});

		$(".fn-text").html("<h4>"+msg+"</h4>");
	}
	
	var HideFn = function() {
		$(".footnote").css({
			visibility:"hidden"
		});
	} */
});

</script>

<!-- css -->
<style>
	@CHARSET "UTF-8";

	.container{
		width: 800px;
		background-color: #fff;
		border: 1px solid #E7E7E7
		text-align: center;
	}
	
	#title{
		text-align: center;
	}
	
	.dialog-bg {
		display: none;
	    position: fixed;
	    top: 0; 
	    left: 0;
	    width: 100%; 
	    height: 100%;
	    z-index: 10;
	}
	
	.dialog {
		display: none;
	    position: fixed;
	    background: #FFFFFF;
	    border:1px solid #CACAC9;
	    border-radius:10px;
	    z-index: 11;
	    top:-500px;
	    padding: 10px;
	    box-shadow:0px 0px 15px #CACAC9;
	}
	
	.footnote {
		display:table;
		visibility:hidden;
		position:fixed;
		width:75px;
		height:25px;
		border-radius:5px;
		color:#000000;
		background-color: #D8D8D8;
		z-index:1;
	}
	
	.fn-text {
		display:table-cell
		text-align:center;
		vertical-align:middle;
	}
	
	.fn-text::after {
		content:"";
		width:10px;
		height:10px;
		position:absolute;
		margin-left:-5px;
		border:solid 5px;
		top:-10px;
		left:50%;
		border-color:transparent transparent #D8D8D8 transparent ;
		z-index:1;
	}
</style>
</head>

<body>
<!-- bootstrap -->

<div class="container">
<!-- title -->

<h2 id="title">UMS</h2>
<!-- 입력창 -->

<form>
<div class="form-group">
	<%@ include file="user/msg.jsp" %>


<label for="inputdefault">NAME</label>
<input class="form-control" id="inputdefault" type="text" name="userName">
</div>
<!-- 버튼창 -->

<div class="btn-group btn-group-justified">
    <div class="btn-group">
      <button type="button"  id="button1" formaction="main.jsp" class="btn btn-primary">List</button>
    </div>
    
    <div class="btn-group">
      <button type="button"  id="button2" formaction="user/join.jsp" class="btn btn-primary">add</button>
    </div>

    <div class="btn-group">
      <button type="button"  id="button3" class="btn btn-primary">update</button>
    </div>

    <div class="btn-group">
      <button type="button"  id="button4" class="btn btn-primary">delete</button>
    </div>
  </div>
<!-- table -->
<div>
<table class="table">
<thead>
	<tr>
		<th>번호</th>
        <th>이름</th>
        <th>등록일</th>
	</tr>
		<div class="container">
		<jsp:include page= "user/listUser.jsp" />
		</div>
</thead>
<tbody>
	
</tbody>
</table>	
</div>
</form>

<!-- 모달 -->
<!-- <div class="dialog-bg"> -->
<!-- 	<div class="dialog"> -->
<!-- 		<div class="dialog-header"></div> -->
<!-- 		<div class="dialog-body"></div> -->
<!-- 	</div> -->
<!-- </div> -->

<!-- 풋노트 -->
<!-- <div class="footnote"> -->
<!-- 	<div class="fn-text"></div> -->
<!--  </div> -->
</div>
</body>
</html>