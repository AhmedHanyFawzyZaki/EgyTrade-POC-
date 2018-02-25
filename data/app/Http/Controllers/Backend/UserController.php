<?php

namespace App\Http\Controllers\Backend;

//use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index() {
        $users = User::orderBy('id', 'desc')->paginate(10);

        return view('backend.users.index', compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create() {
        $user = new User();
        return view('backend.users.create', compact('user'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request) {
        $user = new User();
        $request->flash(); //save the input before redirect

        $validator = Validator::make($request->all(), array_merge($user->rules, $user->passwordRule));
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator);
        } else {
            $user->email = $request->input("email");
            $user->password = $request->input("password");
            $user->active = $request->input("active");
            $user->user_type_id = $request->input("user_type_id");

            $user->save();

            return redirect()->route('users.index')->with('message', 'Item created successfully.');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id) {
        $user = User::findOrFail($id);

        return view('backend.users.show', compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id) {
        $user = User::findOrFail($id);

        return view('backend.users.edit', compact('user'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @param Request $request
     * @return Response
     */
    public function update(Request $request, $id) {
        $user = User::findOrFail($id);
        $request->flash(); //save the input before redirect
        $validator = Validator::make($request->all(), $user->rules);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator);
        } else {
            $user->email = $request->input("email");
            $user->active = $request->input("active");
            $user->user_type_id = $request->input("user_type_id");

            $user->save();

            return redirect()->route('users.index')->with('message', 'Item updated successfully.');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id) {
        $user = User::findOrFail($id);
        $user->delete();

        return redirect()->route('users.index')->with('message', 'Item deleted successfully.');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @param Request $request
     * @return Response
     */
    public function changePassword(Request $request, $id) {
        $user = User::findOrFail($id);
        $request->flash(); //save the input before redirect
        $validator = Validator::make($request->all(), $user->passwordRule);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator);
        } else {
            $user->password = $request->input("password");

            $user->save();

            return redirect()->route('users.index')->with('message', 'Item updated successfully.');
        }
    }

}
