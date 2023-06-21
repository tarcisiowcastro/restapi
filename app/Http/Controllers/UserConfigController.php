<?php

namespace App\Http\Controllers;

use App\Models\UserConfig;
use Illuminate\Http\Request;

class UserConfigController extends Controller
{
 
   public function showConfigUser($id)
    {
        return UserConfig::where('users_id',$id)->get();
    }
    
   public function update(Request $request, $id)
    {
        $UserConfig = UserConfig::where('users_id',$id)->first();
        $UserConfig->update($request->all());
        return $UserConfig;
    }



}