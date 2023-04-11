<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $m_id
 * @property int $m_depid
 * @property string $m_nombre
 * @property TblDepartamento $tblDepartamento
 * @property TblUser[] $tblUsers
 */
class MunicipioModel extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'tbl_munis';

    /**
     * @var array
     */
    protected $fillable = ['m_nombre'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tblDepartamento()
    {
        return $this->belongsTo('App\TblDepartamento', 'm_depid', 'd_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tblUsers()
    {
        return $this->hasMany('App\TblUser', 'u_munid', 'm_id');
    }
}
