@extends('layouts.frontend.template')

@section('pageTitle')
{{trans('messages.User Panel')}}
@stop

@section('content')
<?php
$field_ar = '';
$locale = App::getLocale();
if (in_array($locale, ['ar'])) {
    $field_ar = '_ar';
}
?>
<div class="clear"><br><br></div>
<div class="row">
    <div class="col-sm-4 col-sm-offset-4">
        <div class="box box-solid">
            <div class="box-body">
                <h4 class="text-center">
                    {{ trans('messages.Welcome') }}
                    <br><br>
                    {{ Auth::user()->getCompany->name }}
                </h4>
            </div>
        </div>
    </div>
</div>
<div class="clear"><br><br></div>
<div class="row">
    <a class="col-sm-4 col-xs-6 col-sm-offset-1" title="{{ trans('messages.Provided Services') }}" href="{{ route('home.services') }}">
        <div class="box box-solid">
            <div class="box-body">
                <h4 class="text-center boxes-header">
                    <i class="fa fa-hand-pointer-o font-34"></i>
                    <br><br>
                    <span class="black-text">
                    {{ trans('messages.Provided Services') }}
                    </span>
                </h4>
            </div>
        </div>
    </a>
    <a class="col-sm-4 col-xs-6 col-sm-offset-1" title="{{trans('messages.Applications State')}}" href="{{route('declaration.applicationState')}}">
        <div class="box box-solid">
            <div class="box-body">
                <h4 class="text-center boxes-header">
                    <i class="fa fa-folder-open-o font-34"></i>
                    <br><br>
                    <span class="black-text">
                    {{trans('messages.Applications State')}}
                    </span>
                </h4>
            </div>
        </div>
    </a>
</div>
<div class="row">
    <a class="col-sm-4 col-xs-6 col-sm-offset-1" title="{{trans('messages.E-Wallet')}}" href="#acc-info" onclick="setTimeout(function () {
                $('#acc-info').click()
            }, 10)">
        <div class="box box-solid">
            <div class="box-body">
                <h4 class="text-center boxes-header">
                    <i class="fa fa-credit-card font-34"></i>
                    <br><br>
                    <span class="black-text">
                    {{trans('messages.E-Wallet')}}
                    </span>
                </h4>
            </div>
        </div>
    </a>
    <a class="col-sm-4 col-xs-6 col-sm-offset-1" title="{{trans('messages.Contact Us')}}" href="{{route('landingPage')}}#contact">
        <div class="box box-solid">
            <div class="box-body">
                <h4 class="text-center boxes-header">
                    <i class="fa fa-share-alt font-34"></i>
                    <br><br>
                    <span class="black-text">
                    {{trans('messages.Contact Us')}}
                    </span>
                </h4>
            </div>
        </div>
    </a>
</div>
@stop