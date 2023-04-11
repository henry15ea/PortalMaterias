<?php

namespace App\Http\Controllers;

use App\Models\TokenUserModel;
use App\Models\UserModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Laravel\Lumen\Routing\Controller as carreraControl;
use  App\Http\Controllers\Modules\tokenChecker;

class PerfilController extends Controller
{
    //datos de la cuenta del usuario]
    public function fn_datos_usuario(Request $request){
          
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
                    $datos_cuenta = new UserModel();
                    $listado_final = [];

                    //info del carnet 
                    $carnet = $request->carnet_id;

                    //listo todas las carreras disponibles
                   // $listado = $datos_cuenta->where('u_carnet','<>',$carnet)
                   // ->get(['u_nombre','u_apellido','u_edad','u_tel']);

                    $listado = $datos_cuenta::select([
                        'u_nombre','u_apellido','u_edad','u_tel','u_dui','u_nit','u_carnet','u_mail',
                        'r_role',
                        'cnombre',
                        'm_nombre'
                    ])->where('u_carnet','=',$carnet)
                    ->join('tbl_munis','tbl_users.u_munid','=','tbl_munis.m_nombre')
                    ->join('tbl_carreras','tbl_users.u_carreraid','=','tbl_carreras.cid')
                    ->join('tbl_roless','tbl_users.u_role','=','tbl_roless.rid')
                    ->first();
                    //where('u_carnet',$carnet)->first()

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
                ], 200);
            }
            
        }
    }
    //fin fn_pefil
}
