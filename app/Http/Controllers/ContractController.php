<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Agreement;

class ContractController extends Controller
{

    public function view(Request $request)
    {
        if (isset($request->id)) {
            $agreement = Agreement::with('manager')->where('id', $request->id)->get();
            return view('contractwizard')->with('agreement', $agreement);
        }
    }

    public function create(Request $request)
    {
        if (isset($request->id)) {

        }        
    }

    public function list()
    {
        $agreements = Agreement::all();

        return $agreements;
    }
}
