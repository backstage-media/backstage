<?php

namespace App\Http\Controllers;


use App\Models\Media;
use Illuminate\Http\Request;
use App\Providers\GoogleProvider;
use App\Http\Controllers\ContentCreatorController;

/*
* La principal funcion de esta clase es gestionar el proceso de autenticacion con Google cuando vas a conectar tu cuenta de Youtube.
*/


class GoogleAuthController extends Controller
{
    // Funcion que se creo inicialmente para listar el contenido de la tabla 'media'. Conforme evoluciono la plataforma decidi mostrar el contenido
    // Basandome unicamente en todo lo que este disponible mediante la API de Youtube.
    
    public function index()
    {
        $media = Media::all();
        return view('home')->with('media', $media);
    }
    public function __construct(GoogleProvider $google, Request $request)
    {
        $this->client = $google->client();
        $this->ytanalytics = $google->ytanalytics($this->client);
    }
    public function redirectToGoogleProvider(GoogleProvider $google)
    {
        $client = $google->client();
        $auth_url = $client->createAuthUrl();
        return redirect($auth_url);
    }
    public function handleProviderGoogleCallback(GoogleProvider $google, Request $request)
    {
        if ($request->has('code')) {
            $client = $this->client;
            $client->authenticate($request->input('code'));
            $token = $client->getAccessToken();
            $refresh_token = $client->getRefreshToken();
            $user_type = $request->session()->get('profile_type');
            if($user_type == 1){
                $profile = $request->session()->get('profile');
                $creatorHandler = new ContentCreatorController($profile);
                $creatorHandler->storeGoogleCredentials($token['access_token'], $refresh_token);
                $request->session()->put('youtubeHandler', $creatorHandler);
            }
            return redirect('/home')->with('success', 'you have been authenticated');
        } else {
            $client = $google->client();
            $auth_url = $client->createAuthUrl();
            return redirect($auth_url);
        }
    }
}
