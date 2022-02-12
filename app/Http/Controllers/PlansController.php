<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\AgreementController;

class PlansController extends Controller
{
    //
    public function index(Request $request){
        $manager = $request->session()->get('profile');
        $agreementController = new AgreementController($manager);

        $agreements = $agreementController->list();

        return view('plans')->with('agreements',$agreements);
    }
}
