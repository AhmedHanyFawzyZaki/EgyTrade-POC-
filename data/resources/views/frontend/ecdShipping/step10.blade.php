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
  <li class="active">{{trans('declaration.Packaging Details')}}</li>
</ol>
{{ BootForm::open(['name'=>'step10', 'left_column_offset_class'=>'col-sm-offset-0']) }}
{{ BootForm::hidden('highestID', 0, ['id' => 'highestID']) }}<!-- hidden input used in relcopy-->
<div class="box">
    @include('frontend.declaration.steps-bar', ['app_steps' => $app_steps])
    <div class="box-body">
        <div class="well text-center">
            @if($apps_cn)
            @foreach($apps_cn as $ap)
            <div class="clone text-left">
                <div class="well col-sm-10">
                    <?php echo BootForm::hidden('application_cn_id[]', $ap->id); ?>
                    <?php echo BootForm::text('hs_code[]', ['html' => trans('declaration.Hs Code')], $ap->getHsCode->hs_desc_ar . ' (' . $ap->getHsCode->hs_code . ')', ['readonly' => 'readonly']); ?>
                    <?php echo BootForm::text('px_weight[]', ['html' => trans('declaration.Pack Weight') . ' <span class="required">*</span>'], '', ['required' => 'required']); ?>
                    <?php echo BootForm::text('px_num[]', ['html' => trans('declaration.Pack Numbers') . ' <span class="required">*</span>'], '', ['required' => 'required']); ?>
                    <?php echo BootForm::select('px_type[]', ['html' => trans('declaration.Pack Type') . ' <span class="required">*</span>'], \App\Models\PxTypes::pluck('name' . $field_ar, 'id')->prepend(trans('declaration.Please select pack type'), ''), '', ['class' => 'select2', 'required' => 'required']); ?>
                </div>
            </div>
            @endforeach
            @endif
    <!--<a href="javascript:void(0)" rel=".clone" class="add btn btn-sm btn-primary"><i class="fa fa-plus-circle"></i> {{trans('declaration.Add More Pack')}}</a>-->
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