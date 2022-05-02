<?php

namespace App\Http\Controllers;

use App\Providers\GoogleProvider;
use Illuminate\Http\Request;
use App\Models\User;

class DashboardController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $googleProvider = new GoogleProvider();
        $this->youtubeController = new GoogleController($googleProvider);
    }

    /**
     * Funcion creada para mostrar toda la actividad principal de un usuario cuando tiene la cuenta de Youtube Conectada.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        //Initialize main arrays first.
        $channelStats = array();
        $channelsInfo = array();
        $channelActivity = array("items" => "");
        // If we have an active Google Session, we can show Dashboard stats
        if ($request->session()->get('youtubeHandler')) {
            // IMPORTANT! Avoid here this number of calls if the user already have the info (maybe create a checksum??)
            $channelsInfo = $this->youtubeController->get_channels_info($request);
            $channelStats = $this->youtubeController->get_basic_stats($request);
            $channelActivity = $this->youtubeController->get_channel_activity($request);

            // In case we suceed at getting Google Stats, we create all the needed array structure.
            if (is_array($channelsInfo)) {

                $channelInfo = array(
                    "name" => $channelsInfo["items"][0]["snippet"]["title"],
                    "description" => $channelsInfo["items"][0]["snippet"]["description"],
                    "id" => $channelsInfo["items"][0]["id"],
                    "thumbnail" => $channelsInfo["items"][0]["snippet"]["thumbnails"]["default"]["url"],
                    "country" => $channelsInfo["items"][0]["snippet"]["country"]
                );

                $channelsInfo = json_encode($channelInfo, JSON_FORCE_OBJECT);
            }
            // Set Channel ID for the current user session when you Open user dashboard.
            session()->put('youtube_channel_id', $channelsInfo["items"][0]["id"]);
        }

        

        return view('dashboard')->with('mainStats', [
            'channelStats' => $channelStats,
            'channelsInfo' => $channelsInfo,
            // Example of the data structure - https://developers.google.com/youtube/v3/docs/activities/list?apix=true&apix_params=%7B"part"%3A%5B"id%2Csnippet%2CcontentDetails%20"%5D%2C"maxResults"%3A10%2C"mine"%3Atrue%7D
            'channelActivity' => $channelActivity["items"]
        ]);
    }
}
