$(document).ready(function(){

  $(function () {
      $('#datetimepicker1').datetimepicker();
  });

  //$(function() {
  //        $('#edit').froalaEditor()
  //});

  $(function() {
    $('#edit')
      .froalaeditor({
        imageUploadParam: 'image',
        imageUploadURL: 'froala_image_upload',
        imageMaxSize: 5 * 1024 * 1024,
        imageAllowedTypes: ['jpeg', 'jpg', 'png', 'gif']
      })
      .on('froalaEditor.image.error', function (e, editor, error, response) {
         // Response contains the original server response to the request if available.
      });
  });

}
);

