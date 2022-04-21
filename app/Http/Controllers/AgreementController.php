<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Agreement;

class AgreementController extends Controller
{

    public function __construct($manager)
    {
        $this->agreementController = $manager;
    }

    public function create(Agreement $agreement)
    {
        $agreement->save();
    }

    public function list($manager_id)
    {
        $agreements = Agreement::where('manager_id',$manager_id)->get();

        return $agreements;
    }
}
