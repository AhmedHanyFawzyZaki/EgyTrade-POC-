@extends('layouts.backend.template')

@section('pageTitle')
    {{trans('messages.Users List')}}
@endsection

@section('content-header')
<h5 class="col-lg-12 well">
    <div class="col-lg-5">
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-home"></span></li>
            <li><a href="javascript:void(0)">{{trans('messages.Users')}}</a></li>
        </ul>
    </div>
    <div class="col-lg-7 control-menu">
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"></a>
            </div>
            <ul id="yw2" class="nav navbar-nav" role="menu">
                <li class="active">
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

@section('content')
<div class="panel panel-default clear">
    <div class="panel-body">
        @if($users->count())
        <table class="items table table-hover table-striped">
            <thead>
                <tr>
                    <!--<th>ID</th>-->
                    <th>{{trans('messages.Email')}}</th>
                    <th>{{trans('messages.Active')}}</th>
                    <th>{{trans('messages.User Type')}}</th>
                    <th class="button-column"></th>
                </tr>
            </thead>

            <tbody>
                @foreach($users as $user)
                <tr>
                    <!--<td>{{$user->id}}</td>-->
                    <td>{{$user->email}}</td>
                    <td>{{$user->getActive()}}</td>
                    <td>{{trans('messages.'.$user->usertype->user_type_name)}}</td>
                    <td class="button-column">
                        <a class="btn btn-xs btn-primary" href="{{ route('users.show', $user->id) }}"><i class="glyphicon glyphicon-eye-open"></i> {{trans('messages.View')}}</a>
                        <a class="btn btn-xs btn-warning" href="{{ route('users.edit', $user->id) }}"><i class="glyphicon glyphicon-edit"></i> {{trans('messages.Edit')}}</a>
                        <form action="{{ route('users.destroy', $user->id) }}" method="POST" style="display: inline;" onsubmit="if (confirm('{{trans('messages.Are you sure you want to delete this item?')}}')) {
                                    return true
                                } else {
                                    return false
                                }
                                ;">
                            <input type="hidden" name="_method" value="DELETE">
                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                            <button type="submit" class="btn btn-xs btn-danger"><i class="glyphicon glyphicon-trash"></i> {{trans('messages.Delete')}}</button>
                        </form>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        {!! $users->render() !!}
        @else
        <h3 class="text-center alert alert-info">{{trans('messages.Empty!')}}</h3>
        @endif

    </div>
</div>

@endsection