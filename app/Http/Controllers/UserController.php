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
        //If you don't have permissions for this, redirect to the dashboard.
        if($profile == 3){
        return view('admin/users')->with('users',$users);
        }else{
        return view('dashboard');
        }
    }

    public function admin_profiles(Request $request){
        $creators = [];
        $managers = [];

        $profiles = Role::with("creator","manager")->where('creator_id','!=',null)->orWhere('manager_id','!=',null)->get();

        $profiles->each(function($user) use (&$creators, &$managers) {
            $user_type = $user->user_type_id;
            if($user_type == 1){
                array_push($creators, $user->creator); 
            }else if($user_type == 2){
                array_push($managers, $user->manager); 
            }
        });

        return view('admin/profiles')->with(['creators'=>$creators,'managers'=>$managers]);
    }
    
    // Edit user on the database based on POST values.
    public function edit(Request $request){
        $user_id = $request->post('user_id');
        $new_name = $request->post('name');
        $new_email = $request->post('email');
        $user = User::find($user_id);
        $user->name = $new_name;
        $user->email = $new_email;
        $user->save();

        return $user->id;
    }

    // Edit user on the database based on POST values.
    public function delete(Request $request){
        $user_id = $request->post('user_id');
        $user = User::find($user_id);
        $user->delete();
        //return $user->id;
    }


}
 