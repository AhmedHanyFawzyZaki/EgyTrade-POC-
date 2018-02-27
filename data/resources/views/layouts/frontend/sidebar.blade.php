<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="{{ url('/') }}/files/img/avatars/user.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
                <p><br>{{ Auth::user()->username }}</p>
            </div>
        </div>
        <br>

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <!--<li class="header">NAVIGATION BAR</li>-->
            <li {{ Request::is('home') ? 'class=active' : '' }}><a href="{{ route('home') }}">{{ trans('messages.Home') }}</a></li>
            <li {{ Request::is('services') ? 'class=active' : '' }}><a href="{{ route('home.services') }}">{{ trans('messages.Provided Services') }}</a></li>
            <li {{ Request::is('declaration/applicationState') ? 'class=active' : '' }}><a href="{{route('declaration.applicationState')}}">{{trans('messages.Applications State')}}</a></li>
            <li {{ Request::is('/') ? 'class=active' : '' }}><a href="#acc-info" onclick="setTimeout(function(){$('#acc-info').click()},10)">{{trans('messages.E-Wallet')}}</a></li>
            <li {{ Request::is('/') ? 'class=active' : '' }}><a href="{{route('landingPage')}}#contact">{{trans('messages.Contact Us')}}</a></li>
        </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>