$(function(){
  function bulidSearchUserHTML(user) {
    var html = `
      <div class = "chat-group-user clearfix">
        <p class = "chat-group-user__name">
          ${user.name}
        </p>
        <a class ="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}"  data-user-name="${user.name}" >
        追加
        </a>
      </div>
    `;
    return html;
  }

  function buildAddUserHTML(id, name) {
    var html = `
      <div class = "chat-group-user clearfix" id="chat-group-user-${id}">
        <p class = "chat-group-user__name">
          ${name}
        </p>
        <a class="user-search-remove chat-group-user__btn  chat-group-user__btn--remove" data-user-id="${id}">
          削除
        </a>
        <input value="${id}", name='group[user_ids][]' type="hidden" />
      </div>
    `
    return html;
  }

  function searchUsers() {
    var name = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/users/search',
      data: {
        name: name,
      },
      dataType: 'json'
    })
    .done(function(user) {
      var insertHTML = '';

      user.forEach(function(user){
        insertHTML += bulidSearchUserHTML(user);
      });

      $('#user-search-result').html(insertHTML);
    })
    .fail(function(){
      alert('error');
    });
  }

  $('#inc_search').on('keyup', searchUsers);

  $('.chat-group-form').on('click', '.user-search-add', function(){

    var $this = $(this);
    var id = $this.data('user-id');
    var name = $this.data('user-name');
    var user = $(this).parent();
    var insertHTML = buildAddUserHTML(id, name);

    $('#chat-group-users').append(insertHTML);

    user.remove();
  });

  $('#chat-group-users').on('click', '.user-search-remove', function(){
    var $this = $(this);
    var id = $this.data('user-id');

    $(`#chat-group-user-${id}`).remove();
  })
});
