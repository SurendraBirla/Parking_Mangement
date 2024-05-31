//= require active_admin/base
$(document).ready(function() {
    $('#user_select').change(function() {
        // debugger
      var userId = $(this).val();
      $.ajax({
        url: '/admin/vehicles_for_user',
        data: { user_id: userId },
        success: function(data) {
          $('#vehicle_select').empty();
          data.forEach(function(vehicle) {
            $('#vehicle_select').append(new Option(vehicle.name, vehicle.id));
          });
        }
      });
    });
  });
  