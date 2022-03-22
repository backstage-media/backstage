<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Partner;

class PartnerController extends Controller
{
    public function submit(Request $request)
    {
        $partner_name = $request->post('partner-name');
        $file_upload = $request->file('partner-file');
        $partner_email = $request->post('partner-email');

        $partner = new Partner;

        $partner->contract = $file_upload;
        $partner->name = $partner_name;
        $partner->contact = $partner_email;
        $partner->followers = 0;
        $partner->description = '';

        $partner->save();
        
    }

    public function index(){
        //Add query to retrieve all the partners
        return view('partners');
    }


    

}
