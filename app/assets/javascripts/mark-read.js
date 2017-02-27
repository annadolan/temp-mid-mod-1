var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    });

    $this.text("Mark as Unread")
    $this.toggleClass('mark-read mark-unread')
    $this.parent().siblings('.link_read').text("Read: true")
    $this.parent().siblings('.link-title').addClass('read')
    $this.parent().siblings('.link-url').addClass('read')
  })

  $('#links-list').on('click', 'button.mark-unread', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: false}
    });

    $this.text("Mark as Read")
    $this.toggleClass('mark-unread mark-read')
    $this.parent().siblings('.link_read').text("Read: false")
    $this.parent().siblings('.link-title').removeClass('read')
    $this.parent().siblings('.link-url').removeClass('read')
  })
})
