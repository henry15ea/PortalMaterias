<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $r_id
 * @property string $r_materia_base
 * @property string $r_relmateria
 * @property TblMateria $tblMateria
 */
class RelMateriaModel extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'tbl_relmaterias';

    /**
     * Indicates if the IDs are auto-incrementing.
     * 
     * @var bool
     */
    public $incrementing = false;
    /**
     * @var array
     */
    protected $fillable = ['r_relmateria'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tblMateria()
    {
        return $this->belongsTo('App\TblMateria', 'r_relmateria', 'm_id');
    }
}
