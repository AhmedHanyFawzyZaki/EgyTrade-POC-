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
    <li class="active">{{trans('declaration.Freight Details')}}</li>
</ol>
{{ BootForm::open(['name'=>'step9', 'left_column_offset_class'=>'col-sm-offset-0']) }}
<div class="box">
    @include('frontend.declaration.steps-bar', ['app_steps' => $app_steps])
    <div class="box-body">
        <?php
        echo BootForm::text('fd_bill_num', ['html' => trans('declaration.Bill of lading number') . ' <span class="required">*</span>']);
        echo BootForm::text('fd_vessel_name', ['html' => trans('declaration.Vessel Name')]);
        echo BootForm::text('fd_call_sign', ['html' => trans('declaration.Call Sign')]);
        echo BootForm::text('fd_imo_num', ['html' => trans('declaration.IMO Number')]);
        echo BootForm::text('fd_total_weight', ['html' => trans('declaration.Total Weight')]);
        echo BootForm::text('fd_net_weight', ['html' => trans('declaration.Net Weight')]);
        echo BootForm::select('fd_fr_line_id', ['html' => trans('declaration.Name Of Frieght Line')], \App\Models\FreightLines::pluck('name' . $field_ar, 'id')->prepend(trans('declaration.Please select freight line'), ''), '', ['class' => 'select2']);
        echo BootForm::select('fd_shipping_port', ['html' => trans('declaration.Shipping Port') . ' <span class="required">*</span>'], \App\Models\ShippingPorts::where('local_port', 1)->pluck('name' . $field_ar, 'id')->prepend(trans('declaration.Please select shipping port'), ''), '', ['class' => 'select2']);
        echo BootForm::select('fd_final_dest', ['html' => trans('declaration.Final Destination Port') . ' <span class="required">*</span>'], \App\Models\ShippingPorts::pluck('name' . $field_ar, 'id')->prepend(trans('declaration.Please select final destination port'), ''), '', ['class' => 'select2']);
        echo BootForm::text('fd_expected_arr_date', ['html' => trans('declaration.Expected Arrival Date') . ' <span class="required">*</span>'], '', ['class' => 'datetimepickmin text-left', 'dir' => 'ltr']);
        echo BootForm::text('fd_shippment_date', ['html' => trans('declaration.Date Of Shippment')], '', ['class' => 'datetimepickmin text-left', 'dir' => 'ltr']);
        echo BootForm::text('fd_trip_num', ['html' => trans('declaration.Trip Number') . ' <span class="required">*</span>']);
        echo BootForm::text('fd_forwarder_name', ['html' => trans('declaration.Frieght Forwarder Name') . ' <span class="required">*</span>']);
        echo BootForm::text('fd_forwarder_address', ['html' => trans('declaration.Frieght Forwarder Address')]);
        echo BootForm::text('fd_agent_name', ['html' => trans('declaration.Frieght Agent Name')]);
        echo BootForm::text('fd_agent_address', ['html' => trans('declaration.Frieght Agent Address')]);
        ?>
    </div>
    <div class="box-footer clearfix">
        <button class="pull-right btn btn-default" type="submit">{{trans('declaration.Next')}} &raquo;</button>
    </div>
</div>
{{BootForm::close()}}
@stop