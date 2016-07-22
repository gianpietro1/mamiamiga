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
//= require moment
//= require bootstrap-datetimepicker
//= require moment/es
//= require froala_editor.min.js
//= require plugins/image.min.js
//= require plugins/image_manager.min.js
//= require_tree .
//= require bootsy

$(document).ready(function(){

	$("#instagram").jqinstapics({
	"user_id": "245688425",
	"access_token": "245688425.1677ed0.112b1143ed9b474bbe1ca7a15f9ec2de",
	"count": 6
	});

	$('li.parent_menu').hover(function() {
		$('.child_menu').toggle();
	});

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.6&appId=241073229593702";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
}
);

