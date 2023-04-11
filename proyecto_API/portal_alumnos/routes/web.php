<?php

/** @var \Laravel\Lumen\Routing\Router $router */
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->post('/login', 'ApiLoginController@fn_login');
// rutas para obtener la lista de carreras y facultades
$router->post('/carreralist', 'CarreraController@fn_listadoCarreras');
$router->post('/facultadlist', 'CarreraController@fn_listadoFacultades');
//ruta acerca de la cuenta de usuario
$router->post('/perfil', 'PerfilController@fn_datos_usuario');
//ruta para obtener el listado de materias segun el id_hash de la carrera
$router->post('/listadomaterias', 'MateriasController@fn_listadoMateriasByCarrera');
$router->post('/materialrel', 'MateriasController@fn_listadoMateriasByPrerreq');