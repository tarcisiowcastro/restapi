<?php

namespace App\Http\Controllers;

use App\Models\UserList;
use Illuminate\Http\Request;

class UserListController extends Controller
{

    public function index()
    {
        return UserList::all();
    }



    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required'
        ]);
        return UserList::create($request->all());
    }



    public function showUserLists($id)
    {
      //  return UserList::findOrFail($id);
      return UserList::where('users_id',$id)->get();
  
    }



    public function show($id)
    {
      return UserList::findOrFail($id);
     // return UserList::where('users_id',$id)->get();
  
    }




    public function update(Request $request, $id)
    {
        $UserList = UserList::findOrFail($id);
        $UserList->update($request->all());
        return $UserList;
    }





    public function destroy($id)
    {
        return UserList::destroy($id);
    }




    public function search($name)
    {
    return UserList::where('name','like','%'.$name.'%')->get();
    }



}
