<div class="header clearfix">
    <div class="row">
        <div class="col-xs-6">
            <h3>
                <img src="{{ url('/') }}/files/img/logo.png" class="logo">
                {{trans('messages.'.config('app.name'))}}
            </h3>
        </div>
    </div>
    <nav class="navbar navbar-default">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <ul class="nav navbar-nav width100perc">
            <li role="presentation" class=""><a href="{{route('home')}}"><i class="fa fa-home"></i> {{trans('messages.Home')}}</a></li>
            <li role="presentation"><a href="{{route('home.contact')}}"><i class="fa fa-phone"></i> {{trans('messages.Contact Us')}}</a></li>
            @if (Auth::guest())
            <!--<li role="presentation"><a href="#" id="register-btn" data-toggle="modal" data-target="#registerModal">{{trans('messages.Register')}}</a></li>-->
            <li role="presentation" class="pull-right"><a href="#" id="login-btn" data-toggle="modal" data-target="#loginModal"><i class="fa fa-lock"></i> {{trans('messages.Login')}}</a></li>
            @else
            <li role="presentation" class=""><a href="{{route('declaration.applicationState')}}"><i class="fa fa-magnify"></i> {{trans('messages.Applications State')}}</a></li>
            <li class="dropdown"> 
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"><i class="fa fa-th-large"></i> {{trans('messages.Provided Services')}} <span class="caret"></span>
                </a> 
                <ul class="dropdown-menu"> 
                    <li><a href="{{route('declaration.index')}}">{{trans('messages.New ECD')}}</a></li> 
                    <li><a href="{{route('ecdShipping.applicationState')}}">{{trans('messages.Continue Shipping')}}</a></li>
                </ul> 
            </li>
            <!-- User Account: style can be found in dropdown.less -->
            <li class="dropdown user user-menu pull-right">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-user"></i>
                    <span class="hidden-xs">{{trans('messages.Account Info.')}}</span>
                </a>
                <ul class="dropdown-menu">
                    <li class="user-header">
                        <p>
                            Alexander Pierce - Jet
                            <br>
                            <small>Wallet: <span class="badge">2000</span></small>
                        </p>
                    </li>
                    <!-- Menu Footer-->
                    <li class="user-footer">
                        <div class="pull-right">
                            <a href="{{route('auth.logout')}}" class="btn btn-sm btn-default"><i class="fa fa-power-off"></i> {{trans('messages.Logout')}}</a>
                        </div>
                    </li>
                </ul>
            </li>
            <!-- Notifications: style can be found in dropdown.less -->
            <li class="dropdown notifications-menu pull-right">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-bell-o"></i>
                    <span class="label label-warning">10</span>
                </a>
                <ul class="dropdown-menu">
                    <li class="header">You have 10 notifications</li>
                    <li>
                        <!-- inner menu: contains the actual data -->
                        <ul class="menu">
                            <li>
                                <a href="#">
                                    <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
                                    page and may cause design problems
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-users text-red"></i> 5 new members joined
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-user text-red"></i> You changed your username
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="footer"><a href="#">View all</a></li>
                </ul>
            </li>
            @endif
        </ul>

    </nav>
</div>

@include('/frontend/loginModal')
@include('/frontend/forgotModal')