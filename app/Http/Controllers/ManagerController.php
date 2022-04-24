<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Manager;

class ManagerController extends Controller
{
    //
        /**
     * Show the form for editing the specified resource.
     *
     * @param  Request  $request
     * @return \App\Models\ContentCreator->id
     */
    // Edit user on the database based on POST values.
    public function edit(Request $request){
        $user_id = $request->post('manager_id');
        $new_name = $request->post('real_name');
        $new_description = $request->post('description');
        $new_available = $request->post('available');
        $user = Manager::find($user_id);
        $user->real_name = $new_name;
        $user->description = $new_description;
        $user->available = $new_available;
        $user->save();

        return $user->id;
    }
}
