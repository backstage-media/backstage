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
        //Initialize main arrays first.
        $channelStats = array();
        $channelsInfo = array();
        // If we have an active Google Session, we can show Dashboard stats
        if ($request->session()->get('access_token')) {
        // IMPORTANT! Avoid here this number of calls if the user already have the info (maybe create a checksum??)
        $channelsInfo = $this->youtubeController->get_channels_info($request);
        $channelStats = $this->youtubeController->get_basic_stats($request);

        // In case we suceed at getting Google Stats, we create all the needed array structure.
        if(is_array($channelsInfo)){

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
        
        }
        // Set Channel ID for the current user session when you Open user dashboard.
        session()->put('youtube_channel_id', $channelsInfo["items"][0]["id"]);
        }
        return view('dashboard')->with('mainStats', [ 
            'channelStats' => $channelStats,
            'channelsInfo' => $channelsInfo
        ]);
    }

}