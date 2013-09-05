// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
		
		if ($("#user_role").val() == "staff") {
				$(".user_register_number").fadeOut();
		}
		else if ($("#user_role").val() == "student") {
				$(".user_register_number").fadeIn();
		}
		
		// Adding onchange events to role dropdown
		$("#user_role").change(function() {
				if ($(this).val() == "staff") {
						$(".user_register_number").fadeOut();
				}
				else if ($(this).val() == "student") {
						$(".user_register_number").fadeIn();
				}
		});
});
