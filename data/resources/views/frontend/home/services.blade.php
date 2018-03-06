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
    <a class="col-sm-4 col-xs-6 col-sm-offset-1" title="{{ trans('messages.New ECD') }}" href="{{ route('declaration.index') }}">
        <div class="box box-solid">
            <div class="box-body">
                <h4 class="text-center boxes-header">
                    <i class="fa fa-folder-open-o font-54"></i>
                    <br><br>
                    <span class="black-text">
                    {{ trans('messages.New ECD') }} ({{ trans('messages.Export') }})
                    </span>
                </h4>
            </div>
        </div>
    </a>
    <a class="col-sm-4 col-xs-6 col-sm-offset-1" title="{{trans('messages.Continue Shipping Details')}}" href="{{route('ecdShipping.applicationState')}}">
        <div class="box box-solid">
            <div class="box-body">
                <h4 class="text-center boxes-header">
                    <i class="fa fa-folder-open-o font-54"></i>
                    <br><br>
                    <span class="black-text">
                    {{trans('messages.Continue Shipping Details')}}
                    </span>
                </h4>
            </div>
        </div>
    </a>
</div>
@stop