@extends('layouts.frontend.template')

@section('pageTitle')
{{trans('messages.Reset Password')}}
@stop

@section('content')
{{ BootForm::open(['url'=>route('auth.resetPassword')]) }}
<div class="modal-body">
    <?php
    echo BootForm::hidden('code', $code);
    echo BootForm::password('password', ['html' => trans('messages.Password') . ' <span class="required">*</span>'], ['required' => 'required']);
    ?>
    <?php
    echo BootForm::password('password_confirmation', ['html' => trans('messages.Password Confirmation') . ' <span class="required">*</span>'], ['required' => 'required']);
    ?>
    <div class="form-group">
        <div class="col-md-10 col-sm-9 col-md-offset-2 col-md-offset-3">
            <?php echo $captcha = LaravelCaptcha\Facades\Captcha::html();?>
        </div>
    </div>
    <?php
    echo BootForm::text('captcha', ['html' => trans('messages.Captcha') . ' <span class="required">*</span>', 'id' => 'captcha']);
    ?>
</div>
<div class="modal-footer">
    <button type="submit" class="btn btn-primary">{{trans('messages.Reset')}}</button>
</div>
{{ BootForm::close() }}
@stop