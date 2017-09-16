$(function(){
  function appendHTML(user) {
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user.name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
                </div>`
    $("#user-search-result").append(html);
  }

  function appendHTMLmember(user) {
    var user_id = $(user).data("user-id");
    var user_name = $(user).data("user-name");
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-${user_id}'>
                  <input name='group[user_ids][]' type='hidden' value='${user_id}'>
                  <p class='chat-group-user__name'>${user_name}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
    $("#chat-group-users").append(html);
  }

  $(".chat-group-form__input").on("keyup", function() {
    var input = $(this).val();

    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(users) {
      $("#user-search-result").empty();
      users.forEach(function(user){
        appendHTML(user);
      });
    })
    .fail(function(){
      alert('ユーザー検索に失敗しました');
    });
  });

  $(document).on("click", ".user-search-add", function() {
    $(this).parent(".chat-group-user").remove();
    appendHTMLmember(this);
  });
});
