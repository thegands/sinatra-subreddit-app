#= require dist/jquery
#= require dist/js/materialize
$(document).ready ->
  $('.button-collapse').sideNav()
  $('ul.tabs').tabs();
  $('.modal-trigger').leanModal()
return
