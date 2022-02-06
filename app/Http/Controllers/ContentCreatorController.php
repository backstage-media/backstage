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

    public function __construct($profile)
    {
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
    public function show(Creator $contentCreator)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ContentCreator  $contentCreator
     * @return \Illuminate\Http\Response
     */
    public function edit(Creator $contentCreator)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ContentCreator  $contentCreator
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Creator $contentCreator)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ContentCreator  $contentCreator
     * @return \Illuminate\Http\Response
     */
    public function destroy(Creator $contentCreator)
    {
        //
    }
}
