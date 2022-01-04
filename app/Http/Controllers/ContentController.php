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
     * Show user content.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        $latestVideos = $this->youtubeController->get_latest_videos($request);
        return view('content')->with('latestYoutubeContent',$latestVideos);
    }

}