$(document).ready(function(){

$('#slide').slideme({
	arrows: true,
	labels : {
		next: '',
		prev: ''
	},
	resizable: {
	width: 810,
	height: 402,
	},
	autoslide : true,
	autoslideHoverStop : true,
	interval : 4000,
	transition : 'fade',
	loop : true,
});

}
);

