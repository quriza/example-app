<?php


namespace App\Http\Controllers;
use App\Models\User;

use Illuminate\Support\Facades\Route;

class UserController extends Controller
{
    public static function routers()
    {
        Route::group(
            [
                'prefix' => 'users',
            ],
            function () {
                Route::get('/user/{id}', [UserController::class, 'show']);
            });
    }

    /**
     * Show the profile for a given user.
     *
     * @param  int  $id
     * @return \Illuminate\View\View
     */
    public function show($id)
    {
        \DB::statement("select 1");
        return json_encode(true);
    }
}
