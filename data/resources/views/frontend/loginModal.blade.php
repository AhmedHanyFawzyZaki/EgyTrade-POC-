<div class="modal" id="loginModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                <h4 class="modal-title">{{trans('messages.Login')}}</h4>
            </div>
            {{ BootForm::open(['id'=>'login-form', 'onsubmit'=>'return false;', 'left_column_class' => 'col-md-3 col-sm-4', 'right_column_class' => 'col-md-9 col-sm-8']) }}
            <div class="modal-body">
                <?php
                echo BootForm::text('email', ['html' => trans('messages.Email') . ' <span class="required">*</span>'], '', ['id' => 'login-username']);
                ?>
                <?php
                echo BootForm::password('password', ['html' => trans('messages.Password') . ' <span class="required">*</span>'], ['id' => 'login-password']);
                ?>
                <div id="login-error-div" class="text-center alert alert-danger hidden"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal" data-toggle="modal" data-target="#forgotModal">{{trans('messages.Forgot Password')}}</button>
                <button type="submit" class="btn btn-primary" onclick="send()">{{trans('messages.Login')}}</button>
            </div>
            {{ BootForm::close() }}
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">

    function send()
    {

        var data = $("#login-form").serialize();

        $.ajax({
            type: 'POST',
            url: "{{route('auth.loginAjax')}}",
            data: data,
            success: function (data) {
                data = jQuery.parseJSON(data);
                if (data.status == 1)
                    window.location = "{{url('/')}}/" + data['path'];
                else {
                    $('#login-error-div').html(data['msg']);
                    $('#login-error-div').removeClass('hidden');
                }
            },
            /*error: function (data) { // if error occured
             alert("Error occured.please try again");
             alert(data);
             },
             
             dataType: 'html'*/
        });

    }

</script>