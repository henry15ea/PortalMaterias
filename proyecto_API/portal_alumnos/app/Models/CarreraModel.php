<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property string $cid
 * @property string $c_facdid
 * @property string $cnombre
 * @property string $cdet
 * @property TblFacultad $tblFacultad
 * @property TblUser[] $tblUsers
 * @property TblMateria[] $tblMaterias
 */
class CarreraModel extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'tbl_carreras';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'cid';

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
    protected $fillable = ['c_facdid', 'cnombre', 'cdet'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tblFacultad()
    {
        return $this->belongsTo('App\TblFacultad', 'c_facdid', 'f_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tblUsers()
    {
        return $this->hasMany('App\TblUser', 'u_carreraid', 'cid');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tblMaterias()
    {
        return $this->hasMany('App\TblMateria', 'm_carreraid', 'cid');
    }
}
