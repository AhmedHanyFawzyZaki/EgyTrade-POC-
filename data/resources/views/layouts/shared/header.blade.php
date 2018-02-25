<header class="main-header">

    <!-- Logo -->
    <a href="{{ url('/') }}" class="logo hidden-xs"><b>{{trans('messages.'.config('app.name'))}}</b></a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account Menu -->
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="{{url('/logout')}}">
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->
                        <span>{{trans('messages.Logout')}}</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</header>