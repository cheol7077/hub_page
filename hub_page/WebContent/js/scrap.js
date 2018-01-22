$(function() {
	$(document).on('click', '.boardurl', function() {
		var url = $(this).attr('href')
		$('#scrapContent').attr('src', url)

		return false
	})
	
	$('.delete').click(function(){
		location.href = "scrapDelete.do?bid="+$(this).val()
	})
});