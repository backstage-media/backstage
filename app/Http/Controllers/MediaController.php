<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Media;

class MediaController extends Controller
{
    public function index()
    {
        $media = auth()->user()->media();
        return view('dashboard', compact('media'));
    }
    public function add()
    {
    	return view('add');
    }

    public function create(Request $request)
    {
        $this->validate($request, [
            'description' => 'required'
        ]);
    	$task = new media();
    	$task->description = $request->description;
    	$task->user_id = auth()->user()->id;
    	$task->save();
    	return redirect('/dashboard'); 
    }

    public function edit(Media $media)
    {

    	if (auth()->user()->id == $media->user_id)
        {            
                return view('edit', compact('media'));
        }           
        else {
             return redirect('/dashboard');
         }            	
    }

    public function update(Request $request, Media $media)
    {
    	if(isset($_POST['delete'])) {
    		$media->delete();
    		return redirect('/dashboard');
    	}
    	else
    	{
            $this->validate($request, [
                'description' => 'required'
            ]);
    		$media->description = $request->description;
	    	$media->save();
	    	return redirect('/dashboard'); 
    	}    	
    }
}
