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

<h3 class="alert alert-info text-center">{{trans('declaration.Ecd Attachment')}}</h3>
{{ BootForm::open(['name'=>'step6', 'enctype'=>'multipart/form-data', 'left_column_offset_class'=>'col-sm-offset-0']) }}
<div class="box">
    @include('frontend.declaration.steps-bar', ['app_steps' => $app_steps])
    <div class="box-body">
        <?php
        echo BootForm::file('att_agreement', ['html' => trans('declaration.Agreement of export') . ' <span class="required">*</span>']);
        echo BootForm::file('att_ecd_invoice', ['html' => trans('declaration.Invoice') . ' <span class="required">*</span>']);
        ?>
    </div>
    <div class="box-footer clearfix">
        <button class="pull-right btn btn-default" type="submit">{{trans('declaration.Next')}} &raquo;</button>
    </div>
</div>
{{BootForm::close()}}
@stop