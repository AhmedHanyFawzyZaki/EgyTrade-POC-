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

<div class="box">
    <div class="box-body">
        {{ BootForm::inline(['name'=>'search', 'left_column_offset_class'=>'col-sm-offset-0', 'right_column_class'=>'pull-right']) }}
        <?php
        echo BootForm::text('app_num', ['html' => trans('declaration.Application (DID or SAD)') . ' <span class="required">*</span>'], '', ['placeHolder' => trans('declaration.Application (DID or SAD)')]);
        ?>
        <button class="btn btn-sm btn-default" type="submit">{{trans('declaration.Search')}}</button>
        {{BootForm::close()}}

        @if($app_steps && $current_step)
        <hr>
        @include('frontend.declaration.steps-bar', ['app_steps' => $app_steps])
        <div class="text-center">
            <a target="_blank" class="btn btn-success" href="{{url('/pdf')}}/{{$application->id}}">{{trans('messages.Print PDF')}}</a>
            <br>
            @include('pdf', ['application' => $application, 'username'=>$application->getCreatedBy->username])
        </div>
        @endif
    </div>
</div>
@stop