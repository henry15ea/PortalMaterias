<?php
namespace App\Http\Controllers\Modules;

use App\Models\TokenUserModel;

class tokenChecker{
    public function fn_tokencheck($token_data){
         $access = false;
         $token_db = new TokenUserModel();
         //obtengo la fecha y hora del sistema 
         $time_now = date('Y-m-d H:i:s');
         //abrimos la conexion al controller 
         
         $expiration_tokendb = TokenUserModel::where('token_id',$token_data)->first();
        
         if ($time_now >= $expiration_tokendb->expiration_time){
            $access = true;
         }else{
            $access = false;

         }
         //retornamos el valor
        return $access; 
    }
}
