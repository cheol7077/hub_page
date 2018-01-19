var INIT = 0
var ADD_INDEX = 10
var parameters = {
	index : 0,
	order : 'hits',
	time : 24,
	siteList : [ 'c1', 'c2', 'c3', 'c4' ],
	searchKeyword : "",
	searchOption : "titleContentSearch"
}

function boardView() {
	$.ajax({
		url : 'board.do',
		dataType : 'text',
		data : {
			index : parameters.index,
			order : parameters.order,
			time : parameters.time,
			siteList : parameters.siteList,
			searchKeyword : parameters.searchKeyword,
			searchOption : parameters.searchOption
		},
		success : function(data) {
			if (parameters.index == INIT)
				$('#board').html(data)
			else
				$('#board').append(data)

			if (parameters.searchKeyword != "")
				$('#searchResult').html(parameters.searchKeyword + " 검색 결과")
			else
				$('#searchResult').html("")

		}
	})
}

function search() {
	var formData = new FormData(document.getElementById('searchForm'));
	parameters.searchKeyword = formData.get("searchKeyword")
	parameters.searchOption = formData.get("searchOption")
	if (parameters.searchKeyword.length < 2) {
		alert("검색어는 2자 이상 입력해 주세요")
		return false
	}
	boardView()
	document.getElementById("searchKeyword").value = "";
}

function enterkey() {
	if (window.event.keyCode == 13) {
		search();
	}
}

function selectSite() {
	var check = false
	parameters.siteList = []
	$(".site:checked").each(function() {
		parameters.siteList.push($(this).val())
		check = true
	})

	if (!check) {
		parameters.siteList = [ 'null' ]
	}

	boardView()
}

$(function() {
	boardView()

	$('#board').scroll(function() {
		var sl = $('#board').scrollTop() + $('#board').height();
		var sh = $('#board').prop('scrollHeight')
		if (sl == sh) {
			parameters.index += ADD_INDEX;
			boardView()
		}
	})

	$('.init').click(function() {
		parameters.index = 0
		parameters.order = 'hits'
		parameters.siteList = [ 'c1', 'c2', 'c3', 'c4' ]
		parameters.searchKeyword = ""
		parameters.searchOption = "titleContentSearch"
		boardView()
	})

	$('.order').click(function() {
		parameters.index = INIT
		parameters.order = $(this).val()
		boardView()
	})

	$('.time').click(function() {
		parameters.index = INIT
		parameters.time = $(this).val()
		boardView()
	})

	$('.site').click(function() {
		parameters.index = INIT
		selectSite()
	})

	$('#total').click(function() {
		parameters.index = INIT
		$('.site').prop('checked', true)
		selectSite()
	})

	$('#search').click(function() {
		search();
	})

	$(document).on('click', '.scrap', function() {
		$.ajax({
			url : 'scrap.do',
			data : {
				bid : $(this).val()
			},
			success : function(data) {
				console.log("data: "+data)
				console.log("dataType: "+typeof(data))
				if (data != -1)
					alert(data + '번 게시물 스크랩하였습니다')
				else
					alert('이미 추가하였습니다')
			}
		})
	})

	$(document).on('click', '.boardurl', function() {
		var url = $(this).attr('href')
		$('#content').attr('src', url)

		return false
	})
})