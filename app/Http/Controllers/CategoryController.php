<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{

    public function index()
    {
        return Category::all();
    }



    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required'
        ]);
        return Category::create($request->all());
    }



    public function showCategoriesUser($id)
    {
      //  return Category::findOrFail($id);
      return Category::where('users_id',$id)->get();
  
    }



    public function showCategory($id)
    {
      return Category::findOrFail($id);
     // return Category::where('users_id',$id)->get();
  
    }




    public function update(Request $request, $id)
    {
        $Category = Category::findOrFail($id);
        $Category->update($request->all());
        return $Category;
    }





    public function destroy($id)
    {
        return Category::destroy($id);
    }




    public function search($name)
    {
    return Category::where('name','like','%'.$name.'%')->get();
    }



}
