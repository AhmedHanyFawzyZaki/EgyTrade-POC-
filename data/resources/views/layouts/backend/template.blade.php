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
        <link rel="icon" href="/favicon.ico" type="image/x-icon">
        <title>@yield('pageTitle')</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'/>
        <!-- Bootstrap 3.3.2 -->
        <link href="{{ url('/') }}/files/css/bootstrap{{$rtl}}.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <link href="{{ url('/') }}/files/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <!-- Ionicons -->
        <!-- <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />-->
        <!-- Theme style -->
        <link href="{{ url('/') }}/files/css/admin/style{{$rtl}}.css" rel="stylesheet" />
        <link href="{{ url('/') }}/files/css/admin/skins/skin-blue.min.css" rel="stylesheet" />

        <!-- REQUIRED JS SCRIPTS -->

        <!-- jQuery 2.1.3 -->
        <script src="{{ url('/') }}/files/js/admin/jQuery/jQuery-2.1.3.min.js"></script>
        <!-- Bootstrap 3.3.2 JS -->
        <script src="{{ url('/') }}/files/js/bootstrap.min.js"></script>
        <!-- SlimScroll -->
        <script src="{{ url('/') }}/files/js/admin/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="{{ url('/') }}/files/js/admin/fastclick/fastclick.min.js"></script>
        <!-- AdminLTE App -->
        <script src="{{ url('/') }}/files/js/admin/dist/app.min.js"></script>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <!--
    BODY TAG OPTIONS:
    =================
    Apply one or more of the following classes to get the 
    desired effect
    |---------------------------------------------------------|
    | SKINS         | skin-blue                               |
    |               | skin-black                              |
    |               | skin-purple                             |
    |               | skin-yellow                             |
    |               | skin-red                                |
    |               | skin-green                              |
    |---------------------------------------------------------|
    |LAYOUT OPTIONS | fixed                                   |
    |               | layout-boxed                            |
    |               | layout-top-nav                          |
    |               | sidebar-collapse                        |  
    |---------------------------------------------------------|
    
    To hide logo bar in small screens do the following:
    1- add class "hidden-logo" to the body class.
    2- add class "hidden-xs" to the logo element.
     
    -->
    <body class="skin-blue fixed hidden-logo">
        <div class="wrapper">

            <!-- Main Header -->
            @include('layouts.shared.header')
            <!-- Left side column. contains the logo and sidebar -->
            @include('layouts.backend.sidebar')

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    @yield('content-header')
                </section>

                <!-- Main content -->
                <section class="content">
                    @include('layouts.shared.alerts')
                    <!-- Page Content -->
                    @yield('content')
                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->

        </div><!-- ./wrapper -->
    </body>
</html>