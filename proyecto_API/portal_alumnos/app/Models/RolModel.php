<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

/**
 * @property string $rid
 * @property string $r_role
 * @property string $r_detalle
 * @property TblUser[] $tblUsers
 */
class RolModel extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'tbl_roless';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'rid';

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
    protected $fillable = ['r_role', 'r_detalle'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tblUsers()
    {
        return $this->hasMany('App\TblUser', 'u_role', 'rid');
    }
}
