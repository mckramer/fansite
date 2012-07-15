//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(function () {
  $("a[rel*=popover]").popover({
    offset: 10,
    delayIn: 50,
    placement: 'bottom'
  });
  $(document).tooltip({
    placement: 'right',
    selector: "[rel*=tooltip], [data-toggle=tooltip]"
  });
});