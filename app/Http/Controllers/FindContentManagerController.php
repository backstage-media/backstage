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
            array_push($users, $role->user);
            $manager = $role->manager;
            echo $manager;            
        }
        return view('findmanagers')->with('managers', $users);
    }
}
