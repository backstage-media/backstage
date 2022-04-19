<?php

namespace App\Http\Controllers;

use App\Models\Creator;
use App\Models\Manager;
use App\Models\User;
use App\Models\Role;
use Illuminate\Http\Request;

class UserController extends Controller
{

    public function get_user_from_creator(Creator $creator){
        $role = Role::Where('creator_id',$creator->id)->first();
        $user = User::Where('role_id',$role->id)->first();
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

    public function get_manager_from_user($id){
        $user = User::find($id);
        $role = $user->role;
        $profile = $role->manager;

        return $profile;
    }

    public function get_creator_from_user($id){
        $user = User::find($id);
        $role = $user->role;
        $profile = $role->creator;

        return $profile;
    }

    public function admin_users(Request $request){
        $users = User::with("role.user_type")->get();
        $profile = $request->session()->get('profile_type');
        if($profile == 3){
        return view('admin/users')->with('users',$users);
        }else{
        return view('dashboard');
        }
    }

    public function admin_profiles(Request $request){
        $profiles = Role::with("Profile")->get();
        return view('admin/profiles')->with('profiles',$profiles);
    }
}
