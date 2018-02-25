<?php
$rtl = '';
$locale = App::getLocale();
if (in_array($locale, ['ar']))
    $rtl = '-rtl';
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="language" content="en" />
        <meta charset="UTF-8"/>
        <title>{{trans('messages.'.config('app.name'))}} - {{trans('messages.Login')}}</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'/>

        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <!-- Bootstrap 3.3.2 -->
        <link href="{{ url('/') }}/files/css/bootstrap{{$rtl}}.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <link href="{{ url('/') }}/files/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <!-- Ionicons -->
        <!-- <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />-->
        <!-- Theme style -->
        <link href="{{ url('/') }}/files/css/admin/style{{$rtl}}.css" rel="stylesheet" />
        <link href="{{ url('/') }}/files/js/admin/iCheck/square/blue.css" rel="stylesheet" type="text/css" />
        <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
              page. However, you can choose any other skin. Make sure you
              apply the skin class to the body tag so the changes take effect.
        -->
        <link href="{{ url('/') }}/files/css/admin/skins/skin-blue.min.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <!-- REQUIRED JS SCRIPTS -->

        <!-- jQuery 2.1.3 -->
        <script src="{{ url('/') }}/files/js/admin/jQuery/jQuery-2.1.3.min.js"></script>
        <!-- Bootstrap 3.3.2 JS -->
        <script src="{{ url('/') }}/files/js/bootstrap.min.js"></script>
        <script src="{{ url('/') }}/files/js/admin/iCheck/icheck.min.js" type="text/javascript"></script>
        <script>
$(function () {
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' // optional
    });
});
        </script>
    </head>
    <body class="login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href="{{ url('/') }}"><b><?= trans('messages.'.config('app.name')); ?></b></a>
            </div><!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">{{trans('messages.Sign in to start your session')}}</p>
                <form action="{{ route('auth.login') }}" method="POST" enctype="multipart/form-data" class="bs-example">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <input type="text" placeholder="{{trans('messages.Email')}}" name="email" class="form-control" value="{{ is_null(old("email")) ? '' : old("email") }}"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span>
                            </span>
                        </div>
                    </div>
                    <div class="form-group @if($errors->has('password')) has-error @endif">
                        <div class="input-group">
                            <input type="password" placeholder="{{trans('messages.Password')}}" name="password" class="form-control" value="{{ is_null(old("password")) ? '' : old("password") }}"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-lock"></span>
                            </span>
                        </div>
                        @if($errors->has("password"))
                        <span class="help-block">{{ $errors->first("password") }}</span>
                        @endif
                    </div>
                    <div class="form-group text-center">
                        @if($errors->has("error"))
                        <div class="text-danger help-inline">{{ $errors->first("error") }}</div>
                        @endif
                    </div>
                    <div class="row">
                        <div class="col-xs-8">    
                            <div class="checkbox icheck">
                                <label>
                                    <?php //echo $form->checkBox($model, 'rememberMe'); ?>
                                </label>
                            </div>                        
                        </div><!-- /.col -->
                        <div class="col-xs-4">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">{{trans('messages.Login')}}</button>
                        </div><!-- /.col -->
                    </div>
                </form>

                <!--<div class="social-auth-links text-center">
                  <p>- OR -</p>
                  <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using Facebook</a>
                  <a href="#" class="btn btn-block btn-social btn-google-plus btn-flat"><i class="fa fa-google-plus"></i> Sign in using Google+</a>
                </div><!-- /.social-auth-links -->

                <!--<a href="#">I forgot my password</a><br>
                <a href="register.html" class="text-center">Register a new membership</a>-->

            </div><!-- /.login-box-body -->
        </div><!-- /.login-box -->

    </body>
</html>