import 'parsleyjs'

$(document).on('turbolinks:load ready', function() {
  if($('.parsley-form').length > 0) {
    $('.parsley-form').parsley({
      errorClass: 'is-invalid',
      successClass: 'is-valid',
      errorsWrapper: '<div class="invalid-feedback"></div>',
      errorTemplate: '<span></span>',
      errorsContainer: function(field) {
        return field.$element.closest('.form-group');
      },
      trigger: 'change'
    });
  }
});
