// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

var getNewCommentForm = function() {
  return $.ajax({
    url: '/comments/new',
    method: 'get'
  })
}


$(function(){ $(document).foundation(); });

$( document ).ready(function() {
  $('#idea_reply').on('click', function(e) {
    e.preventDefault();
    getNewCommentForm().done(function(response) {
      $('#idea_reply').before(response)
    })
  });

  $('.comment_reply').on('click', function(e) {
    var currentTag = this
    e.preventDefault();
    getNewCommentForm().done(function(response) {
      $(currentTag).after(response)
    })
  });
});
