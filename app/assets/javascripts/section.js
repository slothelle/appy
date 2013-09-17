$(document).ready(function() {
  $("a.fancy-form").on('click', function(event) {
    event.preventDefault();
    var url = $(this).attr('href');
    $(this).remove();
    $.get(url, function(response) {
      $('div.new-comment').append(response);
    });
  });
});