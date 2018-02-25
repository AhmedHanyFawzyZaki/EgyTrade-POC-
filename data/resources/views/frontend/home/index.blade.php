@extends('layouts.frontend.template')

@section('pageTitle')
{{trans('messages.Home')}}
@stop

@section('content')
<h1>{{trans('messages.Important Informations For You')}}</h1>
<p class="lead">{{trans('messages.intro-singlewindow')}}</p>
@if(!Auth::check())
<p>
    <a class="btn btn-lg btn-primary" data-toggle="modal" data-target="#loginModal" href="#" role="button">{{trans('messages.Login now')}}</a>
</p>
@endif
@stop