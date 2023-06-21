<?php

namespace App\Http\Controllers;

use App\Models\CheckList;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CheckListController extends Controller
{

    public function index()
    {
        return CheckList::all();
    }



    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required'
        ]);
        return CheckList::create($request->all());
    }



    public function showCheckLists($id)
    {
        //  return CheckList::findOrFail($id);
        //return CheckList::where('user_lists_id',$id)->get();

    }



    public function show($id)
    {


        $checklistItems = DB::table('check_lists')
            ->join('category_items', 'category_items.id', '=', 'check_lists.category_items_id')
            ->join('categories', 'category_items.category_id', '=', 'categories.id')
            ->select('check_lists.id', 'check_lists.checked', 'check_lists.user_lists_id', 'check_lists.category_items_id', 'category_items.name as item', 'categories.name as category')
            ->where('check_lists.user_lists_id', $id)
            ->get();


        //return CheckList::findOrFail($id);
        return $checklistItems;
        // return CheckList::where('users_id',$id)->get();

    }




    public function update(Request $request, $id)
    {
        $CheckList = CheckList::findOrFail($id);
        $CheckList->update($request->all());
        return $CheckList;
    }





    public function destroy($id)
    {
        return CheckList::destroy($id);
    }




    public function search($name)
    {
        return CheckList::where('name', 'like', '%' . $name . '%')->get();
    }
}
