<?php

namespace App\Http\Controllers;

use App\Models\Role;


class FindContentManagerController extends Controller
{
    public function index()
    {
        $users = array();

        $roles = Role::with('user','manager')->where('user_type_id', 2)->get();

        foreach ($roles as $role) {
            // Force the agreements to be populated at the user.
            $role->manager->agreement;
            array_push($users, $role);       
        }
        return view('findmanagers')->with('managers', $users);
    }
}
