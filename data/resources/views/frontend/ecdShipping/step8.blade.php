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

<ol class="breadcrumb">
  <li><a href="#">{{trans('messages.Continue Shipping Details')}}</a></li>
  <li class="active">{{trans('declaration.Transportation Details')}}</li>
</ol>
{{ BootForm::open(['name'=>'step8', 'left_column_offset_class'=>'col-sm-offset-0']) }}
<div class="box">
    @include('frontend.declaration.steps-bar', ['app_steps' => $app_steps])
    <div class="box-body">
        <?php
        echo BootForm::text('td_car_license', ['html' => trans('declaration.Car License Number') . ' <span class="required">*</span>']);
        echo BootForm::text('td_driver_license', ['html' => trans('declaration.Driver License') . ' <span class="required">*</span>']);
        echo BootForm::text('td_driver_name', ['html' => trans('declaration.Driver Name') . ' <span class="required">*</span>']);
        echo BootForm::text('td_car_total_weight', ['html' => trans('declaration.Car Total Weight') . ' <span class="required">*</span>']);
        echo BootForm::text('td_car_net_weight', ['html' => trans('declaration.Car Net Weight') . ' <span class="required">*</span>']);
        ?>
    </div>
    <div class="box-footer clearfix">
        <button class="pull-right btn btn-default" type="submit">{{trans('declaration.Next')}} &raquo;</button>
    </div>
</div>
{{BootForm::close()}}
@stop