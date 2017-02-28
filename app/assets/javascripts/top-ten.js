$(document).ready(function(){
  $.ajax({
    url: "https://dry-stream-75456.herokuapp.com/api/v1/links",
    method: 'GET',
    contentType: "application/json",
    dataType: "json"
  }).success(function(data){
    $.ajax({
      url: "/api/v1/read_links",
      method: 'POST',
      contentType: "application/json",
      dataType: "json",
      data: JSON.stringify(data)
    })
  })
})
