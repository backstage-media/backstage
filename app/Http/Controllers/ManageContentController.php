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
        $final_redirect = view('dashboard');

        if($contract->manager_is_allowed($profile->id,$creator_id)){
            $creatorController = new ContentCreatorController($creator_profile['creator']);
            if ($creatorController->isGoogleConnected()) {
                $request->session()->put('youtubeHandler', $creatorController);
                //Get some context from our creator channel.
                $googleProvider = new GoogleProvider();
                $youtubeController = new GoogleController($googleProvider);
                $channelsInfo = $youtubeController->get_channels_info($request);

                $request->session()->put('channel_name', $channelsInfo["items"][0]["snippet"]["title"]);
                $request->session()->put('channel_thumbnail', $channelsInfo["items"][0]["snippet"]["thumbnails"]["default"]["url"]);
                $request->session()->put('creator_profile',$creator_profile);
                $request->session()->put('management',true);

                $final_redirect = view('dashboard');
            }
        }

        return $final_redirect;
        
    }

    public function update(Request $request, Media $media)
    {

    }

    public function exit(Request $request){
        $request->session()->forget('youtubeHandler');
        $request->session()->forget('creator_profile');
        $request->session()->put('management',false);
        return redirect('/dashboard');
    }
}
