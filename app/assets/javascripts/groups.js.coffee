# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

display = ->
		rand_num = Math.floor(Math.random() * window.num_cards)
		alert ("Question Time!")
		$('#question-pop .modal-body').text(gon.reg_cards[rand_num].question) if gon
		$('#answer-pop .modal-body').text(gon.reg_cards[rand_num].answer) if gon
		# $('.answer-inner').text(gon.reg_cards[rand_num].answer) if gon
		$('#question-pop').modal('show')
		false
		

$ ->
	$(".collapse").collapse()

	$("#startTimer").click ->
		$("#timerStatus").removeClass('alert-error').addClass('alert-success');
		$("#timerStatus").text("Timer is on")
		window.intRegex = /^\d+$/
		window.num_cards = gon.reg_cards.length if gon
		window.alertInterval = setInterval ->
												display()
											, $("#interval").val()*60000 if intRegex.test($("#interval").val()) && $("#interval").val() > 0

	$("#stopTimer").click ->
		$("#timerStatus").removeClass('alert-success').addClass('alert-error');
		$("#timerStatus").text("Timer is off")
		clearInterval(window.alertInterval)
		false

	$('#question-pop').on 'shown', ->
		clearInterval(window.alertInterval)

	$("#show-answer").click ->
		$('#answer-pop').modal('show')

	$('#answer-pop').on 'hidden', ->
		clearInterval(window.alertInterval)
		window.alertInterval = setInterval ->
												display()
											, $("#interval").val()*60000 if intRegex.test($("#interval").val()) && $("#interval").val() > 0
	