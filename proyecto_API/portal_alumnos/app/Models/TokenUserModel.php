<?php


namespace App\Models;
use Illuminate\Database\Eloquent\Model;

/**
 * @property string $id_tkn
 * @property string $token_id
 * @property string $user_id
 * @property string $token_time
 * @property string $expiration_time
 * @property TblCuenta $tblCuenta
 */
class TokenUserModel extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'tbl_tokenUsers';

   
    //protected $primaryKey = 'id_tkn';
    public $incrementing = false;
    //public $timestamps = false; // Deshabilitar marca de tiempo creado/modificado
    /**
     * @var array
     */
    protected $fillable = ['id_tkn','user_id', 'token_id','token_time', 'expiration_time'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tblCuenta()
    {
        return $this->belongsTo('App\TblCuenta', 'user_id', 'carnet_id');
    }
}
