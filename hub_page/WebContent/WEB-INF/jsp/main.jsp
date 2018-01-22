<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-3.2.1.js"></script>
<link href="css/timeline.css" rel="stylesheet" />
<link href="assets/css/mainbar.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
>
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"
></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js">
</script>
<title>main.jsp</title>
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->


<script>
	var parameters = {
		index : 0,
		order : 'hits',
		time : 24,
		siteList : [ 'c1', 'c2', 'c3', 'c4' ],
	}


	function boardView() {
		$.ajax({
			url : 'board.do',
			dataType : 'text',
			data : {
				index : parameters.index,
				order : parameters.order,
				time : parameters.time,
				siteList : parameters.siteList
			},
			success : function(data) {
				if (parameters.index == 0)
					$('#board').html(data)
				else
					$('#board').append(data)
			}
		})
	}

	function selectSite() {
		var check = false
		parameters.siteList = []
		$(".site:checked").each(function() {
			parameters.siteList.push($(this).val())
			check = true
		})
		
		if(!check){
			parameters.siteList=['null']
		}
		
		boardView()
	}

	$(function() {
		boardView()

 		$(window).scroll(function() {
			var sh = $(window).scrollTop() + $(window).height();
			var dh = $(document).height();
			if (sh == dh) {
				parameters.index += 10;
				boardView()
			}
		}) 

		$('.order').click(function() {
			parameters.index = 0
			parameters.order = $(this).val()
			boardView()
		})

		$('.time').click(function() {
			parameters.index = 0
			parameters.time = $(this).val()
			boardView()
		})

		$('.site').click(function() {
			parameters.index = 0
			selectSite()
		})

		$('#total').click(function() {
			parameters.index = 0
			$('.site').prop('checked', true)
			selectSite()
		})
		
		$(document).on('click', '.scrap', function() {
			$.ajax({
				url : 'scrap.do',
				data : {
					bid : $(this).val()
				},
				success : function(data) {
					if (data != -1)
						alert(data + '번 게시물 스크랩하였습니다')
					else
						alert('이미 추가하였습니다')
				}
			})
		})
		
		$('#scrapBoard').click(function(){
			parameters.index=0
		})
		
 		$("#nav-icon1").click(function(){
 				$(this).toggleClass('open');
		        $("#panel").slideToggle("slow");
		        
		        
		        $("#panelone").slideToggle("slow");
		        
		        $("#paneltwo").slideToggle("slow");
		        $("#panelthree").slideToggle("slow");
		    });


		    


	})
	

</script>

</head>
<body>
			<jsp:include page="/WEB-INF/jsp/header.jsp" flush="false"/>
			
				
				
					
				<div id="nav-icon1" style="float:left;">
	
  			<span></span>
  			<span></span>
 			 <span></span>

				
				</div>
		
		<br/>
		<br/>
		<br/>

		<div class="mainbar"style="float:left; width:25%;">	
			
					<div id="panel">
					<div id="nav-text1">커뮤니티별 보기</div>
										<br/>
										<button id="total">전체</button>
										<br/>
											<input type="checkbox" id="fm" 
											class="site" value="c1" checked="checked"><label for="fm">에펨코리아</label>
											
										<br/>	
											 <input type="checkbox" id="ppom"
												class="site" value="c2" checked="checked"><label for="ppom">뽐뿌</label> 
										<br/>	
									<input type="checkbox" id="univ"
												class="site" value="c3" checked="checked"
											> <label for="univ">웃대</label> 
										<br/>	
											<input type="checkbox" id="ruliweb"
												class="site" value="c4" checked="checked"
											> <label for="ruliweb">루리웹</label><br />
										<br/>	
											
					</div>
			
			</div>
						
					
		<div class="mainbar"style="float:left; width:25%;">	

			<div id="panelone">
				<div id="nav-text1">카테고리별 보기</div>
				<button class="button order" value="hits">조회수</button><br/>
				<button class="button order" value="commentCnt">댓글수</button><br/>
				<button class="button order" value="date">최신</button>
			</div>
		</div>
		<div class="mainbar"style="float:left; width:25%; ">	
	
			<div id="paneltwo">
	
			<div id="nav-text1">시간순 보기</div>
				<button class="button time" value="3">3시간전</button><br/>
				<button class="button time" value="6">6시간전</button><br/>
				<button class="button time" value="12">12시간전</button><br/>
				<button class="button time" value="24">24시간전</button>
				<br />
			</div>	
			</div>
					
		<div class="mainbar"style="float:left; width:25%;">	

			<div id="panelthree">
			<div id="nav-text1">검색 보기</div>
				<form action="boardSearch.do" method="post" name="searchForm">
					<select name="searchOption">
						<option value="titleSearch">검색 방법 선택</option>
						<option value="titleSearch">제목</option>
						<option value="contentSearch">내용</option>
						<option value="titleContentSearch">제목+내용</option>
					</select>
					<input type="text" size="40" name="searchKeyword"
						id="searchKeyword" minlength="2" maxlength="10"
						required="required"
					/> <input type="hidden" value=0 name="index"> <input
						type="hidden" value="" name="order"
					> <input type="hidden" value=24 name="time"> <input
						type="submit" value="글검색" id="search"
					>
				</form>
				</div>
				</div>
				
			

			<div id="board"></div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/skel-viewport.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
</body>
