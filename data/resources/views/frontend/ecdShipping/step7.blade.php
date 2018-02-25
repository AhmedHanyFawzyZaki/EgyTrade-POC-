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

<h3 class="alert alert-info text-center">{{trans('declaration.Containers Details')}}</h3>
{{ BootForm::open(['name'=>'step7', 'left_column_offset_class'=>'col-sm-offset-0']) }}
{{ BootForm::hidden('highestID', 0, ['id' => 'highestID']) }}<!-- hidden input used in relcopy-->
<div class="box">
    @include('frontend.declaration.steps-bar', ['app_steps' => $app_steps])
    <div class="box-body">
        <div class="well text-center">
            <div class="clone text-left">
                <div class="well col-sm-10">
                    <?php echo BootForm::text('cr_num[]', ['html' => trans('declaration.Container Number') . ' <span class="required">*</span>'], '', ['required' => 'required']); ?>
                    <?php echo BootForm::select('cr_owner[]', ['html' => trans('declaration.Container Owner') . ' <span class="required">*</span>'], \App\Models\ContainerOwners::pluck('name'.$field_ar, 'id')->prepend(trans('declaration.Please select container owner'), ''), '', ['class' => 'select2', 'required' => 'required']); ?>
                    <?php echo BootForm::select('cr_type[]', ['html' => trans('declaration.Container Type') . ' <span class="required">*</span>'], \App\Models\ContainerTypes::pluck('name'.$field_ar, 'id')->prepend(trans('declaration.Please select container type'), ''), '', ['class' => 'select2', 'required' => 'required']); ?>
                    <?php echo BootForm::select('cr_capacity[]', ['html' => trans('declaration.Container Capacity') . ' <span class="required">*</span>'], \App\Models\ContainerCapacities::pluck('name'.$field_ar, 'id')->prepend(trans('declaration.Please select container capacity'), ''), '', ['class' => 'select2', 'required' => 'required']); ?>
                </div>
            </div>
            <a href="javascript:void(0)" rel=".clone" class="add btn btn-sm btn-primary"><i class="fa fa-plus-circle"></i> {{trans('declaration.Add More Container')}}</a>
        </div>
    </div>
    <div class="box-footer clearfix">
        <button class="pull-right btn btn-default" type="submit">{{trans('declaration.Next')}} &raquo;</button>
    </div>
</div>
<script src="{{ url('/') }}/files/js/reCopy.js"></script>
<script>
$(function () {
    var removeLink = '<div class="text-center margin25"><a href="#" onclick="$(this).parent().parent().slideUp(function(){ $(this).remove() }); return false"><i class="fa fa-minus-circle"></i> {{trans("declaration.remove unit")}}</a></div>';
    $('a.add').click(function () {
        var $example = $(".select2").select2();
        $example.select2("destroy");
        setTimeout(function () {
            $(".select2").select2({
                dir: "<?= $field_ar ? 'rtl' : 'ltr' ?>"
            });
        }, 100);
    });
    $('a.add').relCopy({append: removeLink, highestID: "highestID"});
});
</script>
{{BootForm::close()}}
@stop