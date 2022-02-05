<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Creator;
use App\Models\Manager;
use App\Models\User;
use App\Models\Role;

class WizardController extends Controller
{
    public function index(Request $request)
    {
        $view = "wizard";
        $wizard_status = $request->session()->get('wizard');
        if (!isset($wizard_status)) {
            $view = "dashboard";
        }
        return view($view);
    }

    private function addCreatorProfile(Request $request, $name, $description)
    {

        $creator = new Creator;
        $creator->real_name = $name;
        $creator->description = $description;

        // Let's initialize the role that will be later assigned to the user.
        $role = new Role;
        $role->user_type_id = 1;

        //At this function we are going to persist a creator profile
        $creator->save();
        //Now let's relate the role with his creator.
        $creator->role()->save($role);

        //Let's update the user pointing to his new role.
        $id = $request->user()->id;
        $user = User::find($id);
        $role->user()->save($user);
    }

    private function addManagerProfile(Request $request, $name, $description)
    {
        $manager = new Manager;
        $manager->real_name = $name;
        $manager->description = $description;

        // Let's initialize the role that will be later assigned to the user.
        $role = new Role;
        // Set the identifier for this profile
        $role->user_type_id = 2;

        //At this function we are going to persist a creator profile
        $manager->save();
        //Now let's relate the role with his creator.
        $manager->role()->save($role);

        //Let's update the user pointing to his new role.
        $id = $request->user()->id;
        $user = User::find($id);
        $role->user()->save($user);
    }

    public function submit(Request $request)
    {
        $user_role = $request->post('user-role');
        $user_description = $request->post('user-description');
        $user_name = $request->post('user-name');
        // Create profile for user.
        if ($user_role == "creator") {
            self::addCreatorProfile($request, $user_name, $user_description);
            $id = $request->user()->id;
            $user = User::find($id);
             // Bring the FK until I obtain the Creator object
            $profile = $user->role->creator;
            $request->session()->put("profile_type",1);
            $request->session()->put("profile",$profile);
        } else if ($user_role == "manager") {
            self::addManagerProfile($request, $user_name, $user_description);
            $id = $request->user()->id;
            $user = User::find($id);
            // Bring the FK until I obtain the Manager object
            $profile = $user->role->manager;
            $request->session()->put("profile_type",2);
            $request->session()->put("profile",$profile);
        }

        //Wizard is completed, so let's remove this flag.
        $request->session()->forget('wizard');

        return view('dashboard');
    }
}
