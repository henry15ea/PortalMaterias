<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property string $m_id
 * @property string $m_carreraid
 * @property string $m_nombre
 * @property string $m_noid
 * @property string $m_ciclo
 * @property string $m_unvalorativas
 * @property string $created_at
 * @property string $updated_at
 * @property int $hts
 * @property int $hps
 * @property int $ht
 * @property int $pensum_orden
 * @property TblCarrera $tblCarrera
 * @property TblRelmateria[] $tblRelmaterias
 * @property TblNota[] $tblNotas
 */
class MateriaModel extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'tbl_materias';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'm_id';

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
    protected $fillable = ['m_carreraid', 'm_nombre', 'm_noid', 'm_ciclo', 'm_unvalorativas', 'created_at', 'updated_at', 'hts', 'hps', 'ht', 'pensum_orden'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tblCarrera()
    {
        return $this->belongsTo('App\TblCarrera', 'm_carreraid', 'cid');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tblRelmaterias()
    {
        return $this->hasMany('App\TblRelmateria', 'r_relmateria', 'm_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tblNotas()
    {
        return $this->hasMany('App\TblNota', 'n_materiaid', 'm_id');
    }
}
