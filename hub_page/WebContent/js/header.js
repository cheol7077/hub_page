$(function() {
	var IMPOSSIBLE = '<span class="glyphicon glyphicon-remove" style="color:#FF0000;">사용불가</span>'
	var POSSIBLE = '<span class="glyphicon glyphicon-ok" style="color:#0404B4;">사용가능</span>'
	var check_flag = 0
	
	$('#submit').click(function(){
		var userID = $('#userID').val();
		var password = $('#password').val()
		
		if(check_flag == 0) {
			alert('중복체크하세요!')
			return
		}
		
		if(password == "") {
			alert('비밀번호 입력하세요!')
			return
		}
		
		if(password != $('#passwordCheck').val()) {
			alert("비밀번호가 일치하지않습니다!")
			return
		}
			
		location = 'signup.do?userID=' + userID + '&password=' + password;
	})
	
	$('#check').click(function(){
		$.ajax({
			url : 'memberCheck.do',
			data : {
				userID : document.getElementById('userID').value
			},
			success : function(data) {
				if(data == 'FAIL') {
					check_flag = 1
					$('#checkmeg').html(IMPOSSIBLE)
				}
				else {
					check_flag = 0
					$('#checkmeg').html(POSSIBLE)
				}
			}
		})
	})
	
	$('#login').click(function(){
		location.href = "login.do?userID=" + $('#loginId').val() + "&password=" + $('#loginPw').val()
	})
})