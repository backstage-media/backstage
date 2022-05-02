<?php

namespace App\Http\Controllers;
use App\Providers\GoogleProvider;
use Illuminate\Http\Request;

class ContentController extends Controller
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
     * Funcion para mostrar todo el contenido multimedia de un canal de youtube, aqui se consulta mediante la API de Youtube el contenido
     * y se presenta en la web.
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        $latestVideosMetadata[] = array();
        
        if ($request->session()->get('youtubeHandler')) {
        // Get latest videos uploaded.
        $latestVideos = $this->youtubeController->get_latest_videos($request);
        
        //Provide all the metadata of the latest videos
        foreach ($latestVideos["items"] as $key => $value) {
            $videoId = $latestVideos["items"][$key]["id"]["videoId"];
            $this->youtubeController->get_channels_info($request);
            $videoMetadata = $this->youtubeController->get_video_metadata($request,$videoId);
            array_push($latestVideosMetadata,$videoMetadata);
        }
    }
        
        return view('content')->with('latestYoutubeContent',$latestVideosMetadata);
    }

}