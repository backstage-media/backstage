<?php

namespace App\Http\Controllers;

use App\Providers\GoogleProvider;
use Illuminate\Http\Request;
use App\Models\Media;

class MediaController extends Controller
{

    public function __construct()
    {
        $googleProvider = new GoogleProvider();
        $this->youtubeController = new GoogleController($googleProvider);
    }

    public function index()
    {
        //$media = auth()->user()->media();
        return view('dashboard', compact('media'));
    }

    public function add()
    {
        return view('add');
    }

    public function create(Request $request)
    {

    }

    public function view(Request $request)
    {
        if (isset($request->id)) {
            $videoMetadata = "";

            if ($request->session()->get('access_token')) {
                $videoId = $request->id;
                $videoMetadata = $this->youtubeController->get_video_metadata($request, $videoId);
                $videoAnalytics = $this->youtubeController->get_video_advanced_metadata($request, $videoId);
            }

            //return view('media')->with('youtubeVideoContent', $videoMetadata);
            return view('media')
            ->with('youtubeVideoContent', $videoMetadata)
            ->with('youtubeVideoAnalytics', $videoAnalytics);
        } else {
            return redirect('/dashboard');
        }
    }

    public function update(Request $request, Media $media)
    {

    }
}
