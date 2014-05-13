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
//= require turbolinks
//= require recorderWorker
//= require recorder.js
//= require_tree .


function ready(){
  $('button').click(function(){
    // get value from input field
    var inputText = $('#note-tagger').val();
    // submit ajax request to appropriate controller, with appropriate data passed (tags create route)
    $.ajax({
      url: '/notes/'+ window.location.pathname.match(/\/\d+$/)[0].replace("/","")+'/note_tags',
      method: 'post',
      data: {
        content: inputText
        },
        dataType: 'json'
    }).done(function(data) {
      //set up the routes so you can console.log(data)
      console.log(data);
    });
      // respond with json of the new note
      // when ajax is done
    // get text from the json that was returned, along with created_at time
    // append that text as a paragraph tag (??) to the container div
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);
