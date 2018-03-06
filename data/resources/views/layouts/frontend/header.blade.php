<header class="main-header">

    <!-- Logo -->
    <a href="{{ url('/') }}" class="logo hidden-xs no-padding">
        <img src="{{ url('/') }}/files/img/logo.png" class="logo">
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu pull-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" id="acc-info">
                        <i class="fa fa-user"></i>
                        <span class="hidden-xs">{{trans('messages.Account Info.')}}</span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="user-header">
                            <p>
                                {{Auth::user()->username}} - {{Auth::user()->getCompany->name}}
                                <br>
                                <br>
                                <small style="font-size: 24px;">{{trans('messages.E-Wallet')}} <br><span class="badge font-16">{{Auth::user()->wallet}}</span></small>
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
                <li class="dropdown notifications-menu pull-left">
                    <?php
                    $unseen_count = \App\Models\ApplicationNotifications::whereHas('applications', function($q) {
                                $q->where('created_by', auth()->user()->id);
                            })->where('seen', 0)->orderBy('created_at')->get()->count();
                    $models = \App\Models\ApplicationNotifications::whereHas('applications', function($q) {
                                $q->where('created_by', auth()->user()->id);
                            })->orderBy('created_at', 'desc')->get();
                    ?>
                    <a href="#" onclick="check_notifications()" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <span class="label label-warning">{{$unseen_count}}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!--<li class="header">You have {{$unseen_count}} new notifications</li>-->
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                @if($models)
                                @foreach($models as $m)
                                <li>
                                    <span>
                                        <i class="fa fa-quote-right {{$m->seen?'text-aqua':'text-danger'}}"></i> 
                                        {!! $m->message !!}
                                    </span>
                                </li>
                                @endforeach
                                @else
                                <li>
                                    <a href="#">
                                        {{trans('messages.No Items Found')}}
                                    </a>
                                </li>
                                @endif
                            </ul>
                        </li>
                        <!--<li class="footer"><a href="#">View all</a></li>-->
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>