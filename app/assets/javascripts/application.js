//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require best_in_place
//= require bootstrap
//= require bootstrap/modal
//= require bootstrap-sprockets
//= require cocoon
//= require social-share-button
//= require_tree .

$(document).ready(function() {
  jQuery(".best_in_place").best_in_place();
  setTimeout("$('.alert').fadeOut('slow')", 3000);
});
