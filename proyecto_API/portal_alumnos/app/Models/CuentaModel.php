<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property string $carnet_id
 * @property string $c_userid
 * @property string $c_pass
 * @property string $c_alternativepass
 * @property string $c_datereg
 * @property TblUser $tblUser
 */
class CuentaModel extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'tbl_cuentas';

    /**
     * Indicates if the IDs are auto-incrementing.
     * 
     * @var bool
     */
    public $incrementing = false;

    /**
     * @var array
     */
    protected $fillable = ['carnet_id','c_pass', 'c_alternativepass', 'c_datereg'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tblUser()
    {
        return $this->belongsTo('App\TblUser', 'c_userid', 'u_id');
    }
}
