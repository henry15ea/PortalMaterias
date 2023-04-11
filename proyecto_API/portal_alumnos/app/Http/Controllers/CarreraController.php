<?php

namespace App\Http\Controllers;

//agregando elementos a utilizar 
use App\Models\TokenUserModel;
use App\Models\CarreraModel;
use App\Models\FacultadModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Laravel\Lumen\Routing\Controller as carreraControl;
use  App\Http\Controllers\Modules\tokenChecker;

class CarreraController extends Controller
{
    //retorna el listado de las carreras disponibles 
    public function fn_listadoCarreras(Request $request){
        
        $data = null;

        if ($request == null){
            return response()->json([
                'message' => 'Se han recivido datos vacios',
                'Errid' => '3'
            ], 401);

        }else{
            //obtengo el token que el usuario posee
            $token_req = $request->token_id;


            if ($token_req == null){
                return response()->json([
                    'message' => 'No se obtuvo el token de acceso',
                    'datos' => null,
                    'Errid' => '0'
                ], 401);

            }else{
                //llamo al modulo que se encarga de verificar el estado del token
                $token_state = new tokenChecker();

                if($token_state->fn_tokencheck($token_req) == true){
                    //el token ha expirado
                    $data = [
                        'tokenStatus'=> 'El token ha expirado',
                        'token_id' => $token_req,
                        'data' => null
                    ];
                    
        
                }else{
                    //el token sigue vigente 
                    $listado_careras = new CarreraModel();
                    $listado_final = [];
                    //listo todas las carreras disponibles
                    $listado = $listado_careras->where('cnombre','<>','General')->get(['cid','cnombre']);

                    

                    $data = [
                        'tokenStatus'=> 'El token esta activo',
                        'token_id' => $token_req,
                        'token_id' => $token_req,
                        'data' => $listado
                    ];
                }
                return response()->json([
                    'estado' => $data,
                    'Errid' => '0'
                ], 401);
            }
            
        }
    }
    //fin fn_listadoCarreras
    //**listado de las facultades en la universidad */
    public function fn_listadoFacultades(Request $request){
        
        $data = null;

        if ($request == null){
            return response()->json([
                'message' => 'Se han recivido datos vacios',
                'Errid' => '3'
            ], 401);

        }else{
            //obtengo el token que el usuario posee
            $token_req = $request->token_id;


            if ($token_req == null){
                return response()->json([
                    'message' => 'No se obtuvo el token de acceso',
                    'datos' => null,
                    'Errid' => '0'
                ], 401);

            }else{
                //llamo al modulo que se encarga de verificar el estado del token
                $token_state = new tokenChecker();

                if($token_state->fn_tokencheck($token_req) == true){
                    //el token ha expirado
                    $data = [
                        'tokenStatus'=> 'El token ha expirado',
                        'token_id' => $token_req,
                        'data' => null
                    ];
                    
        
                }else{
                    //el token sigue vigente 
                    $listado_facultad = new FacultadModel();
                    $listado_final = [];
                    //listo todas las carreras disponibles
                    $listado = $listado_facultad->where('f_id','<>','e1cbeba84b8b303341b190dfb02acfb2')
                    ->where('f_id','<>','a969bdf1b3c0706b3ee00d4538acbdf9')
                    ->get(['f_nombre','f_detalle']);

                    

                    $data = [
                        'tokenStatus'=> 'El token esta activo',
                        'token_id' => $token_req,
                        'token_id' => $token_req,
                        'data' => $listado
                    ];
                }
                return response()->json([
                    'estado' => $data,
                    'Errid' => '0'
                ], 401);
            }
            
        }
    }
}
