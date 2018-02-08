$('#calendar').datepicker({
	dateFormat: "yy-mm-dd",
	onSelect: function(date) {
		alert(date)
	}
});