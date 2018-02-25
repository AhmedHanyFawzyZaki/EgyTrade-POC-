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

<h3 class="alert alert-info text-center">{{trans('declaration.Sender Details')}}</h3>
{{ BootForm::open(['name'=>'step2', 'left_column_offset_class'=>'col-sm-offset-0']) }}
<div class="box">
    @include('frontend.declaration.steps-bar', ['app_steps' => $app_steps])
    <div class="box-body">
        <?php
        echo BootForm::text('sd_consignee_name', ['html' => trans('declaration.Consignee Name') . ' <span class="required">*</span>']);
        echo BootForm::text('sd_cus_ref_num', ['html' => trans('declaration.Custom Reference No.') . ' <span class="required">*</span>'], $application->getCompany->customs_ref_num);
        echo BootForm::text('sd_vat', ['html' => trans('declaration.Vat') . ' <span class="required">*</span>'], $application->getCompany->vat);
        echo BootForm::text('sd_consignee_address', ['html' => trans('declaration.Consignee Address') . ' <span class="required">*</span>'], $application->getCompany->address);
        echo BootForm::select('sd_recipient_country', ['html' => trans('declaration.Recipient Country') . ' <span class="required">*</span>'], \App\Models\Countries::pluck('name' . $field_ar, 'id')->prepend(trans('declaration.Please select country'), ''), '', ['class' => 'select2']);
        echo BootForm::text('sd_recipient_name', ['html' => trans('declaration.Recipient Name')]);
        echo BootForm::text('sd_recipient_address', ['html' => trans('declaration.Recipient Address')]);
        echo BootForm::text('sd_reg_custom', ['html' => trans('declaration.Registration Customs')]);
        ?>
    </div>
    <div class="box-footer clearfix">
        <button class="pull-right btn btn-default" type="submit">{{trans('declaration.Next')}} &raquo;</button>
    </div>
</div>
{{BootForm::close()}}
@stop