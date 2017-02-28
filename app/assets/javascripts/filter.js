$(document).ready(function(){
  $('#filterInput').on('keyup', function(){
    filterLinks($(this));
  })

  $('#filter-by-read').on('click', function(){
    filterByRead();
  })

  $('#filter-by-unread').on('click', function(){
    filterByUnread();
  })
})

function filterByRead() {
  $('.unread-link').hide();
  $('.read-link').show();
}

function filterByUnread() {
  $('.read-link').hide();
  $('.unread-link').show();
}


function filterLinks() {
  var input, filter, div, item, linkFilter, linkFilter2, i;
  input = document.getElementById("filterInput");
  filter = input.value.toUpperCase();
  div = document.getElementById("links-list");
  items = document.getElementsByClassName("link");

  for (i = 0; i < items.length; i++) {
    linkFilter = items[i].children[2];
    linkFilter2 = items[i].children[3];
      if ((linkFilter.innerHTML.toUpperCase().indexOf(filter) > -1) || (linkFilter2.innerHTML.toUpperCase().indexOf(filter) > -1)) {
        items[i].style.display = "";
      } else {
        items[i].style.display = "none";
      }
    }
  }
