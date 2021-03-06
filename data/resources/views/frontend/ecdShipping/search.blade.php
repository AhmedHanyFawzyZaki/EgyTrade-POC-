@extends('layouts.frontend.template')

@section('pageTitle')
{{trans('messages.Continue ECD Shipping')}}
@stop

@section('content')
<?php
$field_ar = '';
$locale = App::getLocale();
if (in_array($locale, ['ar'])) {
    $field_ar = '_ar';
}
?>

<div class="box">
    <div class="box-body">
        {{ BootForm::inline(['name'=>'search', 'left_column_offset_class'=>'col-sm-offset-0', 'right_column_class'=>'pull-right']) }}
        <?php
        echo BootForm::text('app_num', ['html' => trans('declaration.Application DID Number') . ' <span class="required">*</span>'], '', ['placeHolder' => trans('declaration.Application DID Number')]);
        ?>
        <button class="btn btn-sm btn-default" type="submit">{{trans('declaration.Search')}}</button>
        {{BootForm::close()}}
    </div>
</div>
@stop