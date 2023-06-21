<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserConfigController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CategoryItemController;
use App\Http\Controllers\CheckListController;
use App\Http\Controllers\CheckListItemDetailController;



Route::controller(UserConfigController::class)->group(function () {
    Route::get('/configs/user/{id}', 'showConfigUser');
    Route::post('/configs/user/{id}', 'update');   
});

Route::controller(CategoryController::class)->group(function () {
    Route::get('/categories/user/{id}', 'showCategoriesUser');
    Route::put('/categories/', 'store');
    Route::get('/categories/{id}', 'showCategory');
    Route::post('/categories/{id}', 'update');
    Route::delete('/categories/{id}', 'destroy');
});

Route::controller(CategoryItemController::class)->group(function () {
    Route::get('/items/category/{id}', 'showCategoryItems');
    Route::get('/items/{id}', 'show');
    Route::put('/items/', 'store');
    Route::post('/items/{id}', 'update');
    Route::delete('/items/{id}', 'destroy');
});

Route::controller(UserList::class)->group(function () {
    Route::get('/lists/user/{id}', 'showUserlists');
    Route::get('/lists/{id}', 'show');
    Route::put('/lists/', 'store');
    Route::post('/lists/{id}', 'update');
    Route::delete('/lists/{id}', 'destroy');
});

Route::controller(CheckListController::class)->group(function () {
    //Route::get('/lists/user/{id}', 'showUserlists');
    Route::get('/checklists/{id}', 'show');
    Route::put('/checklists/', 'store');
    Route::post('/checklists/{id}', 'update');
    Route::delete('/checklists/{id}', 'destroy');
});

Route::controller(CheckListItemDetailController::class)->group(function () {
   // Route::get('/lists/user/{id}', 'showUserlists');
    Route::get('/checklist_details/{id}', 'show');
    Route::put('/checklist_details/', 'store');
    Route::post('/checklist_details/{id}', 'update');
    Route::delete('/checklist_details/{id}', 'destroy');
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
