<?php

namespace App\Http\Controllers;

use App\Providers\GoogleProvider;
use Illuminate\Http\Request;

class GoogleController extends Controller
{
    public function __construct(GoogleProvider $google, Request $request)
    {
        $this->client = $google->client();
        $this->ytanalytics = $google->ytanalytics($this->client);
    }

    public function getbasicstats(Request $request)
    {
        global $image_url;
        if ($request->session()->get('access_token')) {
            $client = $this->client;
            $client->setAccessToken($request->session()->get('access_token'));
            //getting user general stats on Youtube
            $pageToken = NULL;
            $queryParams = [
                'endDate' => '2018-05-01',
                'ids' => 'channel==MINE',
                'metrics' => 'views,comments,likes,dislikes,estimatedMinutesWatched,averageViewDuration',
                'startDate' => '2010-01-01'
            ];
            //At this point we have the basics stats for your Youtube Channel.
            $response = $this->ytanalytics->reports->query($queryParams);
            $request->session()->put('mainstats', $response);
            return view('dashboard');

        } else {
            return redirect('/home')->with('error', 'you have not been authenticated');
        }
    }

    public function getmostwatched(Request $request){
        if ($request->session()->get('access_token')) {
            $client = $this->client;
            $client->setAccessToken($request->session()->get('access_token'));
            $pageToken = NULL;
            // Top 10 – Most viewed videos for a content owner
            $queryParams = [
                'ids' => 'channel==MINE',
                'dimensions' => 'video',
                'metrics' => 'estimatedMinutesWatched,views,likes,subscribersGained',
                'maxResults' => 10,
                'sort' => '-estimatedMinutesWatched',
                'startDate' => '2010-01-01',
                'endDate' => '2018-05-01'
            ];
            //At this point we have the basics stats for your Youtube Channel.
            $response = $this->ytanalytics->reports->query($queryParams);
            $request->session()->put('mainstats', $response);
            return view('dashboard');
        } else {
            return redirect('/home')->with('error', 'you have not been authenticated');
        }
    }
}
