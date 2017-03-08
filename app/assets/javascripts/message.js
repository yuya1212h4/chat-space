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
    } else {
      clearInterval(autoReload);
    }}, 10000);
});
