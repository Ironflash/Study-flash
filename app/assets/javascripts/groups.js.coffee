# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$("#startTimer").click ->
		window.alertInterval = setInterval ->
												num_cards = gon.reg_cards.length if gon
												rand_num = Math.floor(Math.random() * num_cards)
												alert (gon.reg_cards[rand_num].question) if gon
												alert (gon.reg_cards[rand_num].answer) if gon
												false
											, $("#interval").val()*1000
	
	$("#stopTimer").click ->
		clearInterval(window.alertInterval)
		false