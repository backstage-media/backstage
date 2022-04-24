<?php

namespace App\Http\Controllers;

use App\Models\Creator;
use Illuminate\Http\Request;

class ContentCreatorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct($profile = null)
    {
        if (empty($profile)) { $profile = ''; }
        $this->creatorController = $profile;
    }


    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Creator $creator)
    {
        $creator->save();
    }

    /**
     * Store Google credetials for a Content Creator.
     *
     */

    public function isGoogleConnected()
    {
        $isConnected = false;
        $token = self::getGoogleAccessToken();
        if (strlen($token) > 0) {
            $isConnected = true;
        }
        return $isConnected;
    }

    public function storeGoogleCredentials($access_key, $refresh_token)
    {
        $this->creatorController->google_access_token = $access_key;
        $this->creatorController->google_refresh_token = $refresh_token;
        $this->creatorController->save();
    }

    public function getGoogleAccessToken()
    {
        return $this->creatorController->google_access_token;
    }

    public function getGoogleRefreshToken()
    {
        return $this->creatorController->google_refresh_token;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ContentCreator  $contentCreator
     * @return \Illuminate\Http\Response
     */
    public function get($creator_id)
    {
        return Creator::find($creator_id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Request  $request
     * @return \App\Models\ContentCreator->id
     */
    // Edit user on the database based on POST values.
    public function edit(Request $request)
    {
        $user_id = $request->post('creator_id');
        $new_name = $request->post('real_name');
        $new_email = $request->post('description');
        $user = Creator::find($user_id);
        $user->real_name = $new_name;
        $user->description = $new_email;
        $user->save();

        return $user->id;
    }

    public function toString()
    {
        return $this->creatorController->google_access_token;
    }
}
