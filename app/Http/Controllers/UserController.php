<?php

namespace App\Http\Controllers;

use App\Models\Creator;
use App\Models\Manager;
use App\Models\User;
use App\Models\Role;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\Registered;

class UserController extends Controller
{
    /**
     * Clase para gestionar los Usuarios de la plataforma. Tal y como esta planteado el modelo de roles y usuarios. 
     * Esta clase se encarga de facilitar mediante funciones la gestion en ese aspecto.
     * 
     * Por hacer un pequeño recordatorio desde este Controlador, la relacion funciona de la siguiente manera.
     * 
     * Usuario ---> Role ----> Creador de contenido/Administrador de contenido/Administrador de la plataforma
     */

    /**
     * Obtener el Usuario consultando por el perfil del Creador de contenido
     *
     * @return \App\Models\User
     * @param \App\Models\Creator
     * 
     */

    public function get_user_from_creator(Creator $creator)
    {
        $role = Role::Where('creator_id', $creator->id)->first();
        $user = User::Where('role_id', $role->id)->first();
        return $user;
    }

    /**
     * Obtener el Usuario consultando por el perfil del Administrador de contenido. 
     *
     * @return \App\Models\User
     * @param \App\Models\Creator
     * 
     */

    public function get_user_from_manager(Manager $manager)
    {
        $role = Role::Where('manager_id', $manager->id)->first();
        $user = User::Where('role_id', $role->id)->first();
        return $user;
    }

    /**
     * Obtener el Usuario consultando por el ID de usuario.
     *
     * @return App\Models\User
     * @param Integer $id
     * 
     */

    public function get_user_from_id($id)
    {
        return User::find($id);
    }

    /**
     * Obtener el Manager de contenido consultando por el ID de usuario.
     *
     * @return App\Models\Manager
     * @param Integer $id
     * 
     */

    public function get_manager_from_user($id)
    {
        $user = User::find($id);
        $role = $user->role;
        $profile = $role->manager;

        return $profile;
    }

    /**
     * Obtener el Creador de contenido consultando por el ID de usuario.
     *
     * @return App\Models\Creator
     * @param Integer $id
     * 
     */

    public function get_creator_from_user($id)
    {
        $user = User::find($id);
        $role = $user->role;
        $profile = $role->creator;

        return $profile;
    }

    /**
     * Si el usuario quue hace la peticion es un Administrador de la plataforma.
     * Se le redirige a la administracion de usuarios
     *
     * @return Illuminate\Http\View
     * @param Illuminate\Http\Request
     * 
     */

    public function admin_users(Request $request)
    {
        $users = User::with("role.user_type")->get();
        $profile = $request->session()->get('profile_type');
        //If you don't have permissions for this, redirect to the dashboard.
        if ($profile == 3) {
            return view('admin/users')->with('users', $users);
        } else {
            return view('dashboard');
        }
    }

    /**
     * Si el usuario quue hace la peticion es un Administrador de la plataforma.
     * Se le redirige a la administracion de perfiles
     *
     * @return Illuminate\Http\View
     * @param Illuminate\Http\Request
     * 
     */

    public function admin_profiles(Request $request)
    {
        $creators = [];
        $managers = [];
        $profile = $request->session()->get('profile_type');
        $profiles = Role::with("creator", "manager")->where('creator_id', '!=', null)->orWhere('manager_id', '!=', null)->get();

        $profiles->each(function ($user) use (&$creators, &$managers) {
            $user_type = $user->user_type_id;
            if ($user_type == 1) {
                array_push($creators, $user->creator);
            } else if ($user_type == 2) {
                array_push($managers, $user->manager);
            }
        });


        if ($profile == 3) {
            return view('admin/profiles')->with(['creators' => $creators, 'managers' => $managers]);
        } else {
            return view('dashboard');
        }
    }

    // Editar los valores de un usuario a traves de una peticion POST
    public function edit(Request $request)
    {
        $user_id = $request->post('user_id');
        $new_name = $request->post('name');
        $new_email = $request->post('email');
        $user = User::find($user_id);
        $user->name = $new_name;
        $user->email = $new_email;
        $user->save();

        return $user->id;
    }

    // Eliminar a un usuario de la plataforma a traves de una peticion POST
    public function delete(Request $request)
    {
        $user_id = $request->post('user_id');
        $user = User::find($user_id);
        $user->delete();
        //return $user->id;
    }

    public function create(Request $request)
    {
        $user = User::create([
            'name' => $request->post('name'),
            'email' => $request->post('email'),
            'password' => Hash::make($request->post('password')),
        ]);

        event(new Registered($user));

        $request->session()->put('wizard', true);
    }

}
