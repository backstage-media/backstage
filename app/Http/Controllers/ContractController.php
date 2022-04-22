<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Agreement;
use App\Models\Manager;
use App\Models\Creator;
use App\Models\Contract;
use App\Http\Controllers\NotificationController;
use App\Models\Notification;

class ContractController extends Controller
{

    public function view(Request $request)
    {
        if (isset($request->id)) {
            $agreement = Agreement::with('manager')->where('id', $request->id)->get();
            return view('contractwizard')->with('agreement', $agreement);
        }
    }

    public function get_manager(Request $request)
    {
        $main_contract = Array();
        $profile = $request->session()->get("profile");
        $contract = Contract::with('manager')->where('creator_id', $profile->id)->latest('id')->first();
        if ($contract != null) {
            $contract->manager();
        }
        array_push($main_contract,$contract->id);
        $previous_contracts = Contract::with('manager')->where('creator_id', $profile->id)->WhereNotIn('id',$main_contract)->get();
        return view('contract')->with('contract', $contract);
    }

    public function add(Request $request)
    {
        $profile = $request->session()->get("profile");
        $user_id = $request->user()->id;
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

        //Enviar notificacion al Manager de su nuevo contrato.

        $notification = new Notification;
        $userController = new UserController;

        $manager_user = $userController->get_user_from_manager($manager);
        $user = $userController->get_user_from_id($user_id);

        $notification->from_user = $user->id;
        $notification->to_user = $manager_user->id;
        $notification->notification_type = 4;
        $notification->message = $user->name . ' Started a new contract with you until ' . $request->end_date;
        $notification->target_id = $contract->id;
        $notification->save();

        return view('dashboard');
    }

    public function list()
    {
        $agreements = Agreement::all();

        return $agreements;
    }

    public function list_from_manager(Request $request)
    {
        $profile = $request->session()->get("profile");
        $current_date = date('Y-m-d H:i:s');
        $contracts = Contract::with('creator')->where('manager_id', $profile->id)->where('status',true)->where('end_date', '>', $current_date)->get();
        return view('manager/creators')->with('contracts', $contracts);
    }

    public function manager_is_allowed($manager_id, $creator_id)
    {
        $contract_valid = false;
        $current_date = date('Y-m-d H:i:s');
        $rows = Contract::with('creator')->where('manager_id', $manager_id)->where('creator_id', $creator_id)->where('end_date', '>', $current_date)->where('status',true)->count();
        if ($rows > 0) {
            $contract_valid = true;
        }
        return $contract_valid;
    }

    public function get_contract_creator($creator_id)
    {
        $creator = Contract::with('creator')->where('creator_id', $creator_id)->first();
        return $creator;
    }

    public function get_contract_manager($creator_id)
    {
        $contract = Contract::with('manager')->where('creator_id', $creator_id)->first();
        $manager = $contract->manager;
        return $manager;
    }

    public function admin_contracts(Request $request)
    {
        $profile = $request->session()->get('profile_type');
        $contracts = Contract::with('manager', 'creator', 'agreement')->get();

        if ($profile == 3) {
            return view('admin/contracts')->with('contracts', $contracts);
        } else {
            return view('dashboard');
        }
    }

    public function creator_has_contract(Creator $creator)
    {
        $hasContract = false;
        $contract = Contract::where('creator_id', $creator->id)->where('status',true)->count();
        if ($contract > 0) {
            $hasContract = true;
        }
        return $hasContract;
    }

    public function download_invoice(Request $request)
    {

        if (isset($request->id)) {
            $document_id = $request->id;

            $contract = Contract::with('agreement','manager','creator')->where('id', $document_id)->first();
            $current_profile = $request->session()->get('profile');
            //DomPDF Variables.

            $start_date = $contract->start_date;
            $end_date = $contract->end_date;
            $creator = $contract->creator;
            $manager = $contract->manager;
            $generated_on = date('Y-m-d H:i:s');
            $id = sprintf('%08d', $document_id);
            $duration = $contract->agreement->months;
            $price_per_month = $contract->agreement->price_per_month;
            $discount = $contract->agreement->discount;
            // Calcular precio final.
            $final_price = $price_per_month - ($price_per_month * ($discount / 100));
            $final_total = $final_price * $duration;
            $client_name = $current_profile->real_name;
            

            ob_start();
            require(__DIR__ . "/dompdf/invoice.php");
            $html = ob_get_contents();
            ob_get_clean();

            $dompdf = app('dompdf.wrapper');
            $dompdf->addInfo(['Title' => 'Invoice']);
            $dompdf->loadHtml($html);

            $dompdf->render();

            return $dompdf->stream('factura-contrato-'.$id.'.pdf');
        }
    }

    public function cancel_subscription(Request $request){
        if (isset($request->id)) {
            $contract = Contract::find($request->id);
            $contract->status = false;
            $contract->automatic_renewal = false;
            $contract->save();
        }
    }
}
