<?php
$rtl = '';
$locale = App::getLocale();
if (in_array($locale, ['ar']))
    $rtl = '-rtl';
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="language" content="en" />
        <meta charset="UTF-8"/>
        <link rel="icon" href="/favicon.ico" type="image/x-icon">
        <title>{{ trans('messages.Home') }}</title>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
        <link href="{{ url('/') }}/files/css/bootstrap{{$rtl}}.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <link href="{{ url('/') }}/files/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="{{ url('/') }}/files/landing/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- js -->
        <!-- jQuery 2.1.3 -->
        <script src="{{ url('/') }}/files/js/admin/jQuery/jQuery-2.1.3.min.js"></script>
        <!-- Bootstrap 3.3.2 JS -->
        <script src="{{ url('/') }}/files/js/bootstrap.min.js"></script>
        <!-- SlimScroll -->
        <script src="{{ url('/') }}/files/js/admin/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="{{ url('/') }}/files/js/admin/fastclick/fastclick.min.js"></script>
    </head>
    <body>
        <div class="header">
            <div class="container">
                <nav class="navbar navbar-default">
                    <div class="navbar-header navbar-left">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <h1>
                            <a class="navbar-brand" href="">
                                <img src="{{ url('/') }}/files/img/logo.png" style="width: 200px;">
                            </a>
                        </h1>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                        <nav class="cl-effect-13" id="cl-effect-13">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="{{route('landingPage')}}">{{trans('messages.Home')}}</a></li>
                                <li><a href="#about"><i class="fa fa-info"></i> {{trans('messages.About us')}}</a></li>
                                <li><a href="#services"><i class="fa fa-th-large"></i> {{trans('messages.Provided Advantages')}}</a></li>
                                <li><a href="#contact"><i class="fa fa-phone"></i> {{trans('messages.Contact Us')}}</a></li>
                                @if (Auth::guest())
                                <li><a href="#" id="login-btn" data-toggle="modal" data-target="#loginModal"><i class="fa fa-lock"></i> {{trans('messages.Login')}}</a></li>
                                @else
                                <li><a href="{{route('home')}}"><i class="fa fa-user"></i> {{trans('messages.My Account')}}</a></li>
                                <li><a href="{{route('auth.logout')}}"><i class="fa fa-power-off"></i> {{trans('messages.Logout')}}</a></li>
                                @endif
                            </ul>

                        </nav>
                        @include('/frontend/loginModal')
                        @include('/frontend/forgotModal')
                    </div>
                </nav>
            </div>
        </div>
        <div class="banner">
            <div class="container">
                <div class="slider">
                    <div class="callbacks_container">
                        <ul class="rslides callbacks callbacks1" id="slider4">
                            <li>
                                <div class="agileits_w3layouts_banner_info">
                                    <div class="col-md-12 w3-agileits-bann text-right">
                                        <!--<h2 class="banner-cover-text">
                                            <br>{{trans('messages.The single window for trading in egypt')}}<br>
                                            <small class="white-font">{{trans('messages.New portal for business affairs')}}</small>
                                        </h2>-->
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!-- //banner -->
        <!-- agileinfo -->
        <div class="agileinfo-services" id="about">
            <div class="container">
                <h2 class="w3l_head w3l_head1">{{trans('messages.The single window for business affairs in Egypt')}}</h2>
                <hr class="custom-hr">
                <p class="w3ls-p">
                    {{trans('messages.about text')}}
                </p>
                <div class="w3_agileits_services_grids">
                    <div class="col-md-4 w3_agileits_services_grid">
                        <div class="w3_agileits_services_grid_agile">
                            <div class="w3_agileits_services_grid_1">
                                <img src="{{ url('/') }}/files/img/1.png" width="160">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 w3_agileits_services_grid">
                        <div class="w3_agileits_services_grid_agile">
                            <div class="w3_agileits_services_grid_1">
                                <img src="{{ url('/') }}/files/img/2.png" width="160">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 w3_agileits_services_grid">
                        <div class="w3_agileits_services_grid_agile">
                            <div class="w3_agileits_services_grid_1">
                                <img src="{{ url('/') }}/files/img/3.png" width="160">
                            </div>
                        </div>
                    </div>

                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!-- //agileinfo -->
        <!-- services -->
        <div class="news">
            <div class="banner-bottom" id="services">
                <div class="container">
                    <h3 class="w3l_head w3l_head1">{{trans('messages.Provided Advantages')}}</h3>
                    <hr class="custom-hr">
                    <div class="ser-bottom">
                        <div class="col-md-6 col-sm-6 agileits_banner_bottom_left">
                            <div class="agileinfo_banner_bottom_pos">
                                <div class="w3_agileits_banner_bottom_pos_grid">
                                    <div class="col-xs-3 wthree_banner_bottom_grid_left">
                                        <div class="agile_banner_bottom_grid_left_grid hvr-radial-out">
                                            <i class="fa fa-dollar" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-9 wthree_banner_bottom_grid_right">	
                                        <h4>{{trans('messages.Decreasing the cost of business affairs')}}</h4>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 agileits_banner_bottom_left">
                            <div class="agileinfo_banner_bottom_pos">
                                <div class="w3_agileits_banner_bottom_pos_grid">
                                    <div class="col-xs-3 wthree_banner_bottom_grid_left">
                                        <div class="agile_banner_bottom_grid_left_grid hvr-radial-out">
                                            <i class="fa fa-clock-o" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-9 wthree_banner_bottom_grid_right">	
                                        <h4>{{trans('messages.Decreasing the time needed to finish')}}</h4>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 agileits_banner_bottom_left">
                            <div class="agileinfo_banner_bottom_pos">
                                <div class="w3_agileits_banner_bottom_pos_grid">
                                    <div class="col-xs-3 wthree_banner_bottom_grid_left">
                                        <div class="agile_banner_bottom_grid_left_grid hvr-radial-out">
                                            <i class="fa fa-rocket" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-9 wthree_banner_bottom_grid_right">	
                                        <h4>{{trans('messages.Quick finish of the instructions')}}</h4>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 agileits_banner_bottom_left">
                            <div class="agileinfo_banner_bottom_pos">
                                <div class="w3_agileits_banner_bottom_pos_grid">
                                    <div class="col-xs-3 wthree_banner_bottom_grid_left">
                                        <div class="agile_banner_bottom_grid_left_grid hvr-radial-out">
                                            <i class="fa fa-laptop" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-9 wthree_banner_bottom_grid_right">	
                                        <h4>{{trans('messages.Egyptian Business integrity & coherence')}}</h4>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //services -->
        <!-- footer -->
        <div class="footer-top" id="contact">
            <div class="container">
                <div class="col-md-3 w3ls-footer-top">
                    <h3>{{trans('messages.Contact Us')}}</h3>
                    <ul>
                        <li>
                            <label class="footer-item">
                                <i class="fa fa-map-marker"></i> 
                                {{trans('messages.Egypt')}}
                            </label>
                        </li>
                        <li>
                            <label class="footer-item">
                                <i class="fa fa-envelope"></i> 
                                egytrade@egypt.com
                            </label>
                        </li>
                        <li>
                            <label class="footer-item">
                                <i class="fa fa-phone"></i> 
                                02278889925
                            </label>
                        </li>
                    </ul>
                </div>
                <div class="col-md-5 w3ls-footer-top">
                    <video height="220" controls style="width: 100%;">
                        <source src="{{ url('/') }}/files/img/vid.mp4" type="video/mp4">
                    </video>
                </div>
                <div class="col-md-4 w3ls-footer-top">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d14554315.505673394!2d33.3995824!3d27.0522869!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2seg!4v1519699246385" frameborder="0" style="border:0; width: 100%; height:220px;" allowfullscreen></iframe>
                </div>

                <div class="clearfix"></div>
                <div class="footer-w3layouts">
                    <div class="agile-copy">
                        <p>Copyrights 2018 for EgyTrade &COPY;</p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </body>
</html>