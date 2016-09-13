// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require react
//= require react_ujs
//= require components
//= require tether.min.js
//= require moment.min.js
//= require jquery-2.2.3.min.js
//= require materialize.min.js
//= require underscore.string.js
//= require bootstrap-datepicker.js
//= require bootstrap-datepicker.ja.min.js
//= require_tree ./components
$(document).ready(function() {
  $('.carousel').carousel();
});
