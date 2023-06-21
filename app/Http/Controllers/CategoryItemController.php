<?php

namespace App\Http\Controllers;

use App\Models\CategoryItem;
use Illuminate\Http\Request;

class CategoryItemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return CategoryItem::all();
    }


    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required'
        ]);
        return CategoryItem::create($request->all());
    }



    public function showCategoryItems($id)
    {
        return CategoryItem::where('category_id',$id)->get();
    }



    public function show($id)
    {
        return CategoryItem::findOrFail($id);
    }




    public function update(Request $request, $id)
    {
        $item = CategoryItem::findOrFail($id);
        $item->update($request->all());
        return $item;
    }



    public function destroy($id)
    {
        return CategoryItem::destroy($id);
    }



    public function search($nome)
    {
        return CategoryItem::where('name', 'like', '%' . $nome . '%')->get();
    }
}
