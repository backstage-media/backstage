<?php

namespace App\Http\Controllers;

use App\Models\Creator;
use App\Models\Manager;
use App\Models\User;
use App\Models\Role;

class UserController extends Controller
{

    public function get_user_from_creator(Creator $creator){
        $role = Role::Where('creator_id',$creator->id);
        $user = User::Where('role_id',$role->id);
        return $user;
    }

    public function get_user_from_manager(Manager $manager){
        $role = Role::Where('manager_id',$manager->id)->first();
        $user = User::Where('role_id',$role->id)->first();
        return $user;
    }

    public function get_user_from_id($id){
        return User::find($id);
    }
}
