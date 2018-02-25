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

<h3 class="alert alert-info text-center">{{trans('declaration.Inspection Details')}}</h3>
{{ BootForm::open(['name'=>'step4', 'left_column_offset_class'=>'col-sm-offset-0']) }}
<div class="box">
    @include('frontend.declaration.steps-bar', ['app_steps' => $app_steps])
    <div class="box-body">
        <?php
        echo BootForm::select('ir_inspection_loc', ['html' => trans('declaration.Inspection Location') . ' <span class="required">*</span>'], \App\Models\InspectionLocations::pluck('name' . $field_ar, 'id')->prepend(trans('declaration.Please select inspection location'), ''), '', ['class' => 'select2']);
        echo BootForm::text('ir_inspection_date', ['html' => trans('declaration.Inspection Date') . ' <span class="required">*</span>'], '', ['class' => 'datetimepickmin text-left', 'dir'=>'ltr']);
        echo BootForm::text('ir_inspection_address', ['html' => trans('declaration.Inspection Address') . ' <span class="required">*</span>']);
        ?>
    </div>
    <div class="box-footer clearfix">
        <button class="pull-right btn btn-default" type="submit">{{trans('declaration.Next')}} &raquo;</button>
    </div>
</div>
{{BootForm::close()}}
@stop