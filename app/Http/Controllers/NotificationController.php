<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use Illuminate\Http\Request;
use App\Http\Controllers\UserController;

class NotificationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Notification  $notification
     * @return \Illuminate\Http\Response
     */
    public function send(Notification $notification)
    {
        $notification->from()->save();
        $notification->to()->save();
    }

    public function list_received(Request $request)
    {
        $notifications = [];
        $user_type = $request->session()->get('profile_type');
        $user_id = $request->user()->id;

        if ($user_type == 2) {
            $notifications = Notification::with('from_user.role.creator', 'notification_type')->where([
                ['to_user', '=', $user_id],
                ['read', false]
            ])->get();
        } else if ($user_type == 1) {
            $notifications = Notification::with('from_user.role.manager', 'notification_type')->where([
                ['to_user', '=', $user_id],
                ['read', false]
            ])->get();
        }

        //print("<pre>" . print_r($notifications, true) . "</pre>");

        return view('notifications')->with('notifications',$notifications);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Notification  $notification
     * @return \Illuminate\Http\Response
     */
    public function edit(Notification $notification)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Notification  $notification
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Notification $notification)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Notification  $notification
     * @return \Illuminate\Http\Response
     */
    public function destroy(Notification $notification)
    {
        //
    }
}
