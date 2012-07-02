//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap

$(function () {
  $("a[rel*=popover]").popover({
    offset: 10,
    delayIn: 50,
    placement: 'bottom'
  });
  $("[rel*=tooltip]").tooltip({
    placement: 'bottom'
  });  
});