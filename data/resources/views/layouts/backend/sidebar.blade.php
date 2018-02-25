<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="{{ url('/') }}/files/img/avatars/user.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
                <p><br>{{ trans('messages.Username') }}</p>
            </div>
        </div>
        <br>

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <!--<li class="header">NAVIGATION BAR</li>-->
            <li {{ Request::is('dashboard') || Request::is('dashboard/*') ? 'class=active' : '' }}><a href="{{ url('/dashboard') }}">{{ trans('messages.Dashboard') }}</a></li>
            <li {{ Request::is('users') || Request::is('users/*') ? 'class=active' : '' }}><a href="{{ url('/users') }}">{{ trans('messages.Users') }}</a></li>
        </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>