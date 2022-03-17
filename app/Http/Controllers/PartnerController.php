<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PartnerController extends Controller
{
    public function submit(Request $request)
    {
        $manager = $request->session()->get('profile');
        
        $plan_price = $request->post('plan-price');
        print_r($request->post());
        $plan_month = $request->post('plan-months');
        $plan_discount = $request->post('plan-discount');

        $agreement = new Agreement();
        $agreement->price_per_month = $plan_price;
        $agreement->discount = $plan_discount;
        $agreement->months = $plan_month;
        

        $manager_db = Manager::find($manager->id);
        $manager_db->agreement()->save($agreement);

        return view('dashboard');
    }

    public function index(){
        //Add query to retrieve all the partners
        return view('partners');
    }
    

}
