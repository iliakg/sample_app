$(document).ready(function() {
  $('#close_popup').click(function() {
    close_popup();
  });

  $('#fog_popup').click(function(e) {
    if (e.target.id === 'fog_popup') {
      close_popup();
    }
  });
});

function close_popup() {
  $("#fog_popup").hide();
  $("body").css("overflow", "visible");
};

function open_popup(content) {
  $("#fog_popup").show();
  $("body").css("overflow","hidden");
  $('#content_popup').html(content);
};
