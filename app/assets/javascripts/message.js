$(document).on('turbolinks:load', function() {
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

  function scrollBottom(){
    $('.chat-body').animate({
      scrollTop: $('.chat-messages').height()
    });
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('#message_body');
    var message = textField.val();
    var formData = new FormData($(this).get(0));
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
      textField.val('');

      scrollBottom();
    })
    .fail(function() {
      alert('error');
    });
    return false;
  });

  var autoReload = setInterval(function() {
    if (window.location.href.match(/\/groups\/\d+\/messages\/new/)){
      $.ajax({
        type: 'GET',
        url: '',
        dataType: 'json'
      })
      .done(function(message) {
        var last_message_id = message.id;

        var message_count = $('.chat-message').length;
        add_message = $('.chat-message');
        add_message_id = $(add_message[message_count-1]).data('message-id');

        var insertHTML = '';
        if(last_message_id != add_message_id){
          insertHTML = buildHTML(message);
          $('.chat-messages').append(insertHTML);
        }
      })
      .fail(function(){
        alert('error');
      });
    } else {
      clearInterval(autoReload);
    }}, 3000);
});
