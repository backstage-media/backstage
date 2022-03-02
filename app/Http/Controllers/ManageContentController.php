<?php

namespace App\Http\Controllers;

use App\Providers\GoogleProvider;
use Illuminate\Http\Request;
use App\Models\Media;
use App\Http\Controllers\ContentCreatorController;

class ManageContentController extends Controller
{

    public function manage(Request $request)
    {
        //First we need to confirm manager permission over content creator.
        $creator_id = $request->creator_id;
        $profile = $request->session()->get("profile");
        $contract = new ContractController();
        $creator_profile = $contract->get_contract_creator($creator_id);
        print("<pre>".print_r($creator_profile[0]['creator'],true)."</pre>");
        $final_redirect = '/dashboard';
        

        if($contract->manager_is_allowed($profile->id,$creator_id)){
            $creatorController = new ContentCreatorController($creator_profile[0]['creator']);
            if ($creatorController->isGoogleConnected()) {
                $request->session()->put('youtubeHandler', $creatorController);
                $final_redirect = '/content';
            }
        }

        return redirect($final_redirect);
        
    }

    public function update(Request $request, Media $media)
    {

    }
}
