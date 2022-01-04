<?php

namespace App\Http\Controllers;
use App\Providers\GoogleProvider;
use Illuminate\Http\Request;

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
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        // IMPORTANT! Avoid here this number of calls if the user already have the info (maybe create a checksum??)
        $channelsInfo = $this->youtubeController->get_channels_info($request);
        
        $channelStats = $this->youtubeController->get_basic_stats($request);

        //Store the Channel ID at the user session.
        
        $request->session()->put('youtube_channel_id', $channelsInfo["items"][0]["id"]);

        $channelInfo = ['name' => $channelsInfo["items"][0]["snippet"]["title"], 
                            'description' => $channelsInfo["items"][0]["snippet"]["description"],
                            'id' => $channelsInfo["items"][0]["id"],
                            'thumbnail' => $channelsInfo["items"][0]["snippet"]["thumbnails"]["default"]["url"],
                            'country' => $channelsInfo["items"][0]["snippet"]["country"]
                        ];
        
        $channelInfo = array("name"=>$channelsInfo["items"][0]["snippet"]["title"],
        "description"=>$channelsInfo["items"][0]["snippet"]["description"],
        "id"=>$channelsInfo["items"][0]["id"],
        "thumbnail"=>$channelsInfo["items"][0]["snippet"]["thumbnails"]["default"]["url"],
        "country"=>$channelsInfo["items"][0]["snippet"]["country"]);

        $channelsInfo = json_encode($channelInfo, JSON_FORCE_OBJECT);
        
        return view('dashboard')->with('mainStats', [ 
            'channelStats' => $channelStats,
            'channelsInfo' => $channelsInfo
        ]);
    }

}