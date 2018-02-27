@extends('layouts.frontend.template')

@section('pageTitle')
{{trans('messages.Application State')}}
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
    <a class="col-lg-5 col-xs-6" title="{{ trans('messages.New ECD') }}" href="{{ route('declaration.index') }}">
        <div class="info-box">
            <span class="info-box-icon bg-green-gradient"><i class="fa fa-plus"></i></span>
            <div class="info-box-content">
                <span class="info-box-content"><br><b>{{ trans('messages.New ECD') }}</b></span>
            </div><!-- /.info-box-content -->
        </div>
    </a>
    <a class="col-lg-5 col-xs-6 col-sm-offset-2" title="{{trans('messages.Continue Shipping Details')}}" href="{{route('ecdShipping.applicationState')}}">
        <div class="info-box">
            <span class="info-box-icon bg-blue-gradient"><i class="fa fa-refresh"></i></span>
            <div class="info-box-content">
                <span class="info-box-content"><br>
                    <b>{{trans('messages.Continue Shipping Details')}}</b>
                </span>
            </div><!-- /.info-box-content -->
        </div>
    </a>
</div>
@stop