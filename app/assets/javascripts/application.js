// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require social-share-button
//= require_tree .
//= require bootsy

$(document).ready(function(){

	$("#instagram").jqinstapics({
	"user_id": "245688425",
	"access_token": "245688425.1677ed0.870eb1e9b3c74f62b23a2960a3e2f072",
	"count": 6
	});

	$('li.parent_menu').hover(function() {
		$('.child_menu').toggle();
	});

}
);

