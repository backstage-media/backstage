<?php

namespace App\Http\Controllers;

use App\Models\Creator;
use Illuminate\Http\Request;

class ContentCreatorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Creator $creator)
    {
        $creator->save();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ContentCreator  $contentCreator
     * @return \Illuminate\Http\Response
     */
    public function show(Creator $contentCreator)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ContentCreator  $contentCreator
     * @return \Illuminate\Http\Response
     */
    public function edit(Creator $contentCreator)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ContentCreator  $contentCreator
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Creator $contentCreator)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ContentCreator  $contentCreator
     * @return \Illuminate\Http\Response
     */
    public function destroy(Creator $contentCreator)
    {
        //
    }
}
