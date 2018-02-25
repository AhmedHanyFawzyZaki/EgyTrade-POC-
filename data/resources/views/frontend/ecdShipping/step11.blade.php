@extends('layouts.frontend.template')

@section('pageTitle')
{{trans('messages.Continue Shipping Details')}}
@stop

@section('content')
<?php
$field_ar = '';
$locale = App::getLocale();
if (in_array($locale, ['ar'])) {
    $field_ar = '_ar';
}
?>

<h3 class="alert alert-info text-center">{{trans('declaration.Shipping Attachment')}}</h3>
{{ BootForm::open(['name'=>'step11', 'enctype'=>'multipart/form-data', 'left_column_offset_class'=>'col-sm-offset-0']) }}
<div class="box">
    @include('frontend.declaration.steps-bar', ['app_steps' => $app_steps])
    <div class="box-body">
        <?php
        echo BootForm::file('att_ini_shippment', ['html' => trans('declaration.Initial Freight Permission') . ' <span class="required">*</span>']);
        echo BootForm::file('att_pack', ['html' => trans('declaration.Package Statement') . ' <span class="required">*</span>']);
        ?>
    </div>
    <div class="box-footer clearfix">
        <button class="pull-right btn btn-default" type="submit">{{trans('declaration.Finish')}}</button>
    </div>
</div>
{{BootForm::close()}}
@stop