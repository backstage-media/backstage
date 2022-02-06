<?php

namespace App\Http\Controllers;


use App\Models\Media;
use Illuminate\Http\Request;
use App\Providers\GoogleProvider;
use App\Http\Controllers\ContentCreatorController;

class GoogleAuthController extends Controller
{
    //
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
