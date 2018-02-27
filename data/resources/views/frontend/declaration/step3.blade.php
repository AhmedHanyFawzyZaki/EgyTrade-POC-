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

<h3 class="alert alert-info text-center">{{trans('declaration.Consignment Details')}}</h3>
{{ BootForm::open(['name'=>'step3', 'left_column_offset_class'=>'col-sm-offset-0']) }}
{{ BootForm::hidden('highestID', 0, ['id' => 'highestID']) }}<!-- hidden input used in relcopy-->
<div class="box">
    @include('frontend.declaration.steps-bar', ['app_steps' => $app_steps])
    <div class="box-body">
        <?php
        echo BootForm::select('cn_billing_terms_id', ['html' => trans('declaration.Billing Terms') . ' <span class="required">*</span>'], \App\Models\BillingTerms::pluck('name' . $field_ar, 'id')->prepend(trans('declaration.Please select billing terms'), ''), '', ['class' => 'select2']);
        echo BootForm::select('cn_cargo_type_id', ['html' => trans('declaration.Cargo Type') . ' <span class="required">*</span>'], \App\Models\CargoTypes::pluck('name' . $field_ar, 'id')->prepend(trans('declaration.Please select cargo type'), ''), '', ['class' => 'select2', 'onchange' => 'showHide(this.value)']);
        ?>
        <div id="showHide">
            <?php
            echo BootForm::number('cn_gross_weight', ['html' => trans('declaration.Consignment Gross Weight')]);
            echo BootForm::number('cn_comm_num', ['html' => trans('declaration.Number Of Commodities')]);
            ?>
        </div>
        <div class="well text-center">
            <div class="clone text-left">
                <div class="well col-sm-10">
                    <?php echo BootForm::select('cn_hs_code_id[]', ['html' => trans('declaration.Hs Code') . ' <span class="required">*</span>'], \App\Models\HsCodes::select(DB::raw("CONCAT(hs_desc$field_ar, ' (', hs_code, ')') AS a"), 'id')->pluck('a', 'id')->prepend(trans('declaration.Please select hs code'), ''), '', ['class' => 'select2', 'required' => 'required']); ?>
                    <?php echo BootForm::text('cn_quantity[]', ['html' => trans('declaration.Quantity') . ' <span class="required">*</span>'], '', ['required' => 'required']); ?>
                    <?php echo BootForm::text('cn_unit_price[]', ['html' => trans('declaration.Unit Price')]); ?>
                </div>
            </div>
            <a href="javascript:void(0)" rel=".clone" class="add btn btn-sm btn-primary"><i class="fa fa-plus-circle"></i> {{trans('declaration.Add More HSCODE')}}</a>
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
function showHide(val) {
    if (val == 2) {
        $('#showHide').show();
    } else {
        $('#showHide').hide();
    }
}
</script>
{{BootForm::close()}}
@stop