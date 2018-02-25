@section('content')
{{ BootForm::open(['model' => $user, 'store' => 'users.store', 'update' => 'users.update']) }}

<div class="panel clear">
    <div class="panel-heading">  
        <p class="help-block">{{trans('messages.Fields with')}} <span class="required">*</span> {{trans('messages.are required')}}.</p>
        @if ($errors->has('password'))
        <div class="alert alert-block alert-danger">
            <strong>{{ $errors->first('password') }}</strong>
        </div>
        @endif
    </div>
    <div class="panel-body">
        @if($user->exists)
        <?php echo BootForm::hidden('_method', 'PUT') ?>
        @endif
        <?php echo BootForm::hidden('_token', csrf_token()) ?>
        <?php echo BootForm::text('email', ['html' => trans('messages.Email') . ' <span class="required">*</span>']) ?>
        <?php
        if (!$user->exists)
            echo BootForm::password('password', ['html' => trans('messages.Password') . ' <span class="required">*</span>']);
        ?>
        <?php echo BootForm::select('user_type_id', ['html' => trans('messages.User Type') . ' <span class="required">*</span>'], \App\Models\UserType::pluck('user_type_name', 'user_type_id')->prepend(trans('messages.Please select user type'),'')); ?>
        <?php echo BootForm::checkbox('active', trans('messages.Active')) ?>
    </div>

    <div class="panel-footer col-md-12">

        <div class="text-left col-md-6">
            <?php
            if ($user->exists) {
                ?>
                <a class="btn btn-danger" data-toggle="modal" data-target="#myModal">{{trans('messages.Reset Password')}}</a>
                <?php
            }
            ?>
        </div>

        <div class="text-right col-md-6">
            <?= BootForm::submit(trans('messages.Save')) ?>
        </div>
    </div>
</div>
{{ BootForm::close() }}

<?php
if ($user->exists) {
    ?>
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                {{ BootForm::open(['url' => 'users/'.$user->id.'/changePassword']) }}
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">{{trans('messages.Reset Password')}}</h4>
                </div>
                <div class="modal-body">
                    <?php
                    echo BootForm::password('password', ['html' => trans('messages.Password') . ' <span class="required">*</span>']);
                    ?>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">{{trans('messages.Save')}}</button>
                </div>
                {{ BootForm::close() }}
            </div>
        </div>
    </div>
    <?php
}
?>
@endsection