<?php

namespace App\Http\Controllers;

use App\Models\Creator;
use Illuminate\Http\Request;

class ContentCreatorController extends Controller
{
    /**
     * Constructor del controlador del creador de contenido
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct($profile = null)
    {
        if (empty($profile)) { $profile = ''; }
        $this->creatorController = $profile;
    }

    /**
     * Crear un nuevo Creador de contenido con esta funcion en la base de datos.
     *
     * @return \Illuminate\Http\Response
     * @param \App\Models\Creator
     */
    public function create(Creator $creator)
    {
        $creator->save();
    }

    /**
     * Funcion para saber si un creador de contenido tiene conectada su cuenta de Youtube.
     *
     */

    public function isGoogleConnected()
    {
        $isConnected = false;
        $token = self::getGoogleAccessToken();
        if (strlen($token) > 0) {
            $isConnected = true;
        }
        return $isConnected;
    }

    /**
     * Funcion para guardar las credenciales de Google en la base de datos.
     *
     */

    public function storeGoogleCredentials($access_key, $refresh_token)
    {
        $this->creatorController->google_access_token = $access_key;
        $this->creatorController->google_refresh_token = $refresh_token;
        $this->creatorController->save();
    }

     /**
     * Funcion para obtener el AccessToken de Google sobre un creador de contenido.
     *
     */

    public function getGoogleAccessToken()
    {
        return $this->creatorController->google_access_token;
    }

      /**
     * Funcion para obtener el RefreshToken (Necesario para actualizar los Token de la API) de Google sobre un creador de contenido.
     *
     */

    public function getGoogleRefreshToken()
    {
        return $this->creatorController->google_refresh_token;
    }

    /**
     * Buscar en la base de datos un creador de contenido basandose en el ID.
     *
     * @param  Integer  $creator:id
     * @return \App\Models\Creator
     */
    public function get($creator_id)
    {
        return Creator::find($creator_id);
    }

    /**
     * Editar los valores de un Creador de contenido en la base de datos.
     *
     * @param  Request  $request
     * @return \App\Models\ContentCreator->id
     */
    // Edito los valores recogiendo una peticion POST.
    public function edit(Request $request)
    {
        $user_id = $request->post('creator_id');
        $new_name = $request->post('real_name');
        $new_email = $request->post('description');
        $user = Creator::find($user_id);
        $user->real_name = $new_name;
        $user->description = $new_email;
        $user->save();

        return $user->id;
    }

    public function toString()
    {
        return $this->creatorController->google_access_token;
    }
}
