<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\AgreementController;
use App\Models\Agreement;
use App\Models\Manager;

class PlansController extends Controller
{
    /**
     * Funcion para listar todos los Planes disponibles por un Administrador de contenidos-
     */
    public function index(Request $request)
    {
        $view = '';
        $profile_type = $request->session()->get('profile_type');
        if ($profile_type == 2) {

            $manager = $request->session()->get('profile');
            $agreementController = new AgreementController($manager);

            $agreements = $agreementController->list($manager->id);

            $view = view('plans')->with('agreements', $agreements);
        } else {
            $view = view('dashboard');
        }

        return $view;
    }

    /**
     * Funcion para dar de alta un nuevo plan por parte del administrador de contenido.
     */

    public function submit(Request $request)
    {
        $manager = $request->session()->get('profile');

        $plan_price = $request->post('plan-price');
        $plan_month = $request->post('plan-months');
        $plan_discount = $request->post('plan-discount');

        $agreement = new Agreement();
        $agreement->price_per_month = $plan_price;
        $agreement->discount = $plan_discount;
        $agreement->months = $plan_month;


        $manager_db = Manager::find($manager->id);
        $manager_db->agreement()->save($agreement);

        return $this->index($request);
    }
}
