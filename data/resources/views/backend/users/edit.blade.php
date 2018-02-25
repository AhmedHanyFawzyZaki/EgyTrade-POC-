@extends('layouts.backend.template')

@section('pageTitle')
    {{trans('messages.Edit user')}}
@endsection

@section('content-header')
<h5 class="col-lg-12 well">
    <div class="col-lg-5">
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-home"></span></li>
            <li><a href="{{ route('users.index') }}">{{trans('messages.Users')}}</a></li>
            <li>{{$user->username}}</li>
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
                <li>
                    <a href="{{ route('users.show', $user->id) }}">
                        <span class="glyphicon glyphicon glyphicon-edit"></span>
                        {{trans('messages.View user')}}
                    </a>
                </li>
                <li>
                    <form action="{{ route('users.destroy', $user->id) }}" method="POST" style="display: inline;" onsubmit="if (confirm('{{trans('messages.Are you sure you want to delete this item?')}}')) {
                                return true
                            } else {
                                return false
                            }
                            ;">
                        <input type="hidden" name="_method" value="DELETE">
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        <button class="show-delete-btn" type="submit"><i class="glyphicon glyphicon-trash"></i> {{trans('messages.Delete user')}}</button>
                    </form>
                </li>
            </ul>
        </nav>
    </div>
</h5>
@endsection

@include('backend.users._form')