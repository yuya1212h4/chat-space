$(document).on('turbolinks:load', function() {

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    var flash_status = '';
    $('.flash-messages__notice').remove();
    $('.flash-messages__alert').remove();

    if (formData.get('message[body]') != ""){
      $.ajax({
        type: 'POST',
        url: '../messages',
        data: formData,
        processData: false,
        contentType: false,
        dataType: 'json'
      })
      .done(function(message) {
        var html = buildHTML(message);
        $('.chat-messages').append(html);
        $('#message_body').val('');

        scrollBottom();
        flash_status = 'notice';
        var flash = buildflashmessage(flash_status);
        $(".flash-messages").prepend(flash);
      })
      .fail(function() {
        alert('error');
      });
    } else {
      flash_status = 'alert';
      var flash = buildflashmessage(flash_status);
      $('.flash-messages').prepend(flash);
    }
    return false;
  });

  var autoReload = setInterval(function() {
    if (window.location.href.match(/\/groups\/\d+\/messages\/new/)){
      intervalmessage();
    } else {
      clearInterval(autoReload);
    }}, 100000);
});


function buildHTML(message) {
  var image = (message.image) ? `<img src = ${message.image}>` : "";

  var html = `
    <li class = "chat-message" data-message-id="${message.id}">
      <div class = "chat-message__header clearfix">
        <div class = "chat-message__name">
          ${message.name}
        </div>
        <div class = "chat-message__time">
          ${message.created_at}
        </div>
      </div>
      <div class = "chat-message__body">
        ${message.body}
      </div>
        ${image}
    </li>
    `;
  return html;
}

function buildflashmessage(status) {
  (status == 'notice') ? message = "投稿完了" : message = "投稿失敗";

  var flash = `
      <div class = "flash-messages__${status}">
        ${ message }
      </div>
    `;
  return flash;
}

function scrollBottom(){
  $('.chat-body').animate({
    scrollTop: $('.chat-messages').height()
  });
}

function intervalmessage() {
  var last_message_id = $('.chat-message').last().data('message-id') || 0;
  $.ajax({
    type: 'GET',
    url: '',
    data: {
      last_message_id: last_message_id,
    },
    dataType: 'json'
  })
  .done(function(message) {
    insertHTML = '';
    message.forEach(function(message){
      insertHTML = buildHTML(message);
      $('.chat-messages').append(insertHTML);
    })
  })
  .fail(function(){
    alert('error');
  });
}
