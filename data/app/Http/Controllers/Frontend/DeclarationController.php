<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Image;
use Illuminate\Support\Facades\Storage;
use \App\Models\ApplicationSteps;
use \App\Models\Applications;

class DeclarationController extends Controller {

    public function __construct() {
        /* if (!Auth::check()) {
          flash(trans('messages.Please login to fill your declaration'))->success();
          return redirect()->route('home');
          } */
        $this->middleware('auth');
    }

    /*
     * step 1 
     */

    public function index() {
        $app_steps = ApplicationSteps::whereNull('waiting_on')->get();
        return view('/frontend/declaration/step1', [
            'app_steps' => $app_steps,
            'current_step' => 1
        ]);
    }

    public function indexPost(Request $request) {
        $rules = ['company_id' => 'required'];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator);
        } else {
            $application = new Applications();
            $application->created_by = Auth::id();
            $application->company_id = $request->input('company_id');
            $application->current_step = 1;
            if ($application->save()) {
                return redirect()->route('declaration.senderDetails', ['id' => $application->id]);
            }
        }
    }

    /*
     * step 2 
     */

    public function senderDetails($id) {
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num == '') {
            $app_steps = ApplicationSteps::whereNull('waiting_on')->get();
            return view('/frontend/declaration/step2', [
                'app_steps' => $app_steps,
                'application' => $application,
                'current_step' => 2
            ]);
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    public function senderDetailsPost(Request $request, $id) {
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num == '') {
            $rules = [
                'sd_consignee_name' => 'required',
                'sd_cus_ref_num' => 'required',
                'sd_vat' => 'required',
                'sd_consignee_address' => 'required',
                'sd_recipient_country' => 'required'
            ];
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator);
            } else {
                $application->sd_consignee_name = $request->input('sd_consignee_name');
                $application->sd_cus_ref_num = $request->input('sd_cus_ref_num');
                $application->sd_vat = $request->input('sd_vat');
                $application->sd_consignee_address = $request->input('sd_consignee_address');
                $application->sd_recipient_country = $request->input('sd_recipient_country');
                $application->sd_recipient_name = $request->input('sd_recipient_name');
                $application->sd_recipient_address = $request->input('sd_recipient_address');
                $application->sd_reg_custom = $request->input('sd_reg_custom');
                $application->current_step = 2;
                if ($application->save()) {
                    return redirect()->route('declaration.consignmentDetails', ['id' => $application->id]);
                }
            }
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    /*
     * step 3
     */

    public function consignmentDetails($id) {
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num == '') {
            $app_steps = ApplicationSteps::whereNull('waiting_on')->get();
            return view('/frontend/declaration/step3', [
                'app_steps' => $app_steps,
                'application' => $application,
                'current_step' => 3
            ]);
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    public function consignmentDetailsPost(Request $request, $id) {
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num == '') {
            $rules = [
                'cn_billing_terms_id' => 'required',
                'cn_cargo_type_id' => 'required'
            ];
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator);
            } else {
                $application->cn_billing_terms_id = $request->input('cn_billing_terms_id');
                $application->cn_cargo_type_id = $request->input('cn_cargo_type_id');
                $application->cn_gross_weight = $request->has('cn_gross_weight') ? $request->input('cn_gross_weight') : NULL;
                $application->cn_comm_num = $request->has('cn_comm_num') ? $request->input('cn_comm_num') : NULL;
                $application->current_step = 3;
                if ($request->cn_hs_code_id && !empty($request->cn_hs_code_id) && $application->save()) {
                    if ($request->cn_hs_code_id) {
                        \App\Models\ApplicationCn::where('application_id', $application->id)->delete();
                        foreach ($request->cn_hs_code_id as $i => $hs) {
                            $app_cn = new \App\Models\ApplicationCn();
                            $app_cn->application_id = $application->id;
                            $app_cn->cn_hs_code_id = $hs;
                            $app_cn->cn_quantity = $request->cn_quantity[$i];
                            $app_cn->cn_unit_price = $request->cn_unit_price[$i] ? $request->cn_unit_price[$i] : NULL;
                            $app_cn->save();
                        }
                    }
                    return redirect()->route('declaration.inspectionDetails', ['id' => $application->id]);
                }
            }
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

}
