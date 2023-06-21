<?php

namespace App\Http\Controllers;

use App\Models\CheckListItemDetail;
use Illuminate\Http\Request;

class CheckListItemDetailController extends Controller
{

    public function index()
    {
        return CheckListItemDetail::all();
    }



    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required'
        ]);
        return CheckListItemDetail::create($request->all());
    }



    public function showCheckListItemDetails($id)
    {
      //  return CheckListItemDetail::findOrFail($id);
      return CheckListItemDetail::where('users_id',$id)->get();
  
    }



    public function show($id)
    {
      return CheckListItemDetail::findOrFail($id);
     // return CheckListItemDetail::where('users_id',$id)->get();
  
    }




    public function update(Request $request, $id)
    {
        $CheckListItemDetail = CheckListItemDetail::findOrFail($id);
        $CheckListItemDetail->update($request->all());
        return $CheckListItemDetail;
    }





    public function destroy($id)
    {
        return CheckListItemDetail::destroy($id);
    }




    public function search($name)
    {
    return CheckListItemDetail::where('name','like','%'.$name.'%')->get();
    }



}
