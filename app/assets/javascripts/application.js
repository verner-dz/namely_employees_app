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
//= require jquery
//= require jquery_ujs


function ready(){

  $('button').click(function(){
    // get value from input field
    var inputText = $('#note-tagger').val();
    var _noteCreationEpoch = new Date().getTime();
    var _newNote = $('<a />', {
        text: inputText,
        href: _noteCreationEpoch,
        id: 'e'+_noteCreationEpoch,
        addClass: 'note'
      });
    var noteTagObject = {content: inputText, created_epoch: _noteCreationEpoch};
    submitTagArray.push(noteTagObject);


    var appendtoContainer = _newNote.appendTo($('.container'));

    // submit ajax request to appropriate controller, with appropriate data passed (tags create route)
    // $.ajax({
    //   url: '/users/'+ window.location.pathname.match(/\/\d+$/)[0].replace("/","")+'/sounds/new',
    //   method: 'post',
    //   data: {
    //     content: inputText,
    //     created_epoch: _noteCreationEpoch
    //     },
    //     dataType: 'json'
    // }).error(function(data) {

    // });
    //   respond with json of the new note
    //   when ajax is done
    // get text from the json that was returned, along with created_at time
    // append that text as a paragraph tag (??) to the container div
  });
}

$(document).ready(ready);
$(document).on('page:load', ready);
var submitTagArray = [];
