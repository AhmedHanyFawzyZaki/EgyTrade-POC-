<div class="modal" id="forgotModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                <h4 class="modal-title">{{trans('messages.Forgot Password')}}</h4>
            </div>
            {{ BootForm::open(['url'=>route('auth.forgot'), 'left_column_class' => 'col-md-3 col-sm-4', 'right_column_class' => 'col-md-9 col-sm-8']) }}
            <div class="modal-body">
                <?php
                echo BootForm::text('email', ['html' => trans('messages.Email') . ' <span class="required">*</span>'], '', ['required' => 'required']);
                ?>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal" data-toggle="modal" data-target="#loginModal">{{trans('messages.Login')}}</button>
                <button type="submit" class="btn btn-primary">{{trans('messages.Reset')}}</button>
            </div>
            {{ BootForm::close() }}
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->