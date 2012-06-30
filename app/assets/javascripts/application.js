//= require jquery
//= require jquery_ujs
//= require_tree .

$(function () {
  $("a[rel*=popover]").popover({
    offset: 10,
    delayIn: 50,
    placement: 'below'
  });
  $("[rel*=twipsy]").twipsy({
    placement: 'below'
  });
});