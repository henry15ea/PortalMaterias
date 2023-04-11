<?php

namespace App\Http\Controllers;

//agregando elementos a utilizar 
use App\Models\TokenUserModel;
use App\Models\CuentaModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class ApiLoginController extends Controller
{
    //funcion que toma al nombre de usuario y clave para generar un token de acceso al usuario
    public function fn_login(Request $request){

       

        if($request == null || is_null($request->carnet_id) || is_null($request->password)){
            return response()->json([
                'message' => 'Se han recivido datos vacios',
                'Errid' => '3'
            ], 401);
        }else{
             //busco al usuario por su correo o nombre de usuario
             $user = CuentaModel::where('carnet_id', $request->carnet_id)->first();
            $pass = md5($request->password);
            //$users = CuentaModel::all();

            if (!$user || $pass != $user->c_pass) {
                return response()->json([
                    'message' => 'Usuario i/o clave invalidas.',
                    'Errid' => '2'
                ], 401);
            }else{
                 // Generar un nuevo token y guardarlo en la tabla de tokens
                //creo el id unico para el registro
               
                // Crear un nuevo token de sesión con una duración de 4 horas
                
                $token = new TokenUserModel();

                $random_id = md5(rand());
                $token->id_tkn = $random_id;
                $token->user_id = $request->carnet_id;
                $token_id = md5(rand());
                $token->token_id = $token_id; // Genera un token aleatorio de 60 caracteres
                $token->token_time = date('Y-m-d H:i:s'); // Asignar la fecha y hora actual
                $token->expiration_time =  date('Y-m-d H:i:s', time() + (4 * 60 * 60)); // Duración de 4 horas 

                // Insertar el nuevo token de sesión en la base de datos
                
                try {
                    if ($token->save()){
                        return response()->json(['access_token' => $token], 200);
                    }else{
                        return response()->json(['Fallo al ingresar datos' => $e->getMessage()], 401);
                    }
                    //$token->save();
                } catch (\Illuminate\Database\QueryException $e) {
                    //dd($e->getMessage());
                    return response()->json(['Fallo al ingresar datos' => $e->getMessage()], 401);
                }
  
            }
    
            //fin 
        }
            //fin 

        return response()->json(['Invalido' => 'No se han recivido datos'], 401);
    }
        //fin fn_login
    
    //fin clase
}
