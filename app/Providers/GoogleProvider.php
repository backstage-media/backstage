<?php

namespace App\Providers;

class GoogleProvider
{
    public function client()
    {
        $client = new \Google_Client();
        $client->setClientId(env('GOOGLE_CLIENT_ID'));
        $client->setClientSecret(env('GOOGLE_CLIENT_SECRET'));
        $client->setRedirectUri(env('GOOGLE_REDIRECT_URL'));
        $client->setScopes(explode(',', env('GOOGLE_SCOPES')));
        $client->setApprovalPrompt(env('GOOGLE_APPROVAL_PROMPT'));
        $client->setAccessType(env('GOOGLE_ACCESS_TYPE'));
        return $client;
    }
    public function ytanalytics($client)
    {
        $ytanalytics = new \Google_Service_YouTubeAnalytics($client);
        return $ytanalytics;
    }
    public function youtube($client)
    {
        $youtube = new \Google_Service_Youtube($client);
        return $youtube;
    }
}
