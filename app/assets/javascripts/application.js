// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

// FOUNDATION
//= require foundation/foundation
//= require foundation/foundation.reveal
//= require foundation/foundation.alert
//= require foundation/foundation.tab
//= require foundation/foundation.tooltip
// Needed to make edits to foundation js -- 
// these are in the custom file magellanedit.js in vendor/scripts
//= require magellanedit

// EXTRA 3rd PARTY JS
//= require jquery.backstretch
//= require waypoints.min
//= require jquery.photoset-grid
// = require jquery.colorbox
//= require ckeditor/init

// LACO CUSTOM JS
//= require lacoaudits
//= require_tree .


$(function(){ $(document).foundation(); });



