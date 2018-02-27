<?php

/*
  |--------------------------------------------------------------------------
  | Web Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register web routes for your application. These
  | routes are loaded by the RouteServiceProvider within a group which
  | contains the "web" middleware group. Now create something great!
  |
 * Route::get('/', function () {
  return view('welcome');
  });
 */


/** FrontEnd routes * */
Route::group(['namespace' => 'Frontend', 'middleware' => 'setLocale'], function () {
    // Controllers Within The "App\Http\Controllers\Frontend" Namespace
    Route::get('/', [
        'uses' => 'HomeController@index',
        'as' => 'landingPage'
    ]);
    Route::get('/home', [
        'uses' => 'HomeController@home',
        'as' => 'home'
    ]);
    Route::get('/services', [
        'uses' => 'HomeController@services',
        'as' => 'home.services'
    ]);

    /**
     * declaration controller
     */
    /**
     * step 1
     */
    Route::get('/declaration', [
        'uses' => 'DeclarationController@index',
        'as' => 'declaration.index'
    ]);
    Route::post('/declaration', [
        'uses' => 'DeclarationController@indexPost',
        'as' => 'declaration.indexPost'
    ]);

    /**
     * step 2
     */
    Route::get('/declaration/senderDetails/{id}', [
        'uses' => 'DeclarationController@senderDetails',
        'as' => 'declaration.senderDetails'
    ]);
    Route::post('/declaration/senderDetails/{id}', [
        'uses' => 'DeclarationController@senderDetailsPost',
        'as' => 'declaration.senderDetailsPost'
    ]);

    /**
     * step 3
     */
    Route::get('/declaration/consignmentDetails/{id}', [
        'uses' => 'DeclarationController@consignmentDetails',
        'as' => 'declaration.consignmentDetails'
    ]);
    Route::post('/declaration/consignmentDetails/{id}', [
        'uses' => 'DeclarationController@consignmentDetailsPost',
        'as' => 'declaration.consignmentDetailsPost'
    ]);

    /**
     * step 4
     */
    Route::get('/declaration/inspectionDetails/{id}', [
        'uses' => 'DeclarationController@inspectionDetails',
        'as' => 'declaration.inspectionDetails'
    ]);
    Route::post('/declaration/inspectionDetails/{id}', [
        'uses' => 'DeclarationController@inspectionDetailsPost',
        'as' => 'declaration.inspectionDetailsPost'
    ]);

    /**
     * step 5
     */
    Route::get('/declaration/originDetails/{id}', [
        'uses' => 'DeclarationController@originDetails',
        'as' => 'declaration.originDetails'
    ]);
    Route::post('/declaration/originDetails/{id}', [
        'uses' => 'DeclarationController@originDetailsPost',
        'as' => 'declaration.originDetailsPost'
    ]);

    /**
     * step 6
     */
    Route::get('/declaration/ecdAttachment/{id}', [
        'uses' => 'DeclarationController@ecdAttachment',
        'as' => 'declaration.ecdAttachment'
    ]);
    Route::post('/declaration/ecdAttachment/{id}', [
        'uses' => 'DeclarationController@ecdAttachmentPost',
        'as' => 'declaration.ecdAttachmentPost'
    ]);

    /**
     * applications state
     */
    Route::get('/declaration/applicationState', [
        'uses' => 'DeclarationController@applicationState',
        'as' => 'declaration.applicationState'
    ]);
    Route::post('/declaration/applicationState', [
        'uses' => 'DeclarationController@applicationStatePost',
        'as' => 'declaration.applicationStatePost'
    ]);

    /**
     * ecdShipping controller
     */
    /**
     * applications state
     */
    Route::get('/ecdShipping/applicationState', [
        'uses' => 'EcdShippingController@applicationState',
        'as' => 'ecdShipping.applicationState'
    ]);
    Route::post('/ecdShipping/applicationState', [
        'uses' => 'EcdShippingController@applicationStatePost',
        'as' => 'ecdShipping.applicationStatePost'
    ]);
    /**
     * ecd Shipping
     */
    /**
     * step 7
     */
    Route::get('/ecdShipping/containerDetails/{id}', [
        'uses' => 'EcdShippingController@containerDetails',
        'as' => 'ecdShipping.containerDetails'
    ]);
    Route::post('/ecdShipping/containerDetails/{id}', [
        'uses' => 'EcdShippingController@containerDetailsPost',
        'as' => 'ecdShipping.containerDetailsPost'
    ]);

    /**
     * step 8
     */
    Route::get('/ecdShipping/transportationDetails/{id}', [
        'uses' => 'EcdShippingController@transportationDetails',
        'as' => 'ecdShipping.transportationDetails'
    ]);
    Route::post('/ecdShipping/transportationDetails/{id}', [
        'uses' => 'EcdShippingController@transportationDetailsPost',
        'as' => 'ecdShipping.transportationDetailsPost'
    ]);

    /**
     * step 9
     */
    Route::get('/ecdShipping/freightDetails/{id}', [
        'uses' => 'EcdShippingController@freightDetails',
        'as' => 'ecdShipping.freightDetails'
    ]);
    Route::post('/ecdShipping/freightDetails/{id}', [
        'uses' => 'EcdShippingController@freightDetailsPost',
        'as' => 'ecdShipping.freightDetailsPost'
    ]);

    /**
     * step 10
     */
    Route::get('/ecdShipping/packagingDetails/{id}', [
        'uses' => 'EcdShippingController@packagingDetails',
        'as' => 'ecdShipping.packagingDetails'
    ]);
    Route::post('/ecdShipping/packagingDetails/{id}', [
        'uses' => 'EcdShippingController@packagingDetailsPost',
        'as' => 'ecdShipping.packagingDetailsPost'
    ]);
    /**
     * step 11
     */
    Route::get('/ecdShipping/attachmentDetails/{id}', [
        'uses' => 'EcdShippingController@attachmentDetails',
        'as' => 'ecdShipping.attachmentDetails'
    ]);
    Route::post('/ecdShipping/attachmentDetails/{id}', [
        'uses' => 'EcdShippingController@attachmentDetailsPost',
        'as' => 'ecdShipping.attachmentDetailsPost'
    ]);
});


