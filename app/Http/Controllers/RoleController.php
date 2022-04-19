<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class RoleController extends Controller
{
    //Let's stablish the user type for the entire session under a global Controller.
    public function initialize(Request $request)
    {
        $id = $request->user()->id;
        $user = User::find($id);
        // Bring the FK until I obtain the Manager object
        $user_type = $user->role->user_type_id;
        $profile ="";
        if ($user_type == 1) {
            $profile = $user->role->creator;
        } else if ($user_type == 2) {
            $profile = $user->role->manager;
        } else if ($user_type == 3) {
            $profile = $user;
        }  
        $request->session()->put("profile_type", $user_type);
        $request->session()->put("profile", $profile);
    }
}
