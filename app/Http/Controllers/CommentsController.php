<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Comment;
use App\Models\User;

class CommentsController extends Controller
{
    //
    public function index(Request $request){

    }

    public function add(Request $request)
    {
        $user_id = auth()->user()->id;
        
        $commentText = $request->post('text');
        $video_id = $request->post('video_id');

        $comment = new Comment();
        $comment->text = $commentText;
        $comment->video_id = $video_id;

        $user = User::find($user_id);
        $user->comment()->save($comment);       
    }

    public function list_by_id($video_id){

        $comments = Comment::with('user')->where('video_id', $video_id)->get();
        return $comments;
    }
} 
