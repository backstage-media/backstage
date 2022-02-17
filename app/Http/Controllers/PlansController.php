<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\AgreementController;
use App\Models\Agreement;
use App\Models\Manager;

class PlansController extends Controller
{
    //
    public function index(Request $request){
        $manager = $request->session()->get('profile');
        $agreementController = new AgreementController($manager);

        $agreements = $agreementController->list();

        return view('plans')->with('agreements',$agreements);
    }

    public function submit(Request $request)
    {
        $manager = $request->session()->get('profile');
        
        $plan_price = $request->post('plan-price');
        print_r($request->post());
        $plan_month = $request->post('plan-month');
        $plan_discount = $request->post('plan-discount');

        $agreement = new Agreement();
        $agreement->price_per_month = $plan_price;
        $agreement->discount = $plan_discount;
        $agreement->months = $plan_month;
        

        $manager_db = Manager::find($manager->id);
        $manager_db->agreement()->save($agreement);

        return view('dashboard');
    }
}
