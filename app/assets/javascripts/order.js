$(document).ready(function () {

  var $orders = $('.job_application');

  $('#order_filter_status').on('change', function () {
    var currentStatus = this.value;
    $orders.each(function (index, order) {

      if (currentStatus === 'all') {
        $orders.show();
      } else {
        $order = $(order).show();
        if ($order.data('status') === currentStatus) {
          $order.show();
        } else {
          $order.hide();
        }
      }
    });
  });
});
