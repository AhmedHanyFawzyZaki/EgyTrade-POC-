
<script src="{{ asset('js/notify.js') }}"></script>


<!-- run code -->
<script>
var url = "{{url('')}}";
var jqueryObj = $;
function check_notifications() {
    $.ajax({
        method: "GET",
        url: "{{url('/notifications-ajax')}}",
        dataType: 'json'
    }).done(function (result) {
        console.log(result);
        $.each(result.result, function (i, msg) {
            $.ajax({
                method: "GET",
                url: url + "/update-notifications-ajax/" + msg.id,
                dataType: 'json'
            }).done(function () {
                console.log(msg.message + ' => seen');
            });
            /*jqueryObj.notify(msg.message, {
                position: "top center",
                clickToHide: true,
                autoHide: false,
                className: 'success'
            });
            console.log(msg.message);*/
        });
    });
}
//check_notifications();
//setInterval(check_notifications, 60000);
//setInterval(check_main_notifications, 60000);
</script>
