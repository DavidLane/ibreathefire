$(document).ready(function() {
	$("#login-link a").click(function(event) {
		event.preventDefault();
		$("#login").toggle();
	});
});