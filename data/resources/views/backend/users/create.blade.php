@extends('layouts.backend.template')

@section('pageTitle')
    {{trans('messages.Create user')}}
@endsection

@section('content-header')
<h5 class="col-lg-12 well">
    <div class="col-lg-5">
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-home"></span></li>
            <li><a href="{{ route('users.index') }}">{{trans('messages.Users')}}</a></li>
            <li>{{trans('messages.Create')}}</li>
        </ul>
    </div>
    <div class="col-lg-7 control-menu">
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"></a>
            </div>
            <ul id="yw2" class="nav navbar-nav" role="menu">
                <li>
                    <a href="{{ route('users.index') }}">
                        <span class="glyphicon glyphicon glyphicon-list"></span>
                        {{trans('messages.Users List')}}
                    </a>
                </li>
                <li>
                    <a href="{{ route('users.create') }}">
                        <span class="glyphicon glyphicon glyphicon-plus-sign"></span>
                        {{trans('messages.Create user')}}
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</h5>
@endsection

@include('backend.users._form')