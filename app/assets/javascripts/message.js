$(function() {
  function buildHTML(message) {
    var html =
      '<li class = "chat-message">' +
      '<div class = "chat-message__header clearfix">' +
      '<div class = "chat-message__name">' +
      message.name +
      '</div>' +
      '<div class = "chat-message__time">' +
      message.created_at +
      '</div>' +
      '</div>' +
      '<div class = "chat-message__body">' +
      message.body +
      '</div>' +
      '</li>';
    return html;
  }

  $('.new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.textarea');
    var message = textField.val();
    $.ajax({
      type: 'POST',
      url: '../messages.json',
      data: {
        message: {
          body: textField.val(),
        }
      },
      dataType: 'json'
    })
    .done(function(message) {
      var html = buildHTML(message);
      $('.chat-messages').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
