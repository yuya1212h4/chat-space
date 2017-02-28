$(document).on('turbolinks:load', function() {
  function buildHTML(message) {
    var image = (message.image) ? `<img src = ${message.image}>` : "";

    var html = `
      <li class = "chat-message" id="${message.id}">
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
        var insertHTML = '';
        add_message = $('.chat-message');
        for(var i=0, l=add_message.length; i<l; i++){
          message_id = add_message[i].getAttribute("id");
          if(message_id != message[i].id){
            insertHTML = buildHTML(message);
            $('.chat-messages').append(insertHTML);
          }
        }
      })
      .fail(function(){
        alert('error');
      });
    } else {
      clearInterval(autoReload);
    }}, 3000);
});
