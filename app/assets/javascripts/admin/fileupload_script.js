$(function () {
  $('#new_file_item').fileupload({
    dropZone: $("#new_files_dropzone"),
    add: function (e, data) {
      $('#progress_bar').css({'width': 0, 'display': 'block'});
      data.submit();
    },
    done: function (e, data) {
      $('#progress_bar').css({'display': 'none'});
    },

    progressall: function (e, data) {
      var progress = parseInt(data.loaded / data.total * 100, 10);
      $('#progress_bar').css('width', progress + '%');
    }
  });

  $(document).bind('dragover', function (e) {
    var dropZones = $("#new_files_dropzone"),
    timeout = window.dropZoneTimeout;

    if (timeout) {
      clearTimeout(timeout);
    } else {
      dropZones.addClass('in');
    }
    var hoveredDropZone = $(e.target).closest(dropZones);
    dropZones.not(hoveredDropZone).removeClass('hover');
    hoveredDropZone.addClass('hover');
    window.dropZoneTimeout = setTimeout(function () {
        window.dropZoneTimeout = null;
        dropZones.removeClass('in hover');
    }, 100);
  });
});

