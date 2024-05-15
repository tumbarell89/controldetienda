<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Dalmaceninterno
 *
 * @property $id
 * @property $cantidad
 * @property $ialmacens_id
 * @property $dproductos_id
 * @property $created_at
 * @property $updated_at
 *
 * @property Dproducto $dproducto
 * @property Nalmacen $nalmacen
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Dalmaceninterno extends Model
{
    
    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['cantidad', 'ialmacens_id', 'dproductos_id'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function dproducto()
    {
        return $this->belongsTo(\App\Models\Dproducto::class, 'dproductos_id', 'id');
    }
    
    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function nalmacen()
    {
        return $this->belongsTo(\App\Models\Nalmacen::class, 'ialmacens_id', 'id');
    }
    
}
