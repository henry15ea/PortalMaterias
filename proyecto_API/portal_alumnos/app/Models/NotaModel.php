<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property string $n_id
 * @property string $n_user
 * @property string $n_materiaid
 * @property string $n_nota
 * @property TblUser $tblUser
 * @property TblMateria $tblMateria
 */
class NotaModel extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'tbl_notas';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'n_id';

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
    protected $fillable = ['n_user', 'n_materiaid', 'n_nota'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tblUser()
    {
        return $this->belongsTo('App\TblUser', 'n_user', 'u_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tblMateria()
    {
        return $this->belongsTo('App\TblMateria', 'n_materiaid', 'm_id');
    }
}
