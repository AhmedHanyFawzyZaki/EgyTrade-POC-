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

class EcdShippingController extends Controller {

    public function __construct() {
        $this->middleware('auth');
    }

    /**
     * application state
     */
    public function applicationState() {
        return view('/frontend/ecdShipping/search');
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
                    ->whereNull('sad_num')
                    ->first();
            if ($application) {
                return redirect()->route('ecdShipping.containerDetails', ['id' => $application->id]);
            } else {
                flash(trans('declaration.Wrong (DID) number'))->error();
                return redirect()->back();
            }
        }
    }

    /**
     * step 7
     */
    public function containerDetails($id) {
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num != '') {
            if ($application->cn_cargo_type_id == 2) {
                $application->current_step = 7;
                $application->save();
                return redirect()->route('ecdShipping.transportationDetails', ['id' => $application->id]);
            } else {
                $app_steps = ApplicationSteps::all();
                return view('/frontend/ecdShipping/step7', [
                    'app_steps' => $app_steps,
                    'application' => $application,
                    'current_step' => 7
                ]);
            }
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    public function containerDetailsPost(Request $request, $id) {
        $request->flash(); //save the input before redirect
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num != '') {
            $rules = [
            ];
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator);
            } else {
                $application->current_step = 7;
                if ($application->save()) {
                    if ($request->cr_num && !empty($request->cr_num)) {
                        if ($request->cr_num) {
                            \App\Models\ApplicationCr::where('application_id', $application->id)->delete();
                            foreach ($request->cr_num as $i => $cr) {
                                $app_cr = new \App\Models\ApplicationCr();
                                $app_cr->application_id = $application->id;
                                $app_cr->cr_num = $cr;
                                $app_cr->save();
                            }
                        }
                    }
                    return redirect()->route('ecdShipping.transportationDetails', ['id' => $application->id]);
                }
            }
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    public function getContainerNumberDetails(Request $request) {
        $contNum = $request->input('contNum');
        $field = $request->input('field');
        $model = \App\Models\ContainerNumbers::where('id', $contNum)->first();
        $msg = 0;
        if ($model) {
            $msg = 1;
            return [
                'msg' => $msg,
                'owner' => $model->getOwner->$field,
                'capacity' => $model->getCapacity->$field,
                'type' => $model->getType->$field
            ];
        }
        return ['msg' => $msg];
    }

    /**
     * step 8
     */
    public function transportationDetails($id) {
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num != '') {
            $app_steps = ApplicationSteps::all();
            return view('/frontend/ecdShipping/step8', [
                'app_steps' => $app_steps,
                'application' => $application,
                'current_step' => 8
            ]);
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    public function transportationDetailsPost(Request $request, $id) {
        $request->flash(); //save the input before redirect
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num != '') {
            $rules = [
                'td_car_license' => 'required',
                'td_driver_license' => 'required',
                'td_driver_name' => 'required',
                'td_car_total_weight' => 'required',
                'td_car_net_weight' => 'required'
            ];
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator);
            } else {
                $application->current_step = 8;
                $application->td_car_license = $request->input('td_car_license');
                $application->td_driver_license = $request->input('td_driver_license');
                $application->td_driver_name = $request->input('td_driver_name');
                $application->td_car_total_weight = $request->input('td_car_total_weight');
                $application->td_car_net_weight = $request->input('td_car_net_weight');
                if ($application->save()) {
                    return redirect()->route('ecdShipping.freightDetails', ['id' => $application->id]);
                }
            }
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    /**
     * step 9
     */
    public function freightDetails($id) {
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num != '') {
            $app_steps = ApplicationSteps::all();
            return view('/frontend/ecdShipping/step9', [
                'app_steps' => $app_steps,
                'application' => $application,
                'current_step' => 9
            ]);
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    public function freightDetailsPost(Request $request, $id) {
        $request->flash(); //save the input before redirect
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num != '') {
            $rules = [
                'fd_bill_num' => 'required',
                'fd_shipping_port' => 'required',
                'fd_final_dest' => 'required',
                'fd_expected_arr_date' => 'required',
                'fd_trip_num' => 'required',
                'fd_forwarder_name' => 'required'
            ];
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator);
            } else {
                $application->current_step = 9;
                $application->fd_bill_num = $request->input('fd_bill_num');
                $application->fd_shipping_port = $request->input('fd_shipping_port');
                $application->fd_final_dest = $request->input('fd_final_dest');
                $application->fd_expected_arr_date = $request->input('fd_expected_arr_date');
                $application->fd_trip_num = $request->input('fd_trip_num');
                $application->fd_forwarder_name = $request->input('fd_forwarder_name');

                $application->fd_vessel_name = $request->input('fd_vessel_name') ? $request->input('fd_vessel_name') : NULL;
                $application->fd_call_sign = $request->input('fd_call_sign') ? $request->input('fd_call_sign') : NULL;
                $application->fd_imo_num = $request->input('fd_imo_num') ? $request->input('fd_imo_num') : NULL;
                $application->fd_total_weight = $request->input('fd_total_weight') ? $request->input('fd_total_weight') : NULL;
                $application->fd_net_weight = $request->input('fd_net_weight') ? $request->input('fd_net_weight') : NULL;
                $application->fd_fr_line_id = $request->input('fd_fr_line_id') ? $request->input('fd_fr_line_id') : NULL;
                $application->fd_shippment_date = $request->input('fd_shippment_date') ? $request->input('fd_shippment_date') : NULL;
                $application->fd_forwarder_address = $request->input('fd_forwarder_address') ? $request->input('fd_forwarder_address') : NULL;
                $application->fd_agent_name = $request->input('fd_agent_name') ? $request->input('fd_agent_name') : NULL;
                $application->fd_agent_address = $request->input('fd_agent_address') ? $request->input('fd_agent_address') : NULL;
                if ($application->save()) {
                    return redirect()->route('ecdShipping.packagingDetails', ['id' => $application->id]);
                }
            }
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    /**
     * step 10
     */
    public function packagingDetails($id) {
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num != '') {
            $app_steps = ApplicationSteps::all();
            $apps_cn = \App\Models\ApplicationCn::where('application_id', $application->id)->get();
            return view('/frontend/ecdShipping/step10', [
                'app_steps' => $app_steps,
                'application' => $application,
                'current_step' => 10,
                'apps_cn' => $apps_cn
            ]);
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    public function packagingDetailsPost(Request $request, $id) {
        $request->flash(); //save the input before redirect
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num != '') {
            $rules = [
            ];
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator);
            } else {
                $application->current_step = 10;
                if ($request->px_type && !empty($request->px_type) && $application->save()) {
                    if ($request->px_type) {
                        \App\Models\ApplicationPx::where('application_id', $application->id)->delete();
                        foreach ($request->px_type as $i => $px) {
                            $app_px = new \App\Models\ApplicationPx();
                            $app_px->application_id = $application->id;
                            $app_px->px_type_id = $px;
                            $app_px->px_num = $request->px_num[$i];
                            $app_px->px_weight = $request->px_weight[$i];
                            $app_px->application_cn_id = $request->application_cn_id[$i];
                            $app_px->save();
                        }
                    }
                    return redirect()->route('ecdShipping.attachmentDetails', ['id' => $application->id]);
                }
            }
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    /**
     * step 11
     */
    public function attachmentDetails($id) {
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num != '') {
            $app_steps = ApplicationSteps::all();
            return view('/frontend/ecdShipping/step11', [
                'app_steps' => $app_steps,
                'application' => $application,
                'current_step' => 11
            ]);
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

    public function attachmentDetailsPost(Request $request, $id) {
        $request->flash(); //save the input before redirect
        $application = Applications::find($id);
        if ($application && $application->created_by == Auth::id() && $application->did_num != '') {
            $rules = [
                'att_ini_shippment' => 'required',
                'att_pack' => 'required'
            ];
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator);
            } else {
                if ($request->hasFile('att_ini_shippment')) {
                    $image = $request->file('att_ini_shippment');
                    $fileName = $application->id . '-ini_shippment-' . time() . rand(1, 100) . '.' . $image->getClientOriginalExtension();

                    $img = Image::make($image->getRealPath());
                    /* $img->resize(120, 120, function ($constraint) {
                      $constraint->aspectRatio();
                      }); */

                    $img->stream();
                    Storage::disk('public')->put('images/ecd/' . $fileName, $img);
                    $application->att_ini_shippment = $fileName;
                }
                if ($request->hasFile('att_pack')) {
                    $image = $request->file('att_pack');
                    $fileName = $application->id . '-pack-' . time() . rand(1, 100) . '.' . $image->getClientOriginalExtension();

                    $img = Image::make($image->getRealPath());

                    $img->stream();
                    Storage::disk('public')->put('images/ecd/' . $fileName, $img);
                    $application->att_pack = $fileName;
                }
                /**
                 * create sad num here
                 */
                $application->sad_num = rand(100000, 999999);
                $application->current_step = 11;
                if ($application->save()) {
                    $application->apiSendAppRequest();
                    //flash(trans('declaration.ECD Application has been completed successfully and your "SAD Number" is: ', ['sad_num' => $application->sad_num]))->success();
                    return redirect()->route('home');
                }
            }
        } else {
            flash(trans('declaration.Wrong Request'))->error();
            return redirect()->route('home');
        }
    }

}
