<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\ContentCreatorController;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('auth.login');
    }

    /**
     * Handle an incoming authentication request.
     *
     * @param  \App\Http\Requests\Auth\LoginRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(LoginRequest $request)
    {
        $request->authenticate();

        $request->session()->regenerate();

        $user = DB::table('users')->where('email', $request->user()->email)->get();
        // Check if a role is already assigned to this user, in case not. The Wizard was not completed, redirect to it.
        $role_id = $user[0]->role_id;

        $redirect = redirect()->intended(RouteServiceProvider::HOME);

        // In case the user doesn't have any role assigned yet, let's go to the wizard.
        if ($role_id == 0) {
            $request->session()->put('wizard', true);
            $redirect = redirect()->intended('/wizard');
        } else {
            // Set profile type and profile object for the entire session.
            $roleController = new RoleController;
            $roleController->initialize($request);

            // In case the user is Content Creator, let's initialize all the required.
            if ($request->session()->get("profile_type") == 1) {
                $profile = $request->session()->get("profile");
                $creatorController = new ContentCreatorController($profile);
                if ($creatorController->isGoogleConnected()) {
                    $request->session()->put('youtubeHandler', $creatorController);
                }
            }
        }

        return $redirect;
    }

    /**
     * Destroy an authenticated session.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request)
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }
}
