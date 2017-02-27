var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');
    var linkUrl = $this.parent().siblings('.link-url').text()

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    })
    .then( updateRead($this) )
    .then( sendToHotReads(linkUrl) );
  })

  $('#links-list').on('click', 'button.mark-unread', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: false}
    }).then(updateUnread($this));
  })
})

function updateRead($thing) {
  $thing.text("Mark as Unread")
  $thing.toggleClass('mark-read mark-unread')
  $thing.parent().siblings('.link_read').text("Read: true")
  $thing.parent().siblings('.link-title').addClass('read')
  $thing.parent().siblings('.link-url').addClass('read')
}

function updateUnread($thing) {
  $thing.text("Mark as Read")
  $thing.toggleClass('mark-unread mark-read')
  $thing.parent().siblings('.link_read').text("Read: false")
  $thing.parent().siblings('.link-title').removeClass('read')
  $thing.parent().siblings('.link-url').removeClass('read')
}

function sendToHotReads(url) {
  $.ajax({
    url: "https://dry-stream-75456.herokuapp.com/api/v1/links/",
    method: "POST",
    data: {
          link: { url: url }
        }
})
}
