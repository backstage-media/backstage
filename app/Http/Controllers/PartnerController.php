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
        $contents = $file_upload->openFile()->fread($file_upload->getSize());
        $partner_email = $request->post('partner-email');

        $partner = new Partner;

        $partner->contract = $contents;
        $partner->name = $partner_name;
        $partner->contact = $partner_email;
        $partner->followers = 0;
        $partner->description = '';

        $partner->save();

        return view('partners');
    }

    public function index()
    {
        //Add query to retrieve all the partners
        $partners = Partner::all('id','name', 'contact', 'description', 'created_at');
        //print_r($partners);
        return view('partners')->with('partners', $partners);
    }

    // On click for each partner, generate the PDF document, content already working on blob 

    public function get_document($file_id)
    {
        $id = $file_id;
        $contract = Partner::find($id, ['contract']);

        header('Content-type: application/pdf');
        header("Cache-Control: no-cache");
        header("Pragma: no-cache");
        header("Content-length: ".strlen($contract));
        die($contract);
    }
}
