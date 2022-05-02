<?php

namespace App\Http\Controllers;

use App\Providers\GoogleProvider;
use Illuminate\Http\Request;
use App\Models\Media;
use App\Models\Creator;
use App\Http\Controllers\ContentCreatorController;
use App\Http\Controllers\UserController;

class ManageContentController extends Controller
{
    /*
    * Esta Clase tiene la principal funcion de permitir al Administrador de contenido, gestionar el contenido del creador que ha establecido con el.
    * Sera Capaz de cambiar la visibilidad de los videos, ver todo el contenido y ademas añadir comentario sobre el.
    */

    public function manage(Request $request)
    {
        //Primero confirmamos que el administrador de contenido tiene permisos sobre ese creador de contenido.
        $creator_id = $request->creator_id;
        $profile = $request->session()->get("profile");
        $contract = new ContractController();
        $creator_profile = $contract->get_contract_creator($creator_id);
        $final_redirect = view('dashboard');

        if ($contract->manager_is_allowed($profile->id, $creator_id)) {
            $creatorController = new ContentCreatorController($creator_profile['creator']);
            if ($creatorController->isGoogleConnected()) {
                $request->session()->put('youtubeHandler', $creatorController);
                //Inicializamos todo lo necesario para ver y administrar el contenido del creador.
                $googleProvider = new GoogleProvider();
                $youtubeController = new GoogleController($googleProvider);
                $userController = new UserController;
                $channelsInfo = $youtubeController->get_channels_info($request);
                $creator = Creator::find($creator_id);
                $creatorUserProfile = $userController->get_user_from_creator($creator);

                $request->session()->put('channel_name', $channelsInfo["items"][0]["snippet"]["title"]);
                $request->session()->put('channel_thumbnail', $channelsInfo["items"][0]["snippet"]["thumbnails"]["default"]["url"]);
                $request->session()->put('creator_profile', $creator_profile);
                $request->session()->put('creator_user_profile', $creatorUserProfile);

                $final_redirect = view('dashboard');
            }
        }

        return $final_redirect;
    }

    public function set_permission(Request $request)
    {
        //Primero confirmamos que el administrador de contenido tiene permisos sobre ese creador de contenido.
        $creator_id = $request->get("creator");
        $profile = $request->session()->get("profile");
        $contract = new ContractController();
        $creator_profile = $contract->get_contract_creator($creator_id);
        $final_redirect = view('dashboard');

        if ($contract->manager_is_allowed($profile->id, $creator_id)) {
            $creatorController = new ContentCreatorController($creator_profile['creator']);
            if ($creatorController->isGoogleConnected()) {
                $request->session()->put('youtubeHandler', $creatorController);
                //Inicializamos todo lo necesario para ver y administrar el contenido del creador.
                $googleProvider = new GoogleProvider();
                $youtubeController = new GoogleController($googleProvider);
                $userController = new UserController;
                $channelsInfo = $youtubeController->get_channels_info($request);
                $creator = Creator::find($creator_id);
                $creatorUserProfile = $userController->get_user_from_creator($creator);

                $request->session()->put('channel_name', $channelsInfo["items"][0]["snippet"]["title"]);
                $request->session()->put('channel_thumbnail', $channelsInfo["items"][0]["snippet"]["thumbnails"]["default"]["url"]);
                $request->session()->put('creator_profile', $creator_profile);
                $request->session()->put('creator_user_profile', $creatorUserProfile);
            }
        }
    }

    public function exit(Request $request)
    {
        $request->session()->forget('youtubeHandler');
        $request->session()->forget('creator_profile');
        return redirect('/dashboard');
    }
}
