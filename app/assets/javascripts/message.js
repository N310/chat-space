$(function () {
  function buildHTML(message) {
    var messageImage = "";
    if (message.image_url) {
      messageImage = `<img src="${message.image_url}">`;
    }
    var html = `<div class="message" data-message-id="${message.id}">
                  <p class="message__head">
                    <span class="message__head_name">${message.user_name}</span>
                    <span class="message__head_date">${message.created_at }</span>
                  </p>
                  <p class="message__body">
                    ${message.body}
                    ${messageImage}
                  </p>
                </div>`
    return html;
  }

  $("#new_message").on('submit',function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var messagesArea = $('.messages');
      var html = buildHTML(data);
      messagesArea.append(html);
      $('.sendBox__input').val('');
      $(".sendBox__btn").prop("disabled", false);
      messagesArea.animate({scrollTop: messagesArea[0].scrollHeight}, 500, 'swing');
    })
    .fail(function(){
      alert('error');
    })
  })

  if ($('.messages').length) {
    setInterval(function(){
      var url = location.href;
      var lastMessageId = $(".message:last").data("message-id");
      $.ajax({
        url: url,
        type: 'GET',
        data: {lastMessageId : lastMessageId},
        dataType: 'json'
      })
      .done(function(data){
        var messagesArea = $('.messages');
        data.forEach(function(message){
          var html = buildHTML(message);
          messagesArea.append(html);
        });
        messagesArea.animate({scrollTop: messagesArea[0].scrollHeight}, 500, 'swing');
      })
      .fail(function(){
        alert('メッセージが取得できません。');
      }) 
    },5000);
  }
})
