# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$('#category-bar').scrollToFixed();
	createStoryJS({
		type:		'timeline',
		width:		'800',
		height:		'600',
		source:		'/videos/timeline.json',
		embed_id:	'timeline',
		debug:		true
	});