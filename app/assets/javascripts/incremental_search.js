$(document).on('turbolinks:load', function() {

  $('#inc_search').on('keyup', searchUsers);

  $('.chat-group-form').on('click', '.user-search-add', function(){
    var id = $(this).data('user-id');
    var name = $(this).data('user-name');
    var user = $(this).parent();
    var insertHTML = buildAddUserHTML(id, name);
    $('#chat-group-users').append(insertHTML);
    user.remove();  // 追加ボタンを押した後に、そのユーザーを削除
  });

  $('#chat-group-users').on('click', '.user-search-remove', function(){
    var id = $(this).data('user-id');
    $(`#chat-group-user-${id}`).remove(); // 追加後のuserの削除ボタン
  })

});

function bulidSearchUserHTML(user) {
  var html = `
    <div class = "chat-group-user chat-remove clearfix">
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
  var inputname = $(this).val();
  var preInput = "";
  if(inputname !== preInput){
  $.ajax({
    type: 'GET',
    url: '/users/search',
    data: {
      name: inputname,
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
  preIput = inputname;
  } else {
    $(".chat-remove").remove(); // 検索を終えた後に、ユーザーをそのまま表示にして置かないようにするため
  }
}
