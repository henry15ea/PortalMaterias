<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property string $u_id
 * @property int $u_munid
 * @property string $u_carreraid
 * @property string $u_role
 * @property string $u_nombre
 * @property string $u_apellido
 * @property int $u_edad
 * @property string $u_tel
 * @property string $u_dui
 * @property string $u_nit
 * @property string $u_carnet
 * @property string $u_mail
 * @property string $u_datereg
 * @property TblMuni $tblMuni
 * @property TblCarrera $tblCarrera
 * @property TblRoless $tblRoless
 * @property TblCuenta[] $tblCuentas
 * @property TblNota[] $tblNotas
 */
class UserModel extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'tbl_users';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'u_id';

    /**
     * The "type" of the auto-incrementing ID.
     * 
     * @var string
     */
    protected $keyType = 'string';

    /**
     * Indicates if the IDs are auto-incrementing.
     * 
     * @var bool
     */
    public $incrementing = false;

    /**
     * @var array
     */
    protected $fillable = ['u_munid', 'u_carreraid', 'u_role', 'u_nombre', 'u_apellido', 'u_edad', 'u_tel', 'u_dui', 'u_nit', 'u_carnet', 'u_mail', 'u_datereg'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tblMuni()
    {
        return $this->belongsTo('App\TblMuni', 'u_munid', 'm_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tblCarrera()
    {
        return $this->belongsTo('App\TblCarrera', 'u_carreraid', 'cid');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tblRoless()
    {
        return $this->belongsTo('App\TblRoless', 'u_role', 'rid');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tblCuentas()
    {
        return $this->hasMany('App\TblCuenta', 'c_userid', 'u_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tblNotas()
    {
        return $this->hasMany('App\TblNota', 'n_user', 'u_id');
    }
}
