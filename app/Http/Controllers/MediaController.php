<?php

namespace App\Http\Controllers;

use App\Providers\GoogleProvider;
use Illuminate\Http\Request;
use App\Http\Controllers\CommentsController;
use App\Http\Controllers\ManageContentController;
use App\Models\Media;

class MediaController extends Controller
{
    /*
    * Clase Creada para gestionar los Videos asociados a una cuenta de Youtube de un Creador de contenido.
    */

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

    /**
     * Obtener todos los detalles asociados a un Video de Youtube y mostrarlo en la vista.
     *
     * @return \Illuminate\Http\View
     * @param \Illuminate\Http\Request
     * 
     */

    public function view(Request $request)
    {
        if (isset($request->id)) {
            $videoMetadata = "";
            $videoAnalytics = "";
            $videoId = "";
            $comments = "";
            $scroll = false;
            $message= "";

            if($request->get('creator')){
                $manageContent = New ManageContentController;
                $manageContent->set_permission($request);
            }

            if ($request->session()->get('youtubeHandler')) {
                $videoId = $request->id;
                $videoMetadata = $this->youtubeController->get_video_metadata($request, $videoId);
                $videoAnalytics = $this->youtubeController->get_video_advanced_metadata($request, $videoId);
                //List all the comments on backstage associated to a youtube video.
                $commentsController = new CommentsController();
                $comments = $commentsController->list_by_id($videoId);
                if($request->get('comment')){
                    $message = $request->get('comment');
                    $scroll = true;
                }
            }

            
            return view('media')
            ->with('youtubeVideoContent', $videoMetadata)
            ->with('youtubeVideoAnalytics', $videoAnalytics)
            ->with('youtubeVideoID',$videoId)
            ->with('comments',$comments)
            ->with('scroll',$scroll)
            ->with('message',$message);
        } else {
            return redirect('/dashboard');
        }
    }

    public function update(Request $request, Media $media)
    {

    }
}
