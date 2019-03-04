# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', '.toggle-new-question-form', ->
  $(this).parents('.user-new-question').find('form.new-question-form').show()
  return
$(document).on 'click', '.cancel-new-question', ->
  $('form.new-question-form').hide()
  return
