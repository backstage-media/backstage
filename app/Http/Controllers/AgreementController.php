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
    /*
    * Crea una nueva instancia de Agreement en la base de datos.
    * @param  \App\Models\Agreement  $agreement
    */

    public function create(Agreement $agreement)
    {
        $agreement->save();
    }
    
    /*
    * Lista todos los Agreements asociados a un Manager de contenido.
    * @param  Integer $manager_id
    */

    public function list($manager_id)
    {
        $agreements = Agreement::where('manager_id',$manager_id)->get();

        return $agreements;
    }
}
