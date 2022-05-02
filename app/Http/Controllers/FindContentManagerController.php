<?php

namespace App\Http\Controllers;

use App\Models\Role;
use Illuminate\Http\Request;
use App\Http\Controllers\ContractController;


class FindContentManagerController extends Controller
{
    /*
    * Funcion principal para listar Administradores de Contenido en la plataforma con sus respectivos planes de precio.
    */
    
    public function index(Request $request)
    {
        $users = array();
        $profile_type = $request->session()->get('profile_type');
        $profile = $request->session()->get('profile');
        $contractController = new ContractController;


        if ($profile_type == 1) {

            $contract = $contractController->creator_has_contract($profile);
            /**  En caso de no tener contrato vigente, mostramos los content creators disponibles
            * Si ya tiene contrato con alguno, no tiene sentido que su contenido sea gestionado por varios
            * manager simultaneamente
            */
            if (!$contract) {

                $roles = Role::with('user', 'manager')->where('user_type_id', 2)->get();

                foreach ($roles as $role) {
                    // Force the agreements to be populated at the user.
                    $role->manager->agreement;
                    array_push($users, $role);
                }
            }
        }

        return view('findmanagers')->with('managers', $users);
    }
}
