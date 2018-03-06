@extends('layouts.frontend.template')

@section('pageTitle')
{{trans('messages.New ECD')}}
@stop

@section('content')
<?php
$field_ar = '';
$locale = App::getLocale();
if (in_array($locale, ['ar'])) {
    $field_ar = '_ar';
}
?>
<ol class="breadcrumb">
  <li><a href="#">{{ trans('messages.New ECD') }} ({{ trans('messages.Export') }})</a></li>
  <li class="active">{{trans('declaration.Origin Details')}}</li>
</ol>
{{ BootForm::open(['name'=>'step5', 'left_column_offset_class'=>'col-sm-offset-0']) }}
<div class="box">
    @include('frontend.declaration.steps-bar', ['app_steps' => $app_steps])
    <div class="box-body">
        <?php
        echo BootForm::select('od_country', ['html' => trans('declaration.Country of origin') . ' <span class="required">*</span>'], \App\Models\Countries::pluck('name' . $field_ar, 'id')->prepend(trans('declaration.Please select country of origin'), ''), '63', ['class' => 'select2']);
        ?>
    </div>
    <div class="box-footer clearfix">
        <button class="pull-right btn btn-default" type="submit">{{trans('declaration.Next')}} &raquo;</button>
    </div>
</div>
{{BootForm::close()}}
@stop