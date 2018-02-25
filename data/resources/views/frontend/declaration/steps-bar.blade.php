@if ($app_steps)
<div class="box-header">
    <div class="stepwizard">
        <div class="stepwizard-row">
            @foreach ($app_steps as $i => $app_step) 
            <div class="stepwizard-step">
                <button type="button" class="btn btn-default btn-circle {{$app_step->getStepColor($current_step)}}">{{$i+1}}</button>
                <p>{{$app_step->getFieldTranslation('name', 'name'.$field_ar)}}</p>
            </div> 
            @endforeach
        </div>
    </div>
</div>
<hr>
@endif