/* * ************************************************************************************** */
/* * ************************************************************************************** */
/* * ************************************************************************************** */

/** BackEnd routes * */
Route::group(['namespace' => 'Backend', 'middleware' => ['setLocale', 'auth']], function () {
    // Controllers Within The "App\Http\Controllers\Frontend" Namespace
    Route::get('/dashboard', [
        'uses' => 'HomeController@index',
        'as' => 'dashboard'
    ]);

    Route::get('/dashboard/alert', function () {
        return redirect()->route('Dashboard')->with('info', 'Done');
    });

    Route::resource('users', 'UserController');
    Route::post('/users/{id}/changePassword', [
        'uses' => 'UserController@changePassword',
        'as' => 'users.password'
    ]);
});

/* * ************************************************************************************** */
/* * ************************************************************************************** */
/* * ************************************************************************************** */
/*
 * localization
 */

Route::get('language/{locale}', function ($locale) {
    //$this->validate($request, ['locale' => 'required|in:fr,en']);

    Session::put('locale', $locale);

    return redirect()->route('home');
});

/*
 * owner image
 */
Route::get('/ecdFile/{filename}', function ($filename) {
    $path = storage_path() . '/app/public/images/ecd/' . $filename;

    if (!File::exists($path))
        abort(404);

    $file = File::get($path);
    $type = File::mimeType($path);

    $response = Response::make($file, 200);
    $response->header("Content-Type", $type);
    return $response;
})->name('ecd');

/* * ************************************************************************************** */
/* * ************************************************************************************** */
/* * ************************************************************************************** */
/** Auth routes * */
Route::group(['namespace' => 'Auth', 'middleware' => 'setLocale'], function () {
    // Controllers Within The "App\Http\Controllers\Frontend" Namespace
    Route::get('/login', [
        'uses' => 'LoginController@index',
        'as' => 'auth.login'
    ]);
    Route::post('/login', [
        'uses' => 'LoginController@login',
        'as' => 'auth.validateLogin'
    ]);
    Route::post('/loginAjax', [
        'uses' => 'LoginController@loginAjax',
        'as' => 'auth.loginAjax'
    ]);
    Route::post('/registerAjax', [
        'uses' => 'RegisterController@registerAjax',
        'as' => 'auth.registerAjax'
    ]);
    Route::get('/activate', [
        'uses' => 'RegisterController@activate',
        'as' => 'auth.activate'
    ]);
    Route::post('/forgot', [
        'uses' => 'ForgotController@postForgot',
        'as' => 'auth.forgot'
    ]);
    Route::get('/resetPassword', [
        'uses' => 'ForgotController@resetPassword',
        'as' => 'auth.resetPassword'
    ]);
    Route::post('/resetPassword', [
        'uses' => 'ForgotController@changePassword',
        'as' => 'auth.changePassword'
    ]);
    Route::get('/logout', [
        'uses' => 'LoginController@logout',
        'as' => 'auth.logout'
    ]);
});




/**
  Web Services test
 */
Route::group(['middleware' => ['auth']], function () {
    Route::get('test', function() {
        // Display
        dd(\App\Models\Applications::with(['application_cns', 'application_crs', 'application_pxs'])->limit(10)->get()->toArray());
        $arr = [];
        foreach (\Schema::getColumnListing('applications') as $f)
            $arr[$f] = '';
        dd(str_replace("\\n", "", var_export($arr, true)));
        dd("End");
    });


    Route::get('test/wbs_send_app/{app_id}', function($app_id = null) {
        $model = null;
        $model = \App\Models\Applications::find($app_id);
        dump('Working with APP_ID = ' . $model->id);
        dump('With DID = ' . $model->did_num);
        //    dump($model->toArray());
        $model->apiSendAppRequest();
        dd("End");
    })->where(['app_id' => '[0-9]+']);

    Route::get('test/wbs_update_app_status/{did}/{notif_status_id}', function($did, $notif_status_id) {
        $app = new \App\Models\Applications();
        $app->apiUpdateAppStatusRequest($did, $notif_status_id);
        dd("End");
    })->where(['did' => '[0-9]+', 'notif_status_id' => '[0-9]+']);



    Route::get('/notifications', function() {
        return view('notifications');
    });
    Route::get('/notifications-ajax', function() {
        $result = \App\Models\ApplicationNotifications::whereHas('applications', function($q) {
                    $q->where('created_by', auth()->user()->id);
                })->where('seen', 0)->orderBy('created_at')->get();
        return response()->json([
                    'success' => true,
                    'result' => $result
        ]);
    });

    Route::get('/update-notifications-ajax/{id}', function($id) {
        \App\Models\ApplicationNotifications::where('id', $id)
                ->update(['seen' => 1]);
        return response()->json(['success' => true]);
    });

    Route::get('/main-notifications-ajax', function() {
        $result = \App\Models\ApplicationNotifications::whereHas('applications', function($q) {
                    $q->where('created_by', auth()->user()->id);
                })->where('seen', 0)->orderBy('created_at')->get();
        return response()->json([
                    'success' => true,
                    'result' => $result
        ]);
    });
});
