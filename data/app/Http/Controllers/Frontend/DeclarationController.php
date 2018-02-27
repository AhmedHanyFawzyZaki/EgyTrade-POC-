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

    /**
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
        $request->flash(); //save the input before redirect
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

    /**
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
        $request->flash(); //save the input before redirect
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num == '') {
            $rules = [
                'sd_consignee_name' => 'required',
                'sd_cus_ref_num' => 'required',
                'sd_vat' => 'required',
                'sd_consignee_address' => 'required',
                'sd_recipient_country' => 'required',
                'sd_reg_custom' => 'required',
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

    /**
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
        $request->flash(); //save the input before redirect
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

    /**
     * step 4
     */
    public function inspectionDetails($id) {
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num == '') {
            $app_steps = ApplicationSteps::whereNull('waiting_on')->get();
            return view('/frontend/declaration/step4', [
                'app_steps' => $app_steps,
                'application' => $application,
                'current_step' => 4
            ]);
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    public function inspectionDetailsPost(Request $request, $id) {
        $request->flash(); //save the input before redirect
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num == '') {
            $rules = [
                'ir_inspection_loc' => 'required',
                'ir_inspection_date' => 'required',
                'ir_inspection_address' => 'required'
            ];
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator);
            } else {
                $application->ir_inspection_loc = $request->input('ir_inspection_loc');
                $application->ir_inspection_date = $request->input('ir_inspection_date');
                $application->ir_inspection_address = $request->input('ir_inspection_address');
                $application->current_step = 4;
                if ($application->save()) {
                    return redirect()->route('declaration.originDetails', ['id' => $application->id]);
                }
            }
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    /**
     * step 5
     */
    public function originDetails($id) {
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num == '') {
            $app_steps = ApplicationSteps::whereNull('waiting_on')->get();
            return view('/frontend/declaration/step5', [
                'app_steps' => $app_steps,
                'application' => $application,
                'current_step' => 5
            ]);
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    public function originDetailsPost(Request $request, $id) {
        $request->flash(); //save the input before redirect
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num == '') {
            $rules = [
                'od_country' => 'required'
            ];
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator);
            } else {
                $application->od_country = $request->input('od_country');
                $application->current_step = 5;
                if ($application->save()) {
                    return redirect()->route('declaration.ecdAttachment', ['id' => $application->id]);
                }
            }
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    /**
     * step 6
     */
    public function ecdAttachment($id) {
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num == '') {
            $app_steps = ApplicationSteps::whereNull('waiting_on')->get();
            return view('/frontend/declaration/step6', [
                'app_steps' => $app_steps,
                'application' => $application,
                'current_step' => 6
            ]);
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    public function ecdAttachmentPost(Request $request, $id) {
        $request->flash(); //save the input before redirect
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num == '') {
            $rules = [
                'att_agreement' => 'required',
                'att_ecd_invoice' => 'required'
            ];
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator);
            } else {
                if ($request->hasFile('att_agreement')) {
                    $image = $request->file('att_agreement');
                    $fileName = $application->id . '-agreement-' . time() . rand(1, 100) . '.' . $image->getClientOriginalExtension();

                    $img = Image::make($image->getRealPath());
                    /* $img->resize(120, 120, function ($constraint) {
                      $constraint->aspectRatio();
                      }); */

                    $img->stream();
                    Storage::disk('public')->put('images/ecd/' . $fileName, $img);
                    $application->att_agreement = $fileName;
                }
                if ($request->hasFile('att_ecd_invoice')) {
                    $image = $request->file('att_ecd_invoice');
                    $fileName = $application->id . '-invoice-' . time() . rand(1, 100) . '.' . $image->getClientOriginalExtension();

                    $img = Image::make($image->getRealPath());

                    $img->stream();
                    Storage::disk('public')->put('images/ecd/' . $fileName, $img);
                    $application->att_ecd_invoice = $fileName;
                }
                /**
                 * create did num here
                 */
                $application->did_num = rand(100000, 999999);
                $application->current_step = 6;
                if ($application->save()) {
                    flash(trans('declaration.ECD application has been submitted successfully and your "DID Number" is: ', ['did_num' => $application->did_num]))->success();
                    return redirect()->route('home');
                }
            }
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    /**
     * application state
     */
    public function applicationState() {
        return view('/frontend/declaration/search', ['app_steps' => '', 'current_step' => '']);
    }

    public function applicationStatePost(Request $request) {
        $request->flash(); //save the input before redirect
        $rules = [
            'app_num' => 'required'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator);
        } else {
            $application = Applications::where('did_num', $request->input('app_num'))
                    ->orWhere('sad_num', $request->input('app_num'))
                    ->first();
            if ($application) {
                $app_steps = ApplicationSteps::all();
                return view('/frontend/declaration/search', [
                    'app_steps' => $app_steps,
                    'current_step' => $application->current_step + 1 //which means the next step
                ]);
            } else {
                flash(trans('declaration.Wrong (DID or SAD) number'))->error();
                return redirect()->back();
            }
        }
    }

}
