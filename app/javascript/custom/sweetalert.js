import Swal from 'sweetalert2'
window.Swal = Swal

$(document).on('turbolinks:load ready', function() {
  $('body').on('click', 'a.swal', function() {
    let element = $(this)

    Swal.fire({
      title: this.dataset['swalTitle'] || '',
      text: this.dataset['swalMsg'] || '',
      icon: this.dataset['swalIcon'] || 'warning',
      showCancelButton: true,
      confirmButtonText: this.dataset['confirmBtnTxt'] || 'Yes, I am sure.',
      cancelButtonText: 'No, cancel.',
      confirmButtonColor: this.dataset['confirmBtnColor'] || '#dc3545',
      reverseButtons: true,
    }).then((result) => {
      if (result.value) {
        $('#swal-link').attr('href', element.attr('href'));
        let swalLink = document.getElementById('swal-link');
        swalLink.setAttribute('data-method', element.data('method') || 'delete')

        if(element.data('remote')) {
          swalLink.setAttribute('data-remote', element.data('remote'));
        }

        swalLink.click();
      }
    });

    return false;
  });
});
