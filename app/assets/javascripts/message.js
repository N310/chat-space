$(function () {
  function buildHTML(message) {
    messageImage = "";
    if (message.image_url) {
      messageImage = `<img src="${message.image_url}">`;
    }
    var html = `<div class="message">
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
    var type = $(this).attr('method');
    $.ajax({
      url: url,
      type: type,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html)
      $('.sendBox__input').val('');
    })
  })
})
