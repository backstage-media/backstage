<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Agreement;
use App\Models\Manager;
use App\Models\Creator;
use App\Models\Contract;

class ContractController extends Controller
{

    public function view(Request $request)
    {
        if (isset($request->id)) {
            $agreement = Agreement::with('manager')->where('id', $request->id)->get();
            return view('contractwizard')->with('agreement', $agreement);
        }
    }

    public function add(Request $request)
    {
        $profile = $request->session()->get("profile");
        $contract = new Contract;
        $agreement_id = (int)$request->agreement["id"];
        $manager_id = (int)$request->manager["id"];
        $profile_id = (int)$profile->id;
        $agreement = Agreement::find($agreement_id);
        $manager = Manager::find($manager_id);
        $creator = Creator::find($profile_id);
        $contract->status = $request->status;
        $contract->start_date = $request->start_date;
        $contract->end_date = $request->end_date;
        $contract->automatic_renewal = $request->automatic_renewal;
        $contract->manager()->associate($manager);
        $contract->creator()->associate($creator);
        $contract->agreement()->associate($agreement);
        $contract->save();
    }

    public function list()
    {
        $agreements = Agreement::all();

        return $agreements;
    }

    public function list_from_manager(Request $request)
    {
        $profile = $request->session()->get("profile");
        $contracts = Contract::with('creator')->where('manager_id', $profile->id)->get();
        return view('manager/creators')->with('contracts', $contracts);
    }

    public function manager_is_allowed($manager_id, $creator_id)
    {
        $contract_valid = false;
        $current_date = date('Y-m-d H:i:s');
        $rows = Contract::with('creator')->where('manager_id', $manager_id)->where('creator_id', $creator_id)->where('end_date', '>', $current_date)->count();
        if ($rows > 0) {
            $contract_valid = true;
        }
        return $contract_valid;
    }

    public function get_contract_creator($creator_id){
        $creator = Contract::with('creator')->where('creator_id', $creator_id)->get();
        return $creator;
    }
}
