# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

display = ->
		window.rand_num = Math.floor(Math.random() * window.num_cards)
		if window.repeat != 3
			while gon.reg_cards[window.rand_num].displayed
				window.rand_num = Math.floor(Math.random() * window.num_cards)
		$('#question-pop .modal-body').text(gon.reg_cards[window.rand_num].question) if gon
		$('#answer-pop .modal-body').text(gon.reg_cards[window.rand_num].answer) if gon
		$('#question-pop').modal('show')
		false

card_sequence = ->
		window.alertInterval = setInterval ->
												alert ("Question Time!")
												display()
												false
											, $("#interval").val()*60000 if window.intRegex.test($("#interval").val()) && $("#interval").val() > 0

view_cards = ->
		window.alertInterval = setInterval ->
												display()
												false
											, 1000

reset_displayed = ->
		gon.reg_cards[x].displayed = false for x in [0..window.num_cards-1] 
		window.num_displayed = 0
		
cancel_timer = ->
		$("#timerStatus").removeClass('alert-success').addClass('alert-error');
		$("#timerStatus").text("Timer is off")
		clearInterval(window.alertInterval)
		false
$ ->
	$('.nav-tabs').button()

	$('#viewCards').click ->
		window.repeat = 0
		window.count = 0
		window.num_displayed = 0
		reset_displayed()
		window.num_cards = gon.reg_cards.length if gon
		window.times = window.num_cards
		view_cards()

	$("#startTimer").click ->
		window.repeat = 1
		window.count = 0
		window.num_displayed = 0
		reset_displayed()
		$("#timerStatus").removeClass('alert-error').addClass('alert-success');
		$("#timerStatus").text("Timer is on")
		window.intRegex = /^\d+$/
		window.num_cards = gon.reg_cards.length if gon
		if window.intRegex.test($('#times').val()) && $('#times').val() > 0
			window.times = $('#times').val() 
		else
			window.times = 1
		card_sequence()

	$("#stopTimer").click ->
		cancel_timer()

	$('#question-pop').on 'shown', ->
		clearInterval(window.alertInterval)
		window.count += 1
		window.num_displayed += 1
		gon.reg_cards[window.rand_num].displayed = true

	$("#show-answer").click ->
		$('#answer-pop').modal('show')

	$('#answer-pop').on 'hidden', ->
		done = false
		#check if all cards have been shown
		if window.num_displayed == window.num_cards
			if window.repeat == 0
				done = true
				cancel_timer()
			else if window.repeat == 2
				done = true
				reset_displayed()
				clearInterval(window.alertInterval)
				window.count = 0
				card_sequence()
			else
				reset_displayed()
		if !done
			if window.count < window.times 
				display()
			else
				clearInterval(window.alertInterval)
				window.count = 0
				card_sequence()

	#repeat none when = 0
	#       once cards have all been shown when = 1
	#		anytime but per period when = 2
	#		anytime when = 3
	$('#repeat-none').click ->
		window.repeat = 0
	$('#repeat-done').click ->
		window.repeat = 1
	$('#repeat-period').click ->
		window.repeat = 2
	$('#repeat-anytime').click ->
		window.repeat = 3
	