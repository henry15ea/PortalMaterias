<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property string $f_id
 * @property string $f_nombre
 * @property string $f_detalle
 * @property TblCarrera[] $tblCarreras
 */
class FacultadModel extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'tbl_facultads';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'f_id';

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
    protected $fillable = ['f_nombre', 'f_detalle'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tblCarreras()
    {
        return $this->hasMany('App\TblCarrera', 'c_facdid', 'f_id');
    }
}
