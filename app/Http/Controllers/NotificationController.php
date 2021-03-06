<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use Illuminate\Http\Request;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Http;

class NotificationController extends Controller
{

    /**
     * Enviar notificacion al usuario.
     *
     * @param  \App\Models\Notification  $notification
     * 
     */
    public function send(Notification $notification)
    {
        $notification->from()->save();
        $notification->to()->save();
    }

    /**
     * Listar todas las notificaciones recibidas que esten en estado "No leido"
     *  @param  \Illuminate\Http\Request
     *  @return \Illuminate\Http\View
     */

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

        return view('notifications')->with('notifications', $notifications);
    }

    /**
     * Llevar al usuario a la notificacion en concreto y marcarla como vista.
     *  @param  \Illuminate\Http\Request
     *  
     */

    public function mark_read(Request $request)
    {
        $notification_id = $request->id;

        $notification = Notification::find($notification_id);
        $notification->read = true;
        $notification->save();
        // Si el usuario es gestor de contenidos.
    }
}
