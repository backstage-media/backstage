<?php

namespace Tests\Feature\Auth;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;


class UserActionsTest extends TestCase
{
    use RefreshDatabase;

    public function test_users_can_set_as_creator_after_login()
    {
        $user = User::factory()->create();

        $response = $this->post('/login', [
            'email' => $user->email,
            'password' => 'password',
        ]);

        $this->assertAuthenticated();
        
        $response->assertRedirect('/wizard');

        $this->followRedirects($response);

        $response = $this->json('POST', '/wizard/submit', [
            'user-role' => 'creator',
            'user-description' => 'Profile created by PHPUnit',
            'user-name' => 'PHPUnit User'
        ]);

        $response->assertStatus(200);
    }

    public function test_users_can_set_as_manager_after_login()
    {
        $user = User::factory()->create();

        $response = $this->post('/login', [
            'email' => $user->email,
            'password' => 'password',
        ]);

        $this->assertAuthenticated();
        
        $response->assertRedirect('/wizard');

        $this->followRedirects($response);

        $response = $this->json('POST', '/wizard/submit', [
            'user-role' => 'manager',
            'user-description' => 'Profile created by PHPUnit',
            'user-name' => 'PHPUnit User'
        ]);

        $response->assertStatus(200);
    }

    public function test_users_can_connect_youtube_after_login()
    {
        $user = User::factory()->create();

        $response = $this->post('/login', [
            'email' => $user->email,
            'password' => 'password',
        ]);

        $this->assertAuthenticated();
        
        $response->assertRedirect('/wizard');

        $response = $this->get('/login/google');

        $response->assertRedirect();

    }




}
