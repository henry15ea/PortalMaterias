<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $d_id
 * @property string $d_nombre
 * @property TblMuni[] $tblMunis
 */
class DepartamentoModel extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'tbl_departamentos';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'd_id';

    /**
     * Indicates if the IDs are auto-incrementing.
     * 
     * @var bool
     */
    public $incrementing = false;

    /**
     * @var array
     */
    protected $fillable = ['d_nombre'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tblMunis()
    {
        return $this->hasMany('App\TblMuni', 'm_depid', 'd_id');
    }
}
