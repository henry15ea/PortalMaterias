<?php

namespace App\Http\Controllers;

use App\Models\TokenUserModel;
use App\Models\MateriaModel;
use App\Models\RelMateriaModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use  App\Http\Controllers\Modules\tokenChecker;
use Laravel\Lumen\Routing\Controller;

class MateriasController extends Controller
{
    //funcion que retorna el listado de materias segun la carrera que se haya seleccionado o pasado como
    //argumento 
    public function fn_listadoMateriasByCarrera(Request $request){
        $data = null;

        if ($request == null || $request->carnet_id == null || $request->carrera_id == null){
            return response()->json([
                'message' => 'Se han recivido datos vacios',
                'Errid' => '3'
            ], 401);

        }else{
            //obtengo el token que el usuario posee
            $token_req = $request->token_id;
            $carrera_id =  $request->carrera_id;
            $carnet = $request->carnet_id;

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
                    $datos_db = new MateriaModel();
                    $listado_final = [];

                    //info del carnet 
                    $carnet = $request->carnet_id;

                  
                    $listado = $datos_db::select([
                        'm_id','m_nombre','cnombre','m_noid','m_ciclo','m_unvalorativas','hts',
                        'hps','ht','pensum_orden'
                    ])->where('m_carreraid','=',$carrera_id)
                    ->join('tbl_carreras','tbl_materias.m_carreraid','=','tbl_carreras.cid')
                    ->get();
                    
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

    //funcion que retorna aquellas materias que estan relacionadas a una materia en especifico
    public function fn_listadoMateriasByPrerreq(Request $request){
        $data = null;

        if ($request == null || $request->carnet_id == null || $request->materia_id == null || $request->carrera_id == null){
            return response()->json([
                'message' => 'Se han recivido datos vacios',
                'Errid' => '3'
            ], 401);

        }else{
            //obtengo el token que el usuario posee
            $token_req = $request->token_id;
            $carrera_id =  $request->carrera_id;
            $carnet = $request->carnet_id;
            $materia =$request->materia_id;

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
                    $datos_db = new RelMateriaModel();
                    $listado_final = [];

            

/*
                        'm_id','m_nombre','cnombre','m_noid','m_ciclo','m_unvalorativas','hts',

*/                  
                    $listado = $datos_db::select([
                        'm_id','m_nombre','m_noid','m_ciclo','m_unvalorativas','hts','hps','ht','pensum_orden'

                    ])->where('r_materia_base','=',$materia)
                    ->join('tbl_materias','tbl_relmaterias.r_relmateria','=','tbl_materias.m_id')
                    ->get();
                    
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
}
