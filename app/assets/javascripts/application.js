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
//= require_tree .

var getNewCommentForm = function(current_id) {

  return $.ajax({
    url: '/comments/new',
    method: 'get',
    data: {idea_id: current_id}
  })
}


$(function(){ $(document).foundation(); });

$( document ).ready(function() {

  $('body').on('click', '#idea_reply',function(e) {
    e.preventDefault();
    var self = $(this);
    var current_id = self.data("current-id");
    getNewCommentForm( current_id ).done(function(response) {
      $('#idea_reply').before(response)
    })
  });


  // Dorment for now
  // $('body').on('click', '.comment_reply', function(e) {
  //   var currentTag = this
  //   console.log(this)
  //   e.preventDefault();
  //   getNewCommentForm().done(function(response) {
  //     $(currentTag).after(response)
  //   })
  // });
});
