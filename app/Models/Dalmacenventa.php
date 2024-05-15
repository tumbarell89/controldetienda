<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Dalmacenventa
 *
 * @property $id
 * @property $cantidad
 * @property $valamcens_id
 * @property $dproductos_id
 * @property $created_at
 * @property $updated_at
 *
 * @property Dproducto $dproducto
 * @property Nalmacen $nalmacen
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Dalmacenventa extends Model
{
    
    protected $perPage = 20;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['cantidad', 'valamcens_id', 'dproductos_id'];


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
        return $this->belongsTo(\App\Models\Nalmacen::class, 'valamcens_id', 'id');
    }
    
}
