#= require jquery
#= require jquery_ujs
#= require bootstrap-datepicker/core
#= require bootstrap-datepicker/locales/bootstrap-datepicker.ja.js
#= require jquery.confirmLeaving
#= require_tree .

jQuery ($) ->
  $('body').on('ajax:success', '.new_comment', (e, data, status, xhr) ->
    form = $(this)
    form.parent().find('.comments').append(xhr.responseText)
    form.find('textarea').val('')
  )

  $('[data-behaviour~=datepicker]').datepicker({
    language: 'ja',
    format: "yyyy-mm-dd",
    weekStart: 1,
    keyboardNavigation: false,
    autoclose: true,
    todayHighlight: true
  });

  $('.input-entry-body').confirmLeaving()
